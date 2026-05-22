//==================================================================
// AD9833 通用控制器
//
// 仿照 STM32 驱动 (ad9833.c/ad9833.h) 的功能接口设计，
// 支持动态配置波形、频率、相位、输出使能。
//
// SPI Mode 2 (CPOL=1, CPHA=0)
//   空闲: SCK=1
//   下降沿: AD9833 采样数据
//   上升沿: FPGA 改变 MOSI
//
// SPI 时序 (3-phase):
//   phase 1: MOSI 已更新, 等待半周期建立时间
//   phase 2: SCK 下降 → AD9833 锁存
//   phase 3: SCK 上升 → 切换 MOSI 到下一 bit
//
// 使用方法:
//   1. 设置 wave_sel / freq_tune / phase_val / out_en
//   2. 给出一个 start 脉冲
//   3. 等待 busy 变低，配置完成
//
// 频率字计算:
//   freq_tune = (freq_Hz / FMCLK) * 2^28
//   例如 10kHz / 25MHz * 2^28 ≈ 107374 = 28'd107374
//
// 波形选择:
//   wave_sel=00  正弦波 (sine)
//   wave_sel=01  三角波 (triangle)
//   wave_sel=10  方波/2 (square, 二分频)
//   wave_sel=11  方波   (square, 不二分频)
//==================================================================
module ad9833 #(
    parameter FMCLK   = 25000000,    // AD9833 参考时钟频率 (仅注释)
    parameter SPI_DIV = 0            // SPI 分频系数: 0=最快, N=(N+1)*2 倍分频
) (
    input  wire        clk,        // 系统时钟
    input  wire        rst_n,      // 异步复位，低有效

    // 配置接口
    input  wire        start,      // 上升沿触发一次配置
    input  wire [27:0] freq_tune,  // 28 位频率字 (tuning word)
    input  wire [1:0]  wave_sel,   // 波形选择 (见上)
    input  wire [11:0] phase_val,  // 12 位相位值 (0-4095, 对应 0-360°)
    input  wire        out_en,     // 输出使能 (1=输出, 0=关闭)

    // 状态
    output reg         busy,       // 1=正在配置中

    // SPI 接口 (连接 AD9833)
    output reg         sck,
    output reg         mosi,
    output reg         cs_n
);

    //==================================================================
    // 寄存器地址 / 控制位定义
    //==================================================================
    localparam B28_BIT    = 13;
    localparam HLB_BIT    = 12;
    localparam F_SEL_BIT  = 11;
    localparam P_SEL_BIT  = 10;
    localparam RESET_BIT  = 8;
    localparam SLEEP1_BIT = 7;
    localparam SLEEP12_BIT= 6;
    localparam OPBITEN_BIT= 5;
    localparam DIV2_BIT   = 3;
    localparam MODE_BIT   = 1;

    localparam CFG_RESET  = 16'h2100;   // B28=1, RESET=1
    localparam CFG_RUN    = 16'h2000;   // B28=1, RESET=0

    //--- SPI tick 生成移到了 state 声明之后 ---

    //==================================================================
    // 内部寄存器
    //==================================================================
    reg [15:0] cfg_run;

    // 待发送 word 队列 (5 words: RESET + FREQ_L + FREQ_H + PHASE + RUN)
    reg [15:0] words [0:4];
    reg [2:0]  word_cnt;
    reg [2:0]  word_idx;

    // 状态机
    localparam S_IDLE      = 0;
    localparam S_PREPARE   = 1;
    localparam S_LOAD      = 2;
    localparam S_BIT       = 3;   // SPI 发送 (1ph=wait, 2ph=fall, 3ph=rise+shift)
    localparam S_CS_DLY    = 4;

    reg [2:0]  state;
    reg [15:0] tx_data;
    reg [3:0]  bit_cnt;
    reg [1:0]  spi_phase;   // 1,2,3 (3-phase SPI)
    reg [3:0]  wait_cnt;

    //==================================================================
    // SPI 时钟分频
    // SPI_DIV=0:  每个 bit 3 个 sysclk, SCK ≈ sysclk/6
    // SPI_DIV=N>0: 每个 bit (N+1)*3 个 sysclk
    // 系统时钟 50MHz:
    //   DIV=0  → SCK ≈ 8.3 MHz
    //   DIV=1  → SCK ≈ 4.2 MHz
    //   DIV=10 → SCK ≈ 0.76 MHz
    //   DIV=50 → SCK ≈ 0.16 MHz
    //==================================================================
    localparam CS_DLY_MAX  = 10;   // 100ns @ 100MHz，AD9833 FSYNC高电平最小保持时间约40ns
    localparam BIT_CLKS = (SPI_DIV + 1) * 3;

    reg [31:0] spi_clk_cnt;
    reg        spi_tick;        // 每 BIT_CLKS 个 sysclk 产生一个 tick
    reg        spi_tick_r;
    wire       spi_tick_rise = spi_tick & ~spi_tick_r;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            spi_clk_cnt <= 0;
            spi_tick    <= 1'b0;
        end else if (state == S_IDLE || state == S_CS_DLY) begin
            spi_clk_cnt <= 0;
            spi_tick    <= 1'b0;
        end else begin
            if (spi_clk_cnt >= BIT_CLKS - 1) begin
                spi_clk_cnt <= 0;
                spi_tick    <= 1'b1;
            end else begin
                spi_clk_cnt <= spi_clk_cnt + 1;
                spi_tick    <= 1'b0;
            end
        end
    end

    always @(posedge clk) spi_tick_r <= spi_tick;

    //==================================================================
    // 第一个 bit 组合逻辑
    //==================================================================
    reg first_bit;
    always @(*) begin
        first_bit = 1'b0;
        if (state == S_LOAD) begin
            case (word_idx)
                0: first_bit = words[0][15];
                1: first_bit = words[1][15];
                2: first_bit = words[2][15];
                3: first_bit = words[3][15];
                4: first_bit = words[4][15];
                default: first_bit = 1'b0;
            endcase
        end
    end

    //==================================================================
    // 运行控制寄存器组合逻辑
    //==================================================================
    always @(*) begin
        cfg_run = 16'h0000;
        cfg_run[B28_BIT]    = 1'b1;
        cfg_run[RESET_BIT]  = ~out_en;
        case (wave_sel)
            2'b00: ;
            2'b01: cfg_run[MODE_BIT] = 1'b1;
            2'b10: begin
                cfg_run[OPBITEN_BIT] = 1'b1;
                cfg_run[DIV2_BIT]    = 1'b1;
            end
            2'b11: cfg_run[OPBITEN_BIT] = 1'b1;
        endcase
    end

    //==================================================================
    // 主状态机
    // SPI 时钟在 S_BIT 中由 spi_tick 驱动
    // 3-phase SPI (phase 1/2/3):
    //   phase 1: SCK=1, MOSI 稳定 (建立时间)
    //   phase 2: SCK=0, AD9833 下降沿采样
    //   phase 3: SCK=1, 更新 MOSI 到下一 bit
    //==================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            word_idx  <= 0;
            word_cnt  <= 0;
            bit_cnt   <= 0;
            spi_phase <= 1;
            tx_data   <= 0;
            wait_cnt  <= 0;
            busy      <= 1'b0;
            sck       <= 1'b1;
            mosi      <= 1'b0;
            cs_n      <= 1'b1;
            words[0]  <= 0;
            words[1]  <= 0;
            words[2]  <= 0;
            words[3]  <= 0;
            words[4]  <= 0;
        end else begin
            case (state)

                //----------------------------------------------
                // S_IDLE
                //----------------------------------------------
                S_IDLE: begin
                    busy  <= 1'b0;
                    cs_n  <= 1'b1;
                    sck   <= 1'b1;
                    mosi  <= 1'b0;
                    if (start) begin
                        busy   <= 1'b1;
                        state  <= S_PREPARE;
                    end
                end

                //----------------------------------------------
                // S_PREPARE: 组装 5 words 初始化序列
                //----------------------------------------------
                S_PREPARE: begin
                    words[0] <= CFG_RESET;        // RESET=1
                    words[1] <= {2'b01, freq_tune[13:0]};   // FREQ0 LSB
                    words[2] <= {2'b01, freq_tune[27:14]};   // FREQ0 MSB
                    words[3] <= {2'b11, 2'b00, phase_val};   // PHASE0
                    words[4] <= cfg_run;          // RESET=0 + 波形
                    word_cnt <= 5;
                    word_idx <= 0;
                    state    <= S_LOAD;
                end

                //----------------------------------------------
                // S_LOAD: 装载 word, 拉低 CS, 输出 MSB
                // 直接进入 phase 1 (跳过无效保持)
                //----------------------------------------------
                S_LOAD: begin
                    tx_data   <= words[word_idx];
                    cs_n      <= 1'b0;
                    sck       <= 1'b1;
                    mosi      <= first_bit;
                    bit_cnt   <= 0;
                    spi_phase <= 1;         // 直接到 phase1: 建立时间
                    state     <= S_BIT;
                end

                //----------------------------------------------
                // S_BIT: SPI 3-phase 逐位发送
                // 每 tick 进一拍
                //----------------------------------------------
                S_BIT: begin
                    if (spi_tick_rise) begin
                        case (spi_phase)
                            // phase 1: MOSI 稳定等待 (建立时间)
                            1: begin
                                spi_phase <= 2;
                            end

                            // phase 2: SCK 下降沿 → AD9833 采样
                            2: begin
                                sck       <= 1'b0;
                                spi_phase <= 3;
                            end

                            // phase 3: SCK 上升沿, 切换 MOSI
                            3: begin
                                sck <= 1'b1;
                                if (bit_cnt == 15) begin
                                    // 16 位发送完毕
                                    state  <= S_CS_DLY;
                                    wait_cnt <= 0;
                                end else begin
                                    tx_data <= {tx_data[14:0], 1'b0};
                                    mosi    <= tx_data[14];
                                    bit_cnt <= bit_cnt + 1;
                                    spi_phase <= 1;
                                end
                            end
                            default: ;
                        endcase
                    end
                end

                //----------------------------------------------
                // S_CS_DLY: 拉高 CS, 等待
                //----------------------------------------------
                S_CS_DLY: begin
                    sck  <= 1'b1;
                    cs_n <= 1'b1;
                    if (wait_cnt >= CS_DLY_MAX) begin
                        word_idx <= word_idx + 1;
                        if (word_idx + 1 >= word_cnt) begin
                            state <= S_IDLE;
                        end else begin
                            state <= S_LOAD;
                        end
                    end else begin
                        wait_cnt <= wait_cnt + 1;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule
