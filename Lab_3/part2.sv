module part2(A, B, Function, ALUOut);
    input logic [3:0] A;
    input logic [3:0] B;
    input logic[1:0] Function;
    output logic [7:0] ALUOut;
    logic [3:0] filler_sum;
    logic [3:0] filler_cout;
    part1 u0(A[3:0], B[3:0], 0, filler_sum[3:0], filler_cout[3:0]);


    always_comb
    begin
        case(Function)
        2'b00: 
            ALUOut = {0,0,0,filler_cout[3],filler_sum[3:0]};
        2'b01:
            ALUOut = | {A,B};
        2'b10:
            ALUOut = & {A,B};
        2'b11:
            ALUOut = {A,B};
        default:
            ALUOut[7:0] = 8'b00000000;
        endcase
    end
endmodule

