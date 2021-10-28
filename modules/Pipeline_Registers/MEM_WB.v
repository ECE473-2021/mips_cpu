/* MEM_WB.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Other Authors: Landyn Francis <landyn.francis@maine.edu> ...
 * Description:
	 The pipeline register between the memory (MEM)
	 and write-back (WB) stages of the CPU. Contains the data
	 and control signals.
*/

module MEM_WB(
	input wire MEM_RegWrite, // write into the register?
	output reg WB_RegWrite,
	
	input wire [31:0] MEM_DATA, // data to be written into the register
	output reg [31:0] WB_DATA,
	
	input wire [4:0] MEM_RD, // address of the register to write into
	output reg [4:0] WB_RD,
	
	input wire clock, // clock and reset lines
	input wire reset);

	always @(posedge clock or posedge reset) begin
		if(reset) begin
			// reset; set all outputs back to zero
			WB_RegWrite <= 1'd0;
			WB_DATA <= 31'd0;
			WB_RD <= 5'd0;
		end else begin
			// write the new values on rising clock edge
			WB_RegWrite <= MEM_RegWrite;
			WB_DATA <= MEM_DATA;
			WB_RD <= MEM_RD;
		end
	end
endmodule
