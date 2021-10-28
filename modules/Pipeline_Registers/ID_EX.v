/* ID_EX.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Other Authors: Landyn Francis <landyn.francis@maine.edu> ...
 * Description:
	 The pipeline register between the instruction decode (ID)
	 and execution (EX) stages of the CPU. Contains the data
	 and control signals.
*/
module ID_EX(
	input wire flush, // the flush line

	input wire ID_RegWrite, // write into the destination register?
	output reg EX_RegWrite,

	input wire ID_MemToReg, // write from memory into the destination register?
	output reg EX_MemToReg,

	input wire ID_MEM_WREN, // read and write flags for the memory
	input wire ID_MEM_RDEN,
	output reg EX_MEM_WREN,
	output reg EX_MEM_RDEN,

	input wire ID_ALUASrc, // flag to send the shift amount or the register to ALU A operand
	output reg EX_ALUASrc,

	input wire ID_ALUBSrc, // flag to send the immediate or register to ALU B operand
	output reg EX_ALUBSrc,

	input wire [3:0] ID_ALUOp, // ALU operation code
	output reg [3:0] EX_ALUOp,

	input wire [1:0] ID_PCSrc, // flags that are set based on branch and jump instructions
	output reg [1:0] EX_PCSrc, // TODO: these might not be used for branch, update later


	input wire [31:0] ID_D1, // The values read from the registers
	input wire [31:0] ID_D2,
	output reg [31:0] EX_D1,
	output reg [31:0] EX_D2,

	input wire [4:0] ID_SHAMT, // the shift amount (for r-type instructions)
	output reg [4:0] EX_SHAMT,

	input wire [31:0] ID_IMM, // the immediate from the instruction
	output reg [31:0] EX_IMM,

	input wire [4:0] ID_RS, // the three register addresses
	input wire [4:0] ID_RT,
	input wire [4:0] ID_RD,
	output reg [4:0] EX_RS,
	output reg [4:0] EX_RT,
	output reg [4:0] EX_RD,

	input wire ID_RegDst, // flag to determine if RT or RD is the destination register
	output reg EX_RegDst,

	input wire clock, // the clock and reset lines
	input wire reset);


	// write on the positive edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset || flush) begin
			// reset or flush; set all outputs back to zero
			EX_RegWrite <= 1'd0;
			EX_MemToReg <= 1'd0;
			EX_MEM_WREN <= 1'd0;
			EX_MEM_RDEN <= 1'd0;
			EX_ALUASrc <= 1'd0;
			EX_ALUBSrc <= 1'd0;
			EX_ALUOp <= 4'd0;
			EX_PCSrc <= 2'd0;
			EX_D1 <= 32'd0;
			EX_D2 <= 32'd0;
			EX_SHAMT <= 5'd0;
			EX_IMM <= 32'd0;
			EX_RS <= 5'd0;
			EX_RT <= 5'd0;
			EX_RD <= 5'd0;
			EX_RegDst <= 1'd0;
		end else begin
			// write the new values on the positive edge of the clock

			// Read/write flags from the controller
			EX_RegWrite <= ID_RegWrite;
			EX_MemToReg <= ID_MemToReg;
			EX_MEM_WREN <= ID_MEM_WREN;
			EX_MEM_RDEN <= EX_MEM_RDEN;

			// ALU Flags
			EX_ALUASrc <= ID_ALUASrc;
			EX_ALUBSrc <= ID_ALUBSrc;
			EX_ALUOp <= ID_ALUOp;

			// PC Source flags
			EX_PCSrc <= ID_PCSrc;

			// Values read from the registers
			EX_D1 <= ID_D1;
			EX_D2 <= ID_D2;

			// Shift ammount and sign-extended immediate
			EX_SHAMT <= ID_SHAMT;
			EX_IMM <= ID_IMM;

			// The register addresses and destination flag
			EX_RS <= ID_RS;
			EX_RT <= ID_RT;
			EX_RD <= ID_RD;
			EX_RegDst <= ID_RegDst;
		end
	end

endmodule
