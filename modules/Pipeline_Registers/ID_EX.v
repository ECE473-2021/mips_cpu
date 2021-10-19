// file ID_EX.v

module ID_EX(
	input wire [3:0] ID_ALUOp,
	input wire [31:0] ID_RS,
	input wire [31:0] ID_RT,
	input wire [4:0] ID_RD,
	input wire ID_RegWrite,
	input wire ID_MemToReg,
	input wire ID_MEM_WEN,
	input wire ID_MEM_REN,
	input wire ID_RegDst,
	input wire ID_ALUSrc,
	input wire clock,
	input wire reset,
	output reg [3:0] EX_ALUOp,
	output reg [31:0] EX_RS,
	output reg [31:0] EX_RT,
	output reg [4:0] EX_RD,
	output reg EX_RegWrite,
	output reg EX_MemToReg,
	output reg EX_MEM_WEN,
	output reg EX_MEM_REN,
	output reg EX_ALUSrc,
	output reg EX_RegDst);
	
	
	// write on the positive edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			EX_RS <= 32'd0;
			EX_RT <= 32'd0;
			EX_RD <= 5'd0;
			
		end else begin
			EX_ALUOp <= ID_ALUOp;
			EX_RegDst <= ID_RegDst;
			EX_ALUSrc <= ID_ALUSrc;
			EX_RegWrite <= ID_RegWrite;
			EX_MemToReg <= ID_MemToReg;
			EX_MEM_WEN <= ID_MEM_WEN;
			EX_MEM_REN <= ID_MEM_REN;
			EX_RS <= ID_RS;
			EX_RT <= ID_RT;
			EX_RD <= ID_RD;
		end
	end
	
endmodule
