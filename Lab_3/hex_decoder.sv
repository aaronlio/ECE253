/*module test_part_1(SW, LEDR);
	input logic [8:0] SW;
	output logic [9:0] LEDR;

	part1 u0(.a(SW[7:4]), .b(SW[3:0]), .c_in(SW[8]), .s(LEDR[3:0]), .c_out(LEDR[9:6]));	
endmodule

module test_part_2(SW, KEY, LEDR);
	input logic [8:0] SW;
	input logic [1:0] KEY;
	output logic [7:0] LEDR;
	

	part2 u0(.A(SW[7:4]), .B(SW[3:0]), .Function(KEY[1:0]), .ALUOut(LEDR[7:0]));
	
endmodule
*/
module test_part_3(SW, KEY, LEDR);
	parameter N = 4;
	input logic [(2*N)-1:0] SW;
	input logic [1:0] KEY;
	output logic [(2*N)-1:0] LEDR;
	

	part3 u0(.A(SW[(2*N)-1:N]), .B(SW[N-1:0]), .Function(KEY[1:0]), .ALUOut(LEDR[(2*N)-1:0]));

	
endmodule

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
