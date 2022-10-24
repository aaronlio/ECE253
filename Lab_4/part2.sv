module part2(Clock, Reset_b, Data, Function, ALUout);
    input logic Clock, Reset_b;
    input logic [3:0] Data;
    input logic [1:0] Function;
    output logic [7:0] ALUout;

    logic [7:0] ALU_temp;
    logic [3:0] A;
    logic [3:0] B;

    always_ff @(posedge Clock)
    begin
        if (Reset_b) ALUout <= 8'b00000000;
        else ALUout <= ALU_temp;
    end

    always_comb 
    begin 
        A[3:0] = Data[3:0];
        B[3:0] = ALUout[3:0];
        case(Function)
        2'b00: ALU_temp = A + B;
		  2'b01: ALU_temp = A * B; 
		  2'b10: ALU_temp = B << A; 
		  2'b11: ALU_temp = ALUout;
		default : ALU_temp = 8'b00000000;
		endcase
    end
endmodule
    