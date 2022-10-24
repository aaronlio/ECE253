module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
    input logic clock, reset, ParallelLoadn, RotateRight, ASRight;
    input logic [3:0] Data_IN;
    output logic [3:0] Q;

    logic temp;
    
    mux2to1 m0(.x(Q[0]), .y(Q[3]), .s(ASRight), .f(temp));

    rotate r0(.clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .left(Q[1]), .right(Q[3]), .D(Data_IN[0]), .Q(Q[0]));
    rotate r1(.clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .left(Q[2]), .right(Q[0]), .D(Data_IN[1]), .Q(Q[1]));
    rotate r2(.clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .left(Q[3]), .right(Q[1]), .D(Data_IN[2]), .Q(Q[2]));
    rotate r3(.clock(clock), .reset(reset), .loadn(ParallelLoadn), .LoadLeft(RotateRight), .left(temp), .right(Q[2]), .D(Data_IN[3]), .Q(Q[3]));
endmodule

module rotate(clock, reset, loadn, LoadLeft, left, right, D, Q);
    input logic clock, reset, loadn, LoadLeft, left, right, D;
    output logic Q;
    
    logic F, R;

    mux2to1 u0(.x(right), .y(left), .s(LoadLeft), .f(F));
    mux2to1 u1(.x(D), .y(F), .s(loadn), .f(R));
    D_FF u3(.D(R), .clock(clock), .reset(reset), .Q(Q));
endmodule

module mux2to1(x, y, s, f);
    input logic x, y, s;
    output logic f;

    always_comb 
    begin
        case(s)
        0: f = x;
        1: f = y; 
        endcase
    end
endmodule

module D_FF(D, clock, reset, Q);
    input logic D, clock, reset;
    output logic Q;

    always_ff @(posedge clock)
    begin
        if (reset == 1'b1) Q <= 1'b0;
        else Q <= D;
    end
endmodule
