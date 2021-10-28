/* CycleIncrement
 * UMAINE ECE 473
 * Initial Author: Landyn Francis <landyn.francis@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    This file is a simple adder that adds 4 to its input
*/

module CycleIncrement(
	input wire[31:0] CycleIn,
	input wire clock,
	output reg[31:0] CycleOut);

	always @(posedge clock)begin
		CycleOut = CycleIn + 32'd1;
	end
endmodule
