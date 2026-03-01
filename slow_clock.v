module clock_divider(
    input clk,          // 100 MHz FPGA clock
    input reset,
    output reg slow_clk // ~1 MHz output clock
);

    reg [6:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            slow_clk <= 0;
        end else begin
            if (counter == 99) begin
                counter <= 0;
                slow_clk <= ~slow_clk;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
