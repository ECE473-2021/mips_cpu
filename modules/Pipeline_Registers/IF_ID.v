/* IF_ID.v
 * UMAINE ECE 473
 * Initial Author: Landyn Francis <landyn.francis@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    The pipeline register to hold the instruction before
	 the instruction decode stage
*/
module IF_ID(
	input wire IF_ID_Write, // signal for stalling the pipeline

	input wire [31:0] IF_INSTR, // the fetched instruction
	output reg [31:0] ID_INSTR,
	
	input wire [31:0] IF_PC, // the PC for branch and jump instructions
	output reg [31:0] ID_PC,
	
	input wire clock, // the clock and reset lines
	input wire reset);

	always @(posedge clock or posedge reset) begin
		if(reset) begin
			// reset; flush the registers
			ID_INSTR <= 32'd0;
			ID_PC <= 32'd0;
		end else if (IF_ID_Write) begin
			// write the new values on positive clock edge if not stalling
			ID_INSTR <= IF_INSTR;
			ID_PC <= IF_PC;
		end
	end
	
	
endmodule
