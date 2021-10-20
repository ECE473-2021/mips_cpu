// file EX_MEM.v

module EX_MEM(
	input wire [31:0] EX_D1,
	input wire [31:0] EX_D2,
	input wire [4:0] EX_RD,
	input wire [31:0] EX_ALUResult,
	input wire EX_RegWrite,
	input wire EX_MemToReg,
	input wire EX_MEM_WEN,
	input wire EX_MEM_REN,
	input wire [4:0] EX_RS,
	input wire [4:0] EX_RT,
	input wire clock,
	input wire reset,
	output reg MEM_RegWrite,
	output reg MEM_MemToReg,
	output reg MEM_MEM_WEN,
	output reg MEM_MEM_REN,
	output reg [4:0] MEM_RS,
	output reg [4:0] MEM_RT,
	output reg [31:0] MEM_D1,
	output reg [31:0] MEM_D2,
	output reg [4:0] MEM_RD,
	output reg [31:0] MEM_ALUResult);
	
always @(posedge clock or posedge reset)	begin
	if(reset) begin
		MEM_D2 <= 32'd0;
		MEM_D2 <= 32'd0;
		MEM_RD <= 5'd0;
		MEM_ALUResult <= 32'd0;
	end else begin
		MEM_D1 <= EX_D1;
		MEM_D2 <= EX_D2;
		MEM_RD <= EX_RD;
		MEM_ALUResult <= EX_ALUResult;
		MEM_MEM_REN <= EX_MEM_REN;
		MEM_MEM_WEN <= EX_MEM_WEN;
		MEM_MemToReg <= EX_MemToReg;
		MEM_RegWrite <= EX_RegWrite;
		MEM_RS <= EX_RS;
		MEM_RT <= EX_RT;
		
	end
end
	
endmodule




