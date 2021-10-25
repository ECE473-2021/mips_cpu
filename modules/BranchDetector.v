/* BranchDetector.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Detects if a branch is taken or not taken in a branch instruction.
*/

module BranchDetector(A,B,Type, BranchTaken);
	input wire [31:0] A,B; // data to be compared
	input wire Type; // the type of branch instruction
	output reg BranchTaken; // 1 if the branch is taken, 0 otherwise







endmodule
