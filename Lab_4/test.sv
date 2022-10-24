/*module test_part_3(SW, KEY, LEDR);
        
	input logic [9:0]SW;
	input logic [1:0]KEY;
	output logic [3:0]LEDR;
	part3 u0(.clock(KEY[0]), .reset(KEY[1]), .Data_IN(SW[3:0]), .ParallelLoadn(SW[9]), .RotateRight(SW[8]), .ASRight(SW[7]), .Q(LEDR[3:0]));


endmodule
*/

module test_part_2(SW, KEY, LEDR);

	input logic [9:0]SW;
	input logic [1:0]KEY;
	output logic [7:0]LEDR;
	
	part2 y1(.Clock(KEY[0]), .Reset_b(KEY[1]), .Data(SW[3:0]), .Function(SW[9:8]), .ALUout(LEDR[7:0]));
endmodule
