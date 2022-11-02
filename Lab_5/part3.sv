module part3
#(parameter CLOCK_FREQUENCY=500)(
input logic ClockIn,
input logic Reset,
input logic Start,
input logic [2:0] Letter,
output logic DotDashOut,
output logic NewBitOut);

logic [12:0] morse;
logic start_hold;
logic [$clog2(CLOCK_FREQUENCY) + 1:0] RateDividerCounter;

    assign NewBitOut = (RateDividerCounter == 'b0)?'1:'0;

    always_ff(posedge ClockIn)
    begin
        if (Reset)
        begin
            start_hold <= 0;
            morse <= 12'b000000000000;
        end  
        else if (Start)
        begin
            start_hold <= 1;
            RateDividerCounter <= (CLOCK_FREQUENCY / 2) - 1;
            
            case(Letter)
                3'b000: morse <= 12'b101110000000;
                3'b001: morse <= 12'b111010101000;
                3'b010: morse <= 12'b111010111010;
                3'b011: morse <= 12'b111010100000;
                3'b100: morse <= 12'b100000000000;
                3'b101: morse <= 12'b101011101000;
                3'b110: morse <= 12'b111011101000;
                3'b111: morse <= 12'b101010100000;
                default:morse <= 12'b000000000000;
            endcase
            
        end

        else if (start_hold) 
        begin
            RateDividerCounter <= RateDividerCounter - 1;
        end  

        else if (NewBitOut)
        begin
            RateDividerCounter <= (CLOCK_FREQUENCY / 2) - 1;
            morse <= morse << 1;
        end
    end    
    assign DotDashOut = morse[11];
    
endmodule








