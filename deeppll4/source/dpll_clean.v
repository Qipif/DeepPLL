`timescale 1ns / 1ps

module dpll_clean (
    input  sys_clk,
    input  SignalIn,
    output SignalOut
);

    parameter DIV_MUL   = 5;
    parameter M_THRESH  = 32;
    parameter N_THRESH  = 8;

    //==========================================================
    // 1. 输入同步 + 边沿检测
    //==========================================================
    reg s1, s2;
    always @(posedge sys_clk) begin s1 <= SignalIn; s2 <= s1; end

    wire rising  =  s1 & ~s2;
    wire falling = ~s1 &  s2;

    //==========================================================
    // 2. 周期测量（补偿同步 1 拍延迟）
    //==========================================================
    reg [7:0] p_cnt, p_val;

    always @(posedge sys_clk) begin
        if (falling) begin
            p_val <= p_cnt + 1'b1;  // 补偿同步延迟
            p_cnt <= 8'd0;
        end else if (s1) begin
            p_cnt <= p_cnt + 1'b1;
        end
    end

    //==========================================================
    // 3. Bang-Bang 鉴相
    //==========================================================
    reg Lead, Lag;

    always @(posedge sys_clk) begin
        if (rising) begin
            Lead <= SignalOut;
            Lag  <= ~SignalOut;
        end
    end

    //==========================================================
    // 4. 两级随机游走滤波器
    //==========================================================

    // ---- M 级 ----
    reg [7:0] m_cnt;

    always @(posedge sys_clk) begin
        if (m_cnt == M_THRESH || m_cnt == (8'd256 - M_THRESH))
            m_cnt <= 8'd0;
        else begin
            if (Lead) m_cnt <= m_cnt + 1'b1;
            if (Lag)  m_cnt <= m_cnt - 1'b1;
        end
    end

    wire m_up   = (m_cnt == M_THRESH);
    wire m_down = (m_cnt == (8'd256 - M_THRESH));

    // ---- 复位状态机 ----
    reg [3:0] rst_cnt;

    always @(posedge sys_clk) begin
        if (m_up) begin
            if (rst_cnt < 4'd3 || rst_cnt >= 4'd13)
                rst_cnt <= rst_cnt + 1'b1;
        end else if (m_down) begin
            if (rst_cnt <= 4'd3 || rst_cnt > 4'd13)
                rst_cnt <= rst_cnt - 1'b1;
        end
        if (rst_cnt > 4'd3 && rst_cnt < 4'd13)
            rst_cnt <= 4'd0;
    end

    reg [7:0] rst_val;
    always @(*) begin
        case (rst_cnt)
            4'd13:   rst_val = 8'd249;
            4'd14:   rst_val = 8'd250;
            4'd15:   rst_val = 8'd252;
            4'd0:    rst_val = 8'd0;
            4'd1:    rst_val = 8'd4;
            4'd2:    rst_val = 8'd6;
            4'd3:    rst_val = 8'd7;
            default: rst_val = 8'd0;
        endcase
    end

    // ---- N 级 ----
    reg [7:0] n_cnt;
    reg Positive, Negative;

    always @(posedge sys_clk) begin
        if (n_cnt == N_THRESH || n_cnt == (8'd256 - N_THRESH))
            n_cnt <= rst_val;
        else begin
            if (Lead) n_cnt <= n_cnt + 1'b1;
            if (Lag)  n_cnt <= n_cnt - 1'b1;
        end
    end

    always @(posedge sys_clk) begin
        Positive <= (n_cnt == N_THRESH);
        Negative <= (n_cnt == (8'd256 - N_THRESH));
    end

    //==========================================================
    // 5. 可控分频器
    //==========================================================
    reg [7:0] div_max;
    reg [6:0] div_cnt;
    reg       div_out;

    wire [7:0] raw = p_val / DIV_MUL;

    always @(posedge sys_clk) begin
        div_max <= (raw < 8'd2) ? 8'd2 : raw;
    end

    always @(posedge sys_clk) begin
        if (~Negative && ~Positive && div_cnt >= (div_max - 1)) begin
            div_cnt <= 7'd0;
            div_out <= ~div_out;
        end else if (Negative) begin
            if (div_cnt <= (div_max - 3))
                div_cnt <= div_cnt + 2'd2;
            else if (div_cnt == (div_max - 2)) begin
                div_cnt <= 7'd0;
                div_out <= ~div_out;
            end else if (div_cnt == (div_max - 1)) begin
                div_cnt <= 7'd1;
                div_out <= ~div_out;
            end
        end else if (Positive) begin
            div_cnt <= div_cnt;
        end else begin
            div_cnt <= div_cnt + 1'b1;
        end
    end

    assign SignalOut = div_out;

endmodule
