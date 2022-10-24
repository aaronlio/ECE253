module part2(Clock, Reset_b, Data, Function, ALUout);
    input logic Clock, Reset_b;
    input logic [3:0] Data;
    input logic [2:0] Function;
    output logic [7:0] ALUout;

    logic [7:0] ALU_temp;
    logic [3:0] A;
    logic [3:0] B;

    always_ff @(posedge Clock)
    begin
        if (Reset_b == 1'b0) ALUout <= 8'b00000000;
        else ALUout <= ALU_temp;
    end

    always_comb 
    begin 
        A[3:0] = Data[3:0];
        B[3:0] = ALUout[3:0];
        case(Function)
        3'b000: ALU_temp = A + B;
		3'b001: ALU_temp = A * B; 
		3'b010: ALU_temp = B << A; 
		3'b011: ALU_temp = ALUout;
		default : ALU_temp = 8'b00000000;
		endcase
    end
endmodule
    