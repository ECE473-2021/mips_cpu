/* EX_MEM.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Other Authors: Landyn Francis <landyn.francis@maine.edu> ...
 * Description:
	 The pipeline register between the execution (EX)
	 and memory (MEM) stages of the CPU. Contains the data
	 and control signals.
*/

module EX_MEM(
	input wire flush, // flush signal from the controller

	input wire EX_RegWrite, // write into register?
	output reg MEM_RegWrite,

	input wire EX_MemToReg, // write from memory into register?
	output reg MEM_MemToReg,

	input wire EX_MEM_WREN, // read/write flags for the memory
	input wire EX_MEM_RDEN,
	output reg MEM_MEM_WREN,
	output reg MEM_MEM_RDEN,

	input wire [31:0] EX_ALUResult, // ALU output
	output reg [31:0] MEM_ALUResult,
	
	input wire [31:0] EX_MEM_DATA_IN, // data to be written to memory
	output reg [31:0] MEM_MEM_DATA_IN,

	input wire [4:0] EX_RD, // destination register address
	output reg [4:0] MEM_RD,

	input wire clock, // clock and reset lines
	input wire reset);

always @(posedge clock or posedge reset)	begin
	if(reset) begin
		// reset or flush; clear the registers
		MEM_RegWrite <= 1'd0;
		MEM_MemToReg <= 1'd0;
		MEM_MEM_WREN <= 1'd0;
		MEM_MEM_RDEN <= 1'd0;
		MEM_ALUResult <= 32'd0;
		MEM_RD <= 5'd0;
	end else begin
		if(flush) begin
			// reset or flush; clear the registers
			MEM_RegWrite <= 1'd0;
			MEM_MemToReg <= 1'd0;
			MEM_MEM_WREN <= 1'd0;
			MEM_MEM_RDEN <= 1'd0;
			MEM_ALUResult <= 32'd0;
			MEM_MEM_DATA_IN <= 32'd0;
			MEM_RD <= 5'd0;
		end else begin
			// write the new values on positive clock edge
			MEM_RegWrite <= EX_RegWrite;

			MEM_MemToReg <= EX_MemToReg;

			MEM_MEM_WREN <= EX_MEM_WREN;
			MEM_MEM_RDEN <= EX_MEM_RDEN;
			
			MEM_ALUResult <= EX_ALUResult;
			
			MEM_MEM_DATA_IN <= EX_MEM_DATA_IN;
			
			MEM_RD <= EX_RD;
		end
	end
end
	
endmodule




