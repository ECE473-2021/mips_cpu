/* Threex1Mux.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <jacob.mealey@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu> ...
 * Description:
	 Takes 3 32-bit bus inputs, and outputs the one
	 selected by the SEL inputs
*/


module Threex1Mux(A,B,C,SEL,OUT);
	input wire [31:0] A,B,C;
	input wire [1:0] SEL;
	output reg [31:0] OUT;
	
	always @* begin
		case(SEL)
			2'd0:	OUT = A;
			2'd1: OUT = B;
			2'd2: OUT = C;
			default: OUT = A;
		endcase
	end
endmodule
