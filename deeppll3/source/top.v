`timescale 1ns / 1ps

module top (
    // 系统
    input  wire        Ext_Clk,        // 外部 50MHz
    input  wire        Ext_Rst_n,      // 外部复位，低有效

    // AD9226 通道 A
    input  wire [11:0] Adc_In_A,
    input  wire        Otr_A,
    output wire        Adc_Clk_A,

    // Test: 内部 NCO 方波输出（迟滞比较器，消除过零点抖动）
    output wire        Test
);

//==================================================================
// 1. 时钟与复位
//==================================================================
wire clk_100mhz;
wire pll_locked;
wire sys_rst_n = pll_locked & Ext_Rst_n;

clk_wiz_0 u_pll (
    .clk_in1  (Ext_Clk),
    .reset    (~Ext_Rst_n),
    .clk_out1 (clk_100mhz),
    .locked   (pll_locked)
);

// 100kHz 采样时钟生成（从 100MHz 分频）
reg [9:0]  clk_div_cnt;
reg        clk_100khz;

always @(posedge clk_100mhz) begin
    if (!sys_rst_n) begin
        clk_div_cnt <= 0;
        clk_100khz  <= 1'b0;
    end else if (clk_div_cnt == 499) begin  // 100M / 100k / 2 = 500
        clk_div_cnt <= 0;
        clk_100khz  <= ~clk_100khz;
    end else begin
        clk_div_cnt <= clk_div_cnt + 1;
    end
end

assign Adc_Clk_A = clk_100khz;

//==================================================================
// 2. 内部 DDS / NCO（频率由环路反馈控制）
//==================================================================
localparam PHASE_INC_CENTER = 32'd429496730;   // 10kHz @ 100kHz clk

// 反馈增益：值越大牵引范围越窄，环路越稳定
localparam FB_GAIN_SHIFT = 6'd8;

// 最终相位增量 = 中心频率 - 反馈量（负反馈）
// phase_inc 是由 FIR 输出反馈驱动的 wire（定义在 §4a）
wire [31:0] phase_inc;

// DDS 配置有效信号（一直拉高）
reg config_valid;
always @(posedge clk_100khz or negedge sys_rst_n) begin
    if (!sys_rst_n)
        config_valid <= 1'b0;
    else
        config_valid <= 1'b1;
end

// DDS 输出
wire [15:0] nco_sin_16;
dds_compiler_0 u_nco (
    .aclk                 (clk_100khz),
    .s_axis_config_tvalid (config_valid),
    .s_axis_config_tdata  (phase_inc),
    .m_axis_data_tvalid   (),
    .m_axis_data_tdata    (nco_sin_16),
    .m_axis_phase_tvalid  (),
    .m_axis_phase_tdata   ()
);

// DDS 输出已经是 Twos_Complement 有符号格式
wire signed [11:0] nco_sin;
assign nco_sin = nco_sin_16[11:0];

// Test 脚：迟滞比较器输出 → 方波（消除过零点抖动）
// 阈值 ±200（满量程 ~±2047），避免零点附近微小幅值波动导致边沿抖动
reg test_q;
always @(posedge clk_100khz) begin
    if (nco_sin > 16'sd200)
        test_q <= 1'b1;
    else if (nco_sin < -16'sd200)
        test_q <= 1'b0;
    // 在 [-200, 200] 之间保持上次状态，不过零翻转
end
assign Test = test_q;

//==================================================================
// 3. 鉴相乘法器
//==================================================================
wire signed [11:0] ref_signed;
assign ref_signed = {~Adc_In_A[11], Adc_In_A[10:0]};  // offset binary → 2's complement

wire signed [23:0] mult_out;
multiplier u_mult (
    .CLK (clk_100khz),
    .A   (ref_signed),
    .B   (nco_sin),
    .P   (mult_out)
);

//==================================================================
// 4. 环路滤波器 (FIR)
//==================================================================
wire signed [33:0] fir_out_raw;     // FIR IP 输出 34 位
wire fir_tvalid;

myfir u_fir (
    .aclk               (clk_100khz),
    .s_axis_data_tvalid (1'b1),
    .s_axis_data_tready (),
    .s_axis_data_tdata  (mult_out[23:8]),   // 24→16位，取高16位
    .m_axis_data_tvalid (fir_tvalid),
    .m_axis_data_tdata  (fir_out_raw)
);

// FIR 输出截高 16 位用于显示
wire signed [15:0] fir_disp = fir_out_raw[33:18];

//==================================================================
// 4a. 环路反馈：比例控制（FIR 输出 → DDS 频率控制）
//==================================================================
// 有符号算术右移，保留极性
//   fir_out > 0 → phase_inc 减小 → NCO 频率降低
//   fir_out < 0 → phase_inc 增大 → NCO 频率升高（追赶）
wire signed [33:0] fb_full = fir_out_raw >>> FB_GAIN_SHIFT;
wire signed [31:0] fb_delta = fb_full[31:0];

// phase_inc = 中心 - 反馈（无符号减法，2's complement 自动处理）
assign phase_inc = PHASE_INC_CENTER - fb_delta;

//==================================================================
// 5. ILA 调试
//==================================================================
ila_0 u_ila (
    .clk    (clk_100mhz),
    .probe0 (Adc_In_A[11:0]),        // 12: ADC 输入
    .probe1 (nco_sin[11:0]),         // 12: DDS 正弦波
    .probe2 (mult_out[23:0]),        // 24: 乘积
    .probe3 (fir_disp),             // 16: FIR 输出
    .probe4 (phase_inc[31:16]),        // 16: 频率控制字（观察锁定过程）
    .probe5 ({sys_rst_n, pll_locked, fir_tvalid})  // 3: 状态信号
);


endmodule
