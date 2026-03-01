module top_module(
    input clk,          // 100 MHz FPGA clock
    input reset,
    output [2:0] NS_LED,
    output [2:0] EW_LED,
    output [6:0] seg    // seven-segment display
);

    wire slow_clk;
    wire [3:0] countdown;

    clock_divider clk_div_inst (
        .clk(clk),
        .reset(reset),
        .slow_clk(slow_clk)
    );

    traffic_controller traffic_inst (
        .clk(slow_clk),
        .reset(reset),
        .light_NS(NS_LED),
        .light_EW(EW_LED),
        .countdown(countdown)
    );

    seven_seg_decoder seg_inst (
        .digit(countdown),
        .seg(seg)
    );

endmodule
