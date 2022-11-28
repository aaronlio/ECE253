module part2 #(parameter CLOCK_FREQUENCY = 500) (ClockIn, Reset, Speed, CounterValue);
    input logic ClockIn, Reset;
    input logic [1:0] Speed;
    output logic [3:0] CounterValue;
    logic Pulse;

    RateDivider #(CLOCK_FREQUENCY) u1(ClockIn, Reset, Speed, Pulse);
    DisplayCounter u2(ClockIn, Reset, Pulse, CounterValue);

endmodule

module RateDivider #(parameter CLOCK_FREQUENCY = 500) (input logic ClockIn, input logic Reset, input logic [1:0] Speed, output logic Enable);
    
    logic [$clog2(CLOCK_FREQUENCY*4) - 1:0] RateDividerCounter;
    
    assign Enable = (RateDividerCounter == 'b0)?'1:'0;
    
    always_ff@(posedge ClockIn)
    begin
        if (Reset|Enable)
        begin 
            case (Speed)
                2'b00: RateDividerCounter <= 0;
                2'b01: RateDividerCounter <= CLOCK_FREQUENCY - 1;
                2'b10: RateDividerCounter <= (CLOCK_FREQUENCY * 2) - 1;
                2'b11: RateDividerCounter <= (CLOCK_FREQUENCY * 4) - 1;
                default: RateDividerCounter <= 0;
            endcase
        end
        else RateDividerCounter <= RateDividerCounter - 1;
    end
endmodule

module DisplayCounter (input logic Clock, input logic Reset, input logic EnableDC, output logic [3:0] CounterValue);
    
    always_ff@(posedge Clock)
        if (Reset) CounterValue <= 0;
        else if (EnableDC) CounterValue <= CounterValue + 1;
endmodule