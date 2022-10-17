module part3(A, B, Function, ALUOut);
    parameter N = 4;
    input logic [N-1:0]A, B;
    input logic[1:0] Function;
    output logic [(N*2)-1:0] ALUOut;


    always_comb
    begin
        case(Function)
        2'b00: 
            ALUOut = A + B;
        2'b01:
            ALUOut = | {A,B}; // 1 = 8b'00000001
        2'b10:
            ALUOut = & {A,B};
        2'b11:
            ALUOut = {A,B};
        default:
            ALUOut = 0;
        endcase
    end
endmodule
    