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

module test_part_3(input logic [7:0]SW, input logic [1:0]KEY, output logic [7:0] LEDR);
    part3 #(3) u0(.A(SW[5:3]), .B(SW[2:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]));
endmodule