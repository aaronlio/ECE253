module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);

    assign pin2 = ~pin1;
    assign pin4 = ~pin3;
    assign pin5 = ~pin6;
    assign pin10 = ~pin11;
    assign pin12 = ~pin13;
    assign pin8 = ~pin9;
endmodule  

module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    
    assign pin3 = pin1 | pin2;
    assign pin13 = pin11 | pin12;
    assign pin11 = pin13 | pin12;
    assign pin8 = pin8 | pin10;
endmodule 


module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);
    
    assign pin3 = pin1 & pin2;
    assign pin6 = pin4 & pin5;
    assign pin11 = pin13 & pin12;
    assign pin8 = pin8 & pin10;
    
endmodule 

module mux2to1(x, y, s, m);
    input logic x; //select 0
    input logic y; //select 1
    input logic s; //select signal
    output logic m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = s ? y : x;

endmodule  