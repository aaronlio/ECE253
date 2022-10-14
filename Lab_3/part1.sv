module adder(a, b, c_in, s, c_out);
    input logic a, b, c_in;
    output logic s, c_out;
    
    assign s = a^b^c_in;
    assign c_out = (a&b) | (c_in & a) | (c_in & b);
endmodule

module part1(a, b, c_in, s, c_out);
    input logic [3:0] a, [3:0] b, c_in;
    output logic [3:0] s, c_out;
    logic c1, c2, c3;
    
    adder u0(.a(a[0]), .b(b[0]), .c_in(c_in), .s(s[0]), .c_out(c1));
    adder u1(.a(a[1]), .b(b[1]), .c_in(c1), .s(s[1]), .c_out(c2));
    adder u2(.a(a[2]), .b(b[2]), .c_in(c2), .s(s[2]), .c_out(c3));
    adder u3(.a(a[3]), .b(b[3]), .c_in(c3), .s(s[3]), .c_out(c_out));

endmodule


