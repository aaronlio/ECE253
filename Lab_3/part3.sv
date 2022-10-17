module part3(A, B, Function, ALUout);
    parameter N = 4;
    input logic [3:0]A, B;
    input logic[1:0] Function
    output logic [7:0] ALUout;
    logic [7:0] filler;


    always_comb
    begin
        case(Function)
        2'b00: 
            ALUout = A + B;
        2'b01:
            ALUout = | {A,B}; // 1 = 8b'00000001
        2'b10:
            ALUout = & {A,B};
        2'b11:
            ALUout = {A,B};
        default:
            ALUout = 0;
    end
endmodule
    