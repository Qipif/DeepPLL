module pin_test (
    input  sys_clk,
    output test_out
);
    reg [24:0] counter;
    always @(posedge sys_clk) counter <= counter + 1;
    assign test_out = counter[24];  // 50MHz / 2^25 ≈ 1.5Hz blink
endmodule
