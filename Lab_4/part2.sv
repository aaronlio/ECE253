module part2(Clock, Reset_b, Data, Function, ALUout);
    input logic Clock, Reset_b;
    input logic [3:0] Data;
    input logic [1:0] Function;
    output logic [7:0] ALUout;


    always_comb
    begin
        A[3:0] = Data[3:0];
        B[3:0] = ALUout[3:0];
        case(Function)
        2'b00: 
            ALU_temp = A + B;
        2'b01:
            ALU_temp = | {A,B}; // 1 = 8b'00000001
        2'b10:
            ALU_temp = & {A,B};
        2'b11:
            ALU_temp = {A,B};
        default:
            ALU_temp = 0;
        endcase
    end

    always_ff @(posedge Clock)
    begin
        if (Reset_b == 1'b1) ALUout <= 8'b00000000;
        else ALUout <= ALU_temp;
    end

endmodule