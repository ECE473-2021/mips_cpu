/* IF_ID.v
 * UMAINE ECE 473
 * Initial Author: Landyn Francis <landyn.francis@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    The pipeline register to hold the instruction before
	 the instruction decode stage
*/
module IF_ID(
	input wire [31:0] IF_INSTR, // the fetched instruction
	input wire [31:0] IF_PC, // the PC for branch instructions
	input wire clock,
	input wire reset, // the reset lines are for flushing the register
	output reg [31:0] ID_INSTR,
	output reg [31:0] ID_PC);
	
	// set INSTR to IF_IN on the rising edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			// reset; flush the registers
			ID_INSTR <= 32'd0;
			ID_PC <= 32'd0;
		end else begin
			// write the new values on positive clock edge
			ID_INSTR <= IF_INSTR;
			ID_PC <= IF_PC;
		end
	end
	
	
endmodule
