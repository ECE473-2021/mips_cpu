/* PCincrement.v
 * UMAINE ECE 473
 * Initial Author: Landyn Francis <landyn.francis@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    This file is a simple adder that adds 4 to its input
*/

module PCincrement(
	input wire[31:0] PCin,
	output reg[31:0] sum);

	always @(*)begin
		sum = PCin + 32'd4;
	end
endmodule
