/* BranchDetector.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Detects if a branch is taken or not taken in a branch instruction.
*/

`include "./controller_constants.vh"

module BranchDetector(A,B,OP, BranchTaken);
	input wire [31:0] A,B; // data to be compared
	input wire [5:0] OP; // the type of branch instruction
	output reg BranchTaken; // 1 if the branch is taken, 0 otherwise


	always@* begin // not sure if this should be clocked. Do let me know
		if (OP == `OP_BNE) begin
			// branch if not equal
			BranchTaken = (A != B);
		end else if (OP == `OP_BEQ) begin
			// branch if equal
			BranchTaken = (A == B);
		end else if (OP == `OP_BGTZ) begin
			// branch if greater than zero
			BranchTaken = ($signed(A) > 32'd0);
		end else if (OP == `OP_BGEZ) begin
			// branch if greater than or equal to zero
			BranchTaken = ($signed(A) >= 32'd0);
		end else if (OP == `OP_BLEZ) begin
			// branch if less than or equal to zero
			BranchTaken = ($signed(A) <= 32'd0);
		end else begin
			// not a branch instruction
			BranchTaken = 1'b0;
		end
	end

endmodule
