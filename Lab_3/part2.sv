module adder(a, b, c_in, s, c_out);
    input logic a, b, c_in;
    output logic s, c_out;
    
    assign s = a^b^c_in;
    assign c_out = (a&b) | (c_in & a) | (c_in & b);
endmodule


module part1(a, b, c_in, s, c_out);
    input logic [3:0] a, b; 
    input logic c_in;
    output logic [3:0] s, c_out;
    
    adder u0(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c_out[0]));
    adder u1(.a(a[1]), .b(b[1]), .c_in(c_out[0]), .s(s[1]), .c_out(c_out[1]));
    adder u2(.a(a[2]), .b(b[2]), .c_in(c_out[1]), .s(s[2]), .c_out(c_out[2]));
    adder u3(.a(a[3]), .b(b[3]), .c_in(c_out[2]), .s(s[3]), .c_out(c_out[3]));


endmodule


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
            ALUOut = {3'b000,filler_cout[3],filler_sum[3:0]};
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

