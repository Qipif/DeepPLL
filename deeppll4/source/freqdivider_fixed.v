`timescale 1ns / 1ps

/*
 * 固定版本的可控分频器
 * 原版 freqdivider.v 有两个合成问题：
 * 1. overflow 信号作为时钟触发 FrequencyOut（`posedge overflow` 在 Vivado 中不可靠）
 * 2. DividerMaxValue=0 时 7-bit 计数器永远溢不出去
 */
module freqdivider_fixed (
    input  MainClock,
    input  [7:0] DividerMax,
    input  Positive, Negative,
    output reg FrequencyOut
);

    parameter DividerLength = 7;

    reg [DividerLength-1 : 0] DividerCounter;
    reg [7:0] DividerMax_reg;

    initial begin
        FrequencyOut    <= 1'b0;
        DividerCounter  <= 0;
        DividerMax_reg  <= 0;
    end

    always @(posedge MainClock) begin
        DividerMax_reg <= DividerMax;

        // 正常溢出路径
        if (Negative == 1'b0 && Positive == 1'b0 && DividerCounter >= (DividerMax_reg - 1)) begin
            DividerCounter <= 0;
            FrequencyOut   <= ~FrequencyOut;

        // Negative（输出太慢，需要加速 → 一次加 2）
        end else if (Negative == 1'b1) begin
            if (DividerCounter <= (DividerMax_reg - 3))
                DividerCounter <= DividerCounter + 2;
            else if (DividerCounter == (DividerMax_reg - 2)) begin
                DividerCounter <= 0;
                FrequencyOut   <= ~FrequencyOut;
            end else if (DividerCounter == (DividerMax_reg - 1)) begin
                DividerCounter <= 1;
                FrequencyOut   <= ~FrequencyOut;
            end

        // Positive（输出太快，需要减速 → 停一拍）
        end else if (Positive == 1'b1) begin
            DividerCounter <= DividerCounter;  // 停滞
            // FrequencyOut 不变

        // 正常计数
        end else begin
            DividerCounter <= DividerCounter + 1;
        end
    end

endmodule
