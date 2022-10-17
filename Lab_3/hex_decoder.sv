/*module test_part_1(SW, KEY, LEDR, HEX0);
	input logic [8:0] SW;
	input logic [9:0] LEDR;

	part1 u0(.a(SW[7:4]), .b(SW[3:0]), .c_in(SW[8]), .s(LEDR[3:0]), .c_out(LEDR[9:6]));	
endmodule
*/

module test_part_2(SW, KEY, LEDR, HEX0);
	input logic [8:0] SW;
	input logic [1:0] KEY;
	input logic [7:0] LEDR;
 	output logic [6:0] HEX0;
	

	part2 u0(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]));
	hex_decoder h0(.c(SW[7:4]), .display(HEX0[2]));
	hex_decoder h1(.c(SW[3:0]), .display(HEX0[0]));
	hex_decoder h2(.c(LEDR[7:0]), .display(HEX0[4:3]));
	
endmodule
/* 
module test_part_3(SW, KEY, LEDR, HEX0);
	input logic [8:0] SW;
	input logic [1:0] KEY;
	input logic [7:0] LEDR;
 	output logic [6:0] HEX0;
	

	part3 u0(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]);
	hex_decoder h0(.c(SW[7:4], .display(HEX[2]));
	hex_decoder h1(.c(SW[3:0], .display(HEX[0]));
	hex_decoder h2(.c(LEDR[7:0], .display(HEX[4], HEX[3])); 
	
endmodule*/

module hex_decoder(c, display);
   input logic [3:0] c;
   output logic [6:0] display;

   assign display[0] = ~c[3] & ~c[2] & ~c[1] & c[0] | ~c[3] & c[2] & ~c[1] & ~c[0] | c[3] & ~c[2] & c[1] & c[0]| c[3] & c[2] & ~c[1] & c[0];
	assign display[1] = ~c[3] & c[2] & ~c[1] & c[0] | ~c[3] & c[2] & c[1] & ~c[0] | c[3] & ~c[2] & c[1] & c[0]| c[3] & c[2] & ~c[1] & ~c[0] | c[3] & c[2] & c[1] & ~c[0] | c[3] & c[2] & c[1] & c[0];
	assign display[2] = ~c[3] & ~c[2] & c[1] & ~c[0] | c[3] & c[2] & ~c[1] & ~c[0] | c[3] & c[2] & c[1] & ~c[0]| c[3] & c[2] & c[1] & c[0];
	assign display[3] = ~c[3] & ~c[2] & ~c[1] & c[0] | ~c[3] & c[2] & ~c[1] & ~c[0] | ~c[3] & c[2] & c[1] & c[0]| c[3] & ~c[2] & c[1] & ~c[0] | c[3] & c[2] & c[1] & c[0];
	assign display[4] = ~c[3] & ~c[2] & ~c[1] & c[0] | ~c[3] & ~c[2] & c[1] & c[0] | ~c[3] & c[2] & ~c[1] & ~c[0]| ~c[3] & c[2] & ~c[1] & c[0] | ~c[3] & c[2] & c[1] & c[0] | c[3] & ~c[2] & ~c[1] & c[0];
	assign display[5] = ~c[3] & ~c[2] & ~c[1] & c[0] | ~c[3] & ~c[2] & c[1] & ~c[0] | ~c[3] & ~c[2] & c[1] & c[0]| ~c[3] & c[2] & c[1] & c[0] | c[3] & c[2] & ~c[1] & c[0];
	assign display[6] = ~c[3] & ~c[2] & ~c[1] & ~c[0] | ~c[3] & ~c[2] & ~c[1] & c[0] | ~c[3] & c[2] & c[1] & c[0]| c[3] & c[2] & ~c[1] & ~c[0];
		
endmodule
