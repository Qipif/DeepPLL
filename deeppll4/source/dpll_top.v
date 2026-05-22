`timescale 1ns / 1ps

module dpll_top (
    input  sys_clk,    // 系统主时钟 50MHz (R4)
    input  SignalIn,   // 输入方波信号 (E19)
    output SignalOut   // 输出方波信号 (C22)
);

    parameter DividerMultiple = 5;  // 倍频数

    // 内部连线
    wire Lead, Lag;
    wire Positive, Negative;
    wire [7:0] PeriodCount;

    // ── 钳位 ──────────────────────────────────────────────
    // 当 PeriodCount 尚未测量（启动时 =0），分频器会死锁。
    // 钳到 2 让输出至少能跑起来，等鉴相器测到周期后自动收敛。
    wire [7:0] divider_max_raw;
    wire [7:0] divider_max_clamped;
    assign divider_max_raw      = PeriodCount / DividerMultiple;
    assign divider_max_clamped  = (divider_max_raw < 8'd2) ? 8'd2 : divider_max_raw;

    // ── 鉴相器 ────────────────────────────────────────────
    phasecomparator inst_ph_cmp(
        .MainClock         (sys_clk),
        .InputSignal       (SignalIn),
        .OutputSignal      (SignalOut),
        .Lead              (Lead),
        .Lag               (Lag),
        .InputSignalEdge   (),
        .OutputSignalEdge  (),
        .Lock              (),
        .SynchronousSignal (),
        .PeriodCount       (PeriodCount)
    );

    // ── 变复位随机游走滤波器 ────────────────────────────────
    variableresetrandomwalkfilter inst_zrwf(
        .MainClock   (sys_clk),
        .Lead        (Lead),
        .Lag         (Lag),
        .Positive    (Positive),
        .Negative    (Negative)
    );

    // ── 可控分频器（修复版）────────────────────────────────
    // 原版 freqdivider.v 用 `posedge overflow` 触发输出翻转，
    // 这在 Vivado 合成中不可靠。freqdivider_fixed 已改为统一
    // 在 MainClock 进程中处理溢出和翻转。
    freqdivider_fixed inst_freqdiv(
        .MainClock    (sys_clk),
        .DividerMax   (divider_max_clamped),
        .Positive     (Positive),
        .Negative     (Negative),
        .FrequencyOut (SignalOut)
    );

endmodule
