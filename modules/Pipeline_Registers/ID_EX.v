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
	input wire [3:0] ID_ALUOp,
	input wire [31:0] ID_D1,
	input wire [31:0] ID_D2,
	input wire [4:0] ID_RS,
	input wire [4:0] ID_RD,
	input wire [4:0] ID_RT,
	input wire ID_RegWrite,
	input wire ID_MemToReg,
	input wire ID_MEM_WEN,
	input wire ID_MEM_REN,
	input wire ID_RegDst,
	input wire ID_ALUSrc,
	input wire clock,
	input wire reset,
	input wire ID_shift,
	input wire ID_PC_jump,
	input wire [4:0] ID_SHAMT,
	input wire [31:0] ID_SignExtendImm,
	output reg [3:0] EX_ALUOp,
	output reg [31:0] EX_D1,
	output reg [31:0] EX_D2,
	output reg [4:0] EX_RD,
	output reg [4:0] EX_RS,
	output reg EX_RegWrite,
	output reg EX_MemToReg,
	output reg EX_MEM_WEN,
	output reg EX_MEM_REN,
	output reg EX_ALUSrc,
	output reg EX_shift,
	output reg [4:0] EX_RT,
	output reg EX_RegDst,
	output reg [4:0] EX_SHAMT,
	output reg EX_PC_jump,
	output reg [31:0] EX_SignExtendImm);
	
	
	// write on the positive edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			EX_D1 <= 32'd0;
			EX_D2 <= 32'd0;
			EX_RD <= 5'd0;
			
		end else begin
			EX_ALUOp <= ID_ALUOp;
			EX_RegDst <= ID_RegDst;
			EX_ALUSrc <= ID_ALUSrc;
			EX_RegWrite <= ID_RegWrite;
			EX_MemToReg <= ID_MemToReg;
			EX_MEM_WEN <= ID_MEM_WEN;
			EX_MEM_REN <= ID_MEM_REN;
			EX_D1 <= ID_D1;
			EX_D2 <= ID_D2;
			EX_RD <= ID_RD;
			EX_RT <= ID_RT;
			EX_RS <= ID_RS;
			EX_shift <= ID_shift;
			EX_SHAMT <= ID_SHAMT;
			EX_PC_jump <= ID_PC_jump;
			EX_SignExtendImm <= ID_SignExtendImm;
		end
	end
	
endmodule
