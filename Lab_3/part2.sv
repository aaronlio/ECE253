module part2(A, B, Function, ALUout);
    input logic [3:0] A;
    input logic [3:0] B;
    input logic[1:0] Function;
    output logic [7:0] ALUout;
    logic [7:0] filler;
    part1 u0(A[3:0], B[3:0], 0, filler[3:0], filler[4]);


    always_comb
    begin
        case(Function)
        2'b00: 
            ALUout[4:0] = {filler[4],filler[3:0]};
        2'b01:
            ALUout = | {A,B};
        2'b10:
            ALUout = & {A,B};
        2'b11:
            ALUout = {A,B};
        default:
            ALUout[7:0] = 8'b00000000;
        endcase
    end
endmodule

