`timescale 1ns / 1ns

module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);

    input logic pin1;
    input logic pin3;
    input logic pin5;
    input logic pin9;
    input logic pin11;
    input logic pin13;

    output logic pin2;
    output logic pin4;
    output logic pin6;
    output logic pin8;
    output logic pin10;
    output logic pin12;

    assign pin2 = ~pin1;
    assign pin4 = ~pin3;
    assign pin6 = ~pin5;
    assign pin10 = ~pin11;
    assign pin12 = ~pin13;
    assign pin8 = ~pin9;
endmodule  

module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    
    input logic pin1;
    input logic pin2;
    input logic pin4;
    input logic pin5;
    input logic pin13;
    input logic pin12;
    input logic pin9;
    input logic pin10;
    
    output logic pin3;
    output logic pin6;
    output logic pin11;
    output logic pin8;

    assign pin3 = pin1 & pin2;
    assign pin6 = pin4 & pin5;
    assign pin11 = pin13 & pin12;
    assign pin8 = pin9 & pin10;
endmodule 


module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    
    input logic pin1;
    input logic pin2;
    input logic pin4;
    input logic pin5;
    input logic pin13;
    input logic pin12;
    input logic pin9;
    input logic pin10;
    
    output logic pin3;
    output logic pin6;
    output logic pin11;
    output logic pin8;

    assign pin3 = pin1 | pin2;
    assign pin6 = pin4 | pin5;
    assign pin11 = pin13 | pin12;
    assign pin8 = pin9 | pin10;

endmodule 

module mux2to1(x, y, s, m);
    input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
    
    logic not_s; 
    logic x_ns;
    logic y_s;

    v7404 nots(
        .pin1(s),
        .pin2(not_s)
        );

    v7408 xandnots(
        .pin1(x),
        .pin2(not_s),
        .pin3(x_ns)
        );

    v7408 yands(
        .pin13(y),
        .pin12(s),
        .pin11(y_s)
        );
    
    v7432 y_s_or_x_ns(
        .pin1(x_ns),
        .pin2(y_s),
        .pin3(m))
    

endmodule  