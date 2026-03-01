module traffic_controller(
    input clk,          // slow clock (1 MHz)
    input reset,
    output reg [2:0] light_NS,
    output reg [2:0] light_EW,
    output reg [3:0] countdown // remaining time for display
);

    // State encoding (parameters instead of typedef enum)
    parameter NS_GREEN  = 3'b000;
    parameter NS_YELLOW = 3'b001;
    parameter EW_GREEN  = 3'b010;
    parameter EW_YELLOW = 3'b011;

    reg [2:0] current_state, next_state;
    reg [3:0] counter;

    // Timing parameters
    parameter GREEN_TIME  = 4'd5;
    parameter YELLOW_TIME = 4'd2;

    // Sequential logic: state + counter update
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= NS_GREEN;
            counter <= GREEN_TIME;
        end else begin
            if (counter == 0) begin
                current_state <= next_state;
                case (next_state)
                    NS_GREEN, EW_GREEN: counter <= GREEN_TIME;
                    NS_YELLOW, EW_YELLOW: counter <= YELLOW_TIME;
                    default: counter <= GREEN_TIME;
                endcase
            end else begin
                counter <= counter - 1;
            end
        end
    end

    // Combinational logic: next state
    always @(*) begin
        case (current_state)
            NS_GREEN:  next_state = NS_YELLOW;
            NS_YELLOW: next_state = EW_GREEN;
            EW_GREEN:  next_state = EW_YELLOW;
            EW_YELLOW: next_state = NS_GREEN;
            default:   next_state = NS_GREEN;
        endcase
    end

    // Combinational logic: outputs
    always @(*) begin
        // Default off
        light_NS = 3'b000;
        light_EW = 3'b000;

        case (current_state)
            NS_GREEN:  begin light_NS = 3'b001; light_EW = 3'b100; end // NS=Green, EW=Red
            NS_YELLOW: begin light_NS = 3'b010; light_EW = 3'b100; end // NS=Yellow, EW=Red
            EW_GREEN:  begin light_NS = 3'b100; light_EW = 3'b001; end // NS=Red, EW=Green
            EW_YELLOW: begin light_NS = 3'b100; light_EW = 3'b010; end // NS=Red, EW=Yellow
        endcase

        countdown = counter; // drive countdown to 7-seg
    end

endmodule
