// file MEM_WB.v

module MEM_WB(
	input wire [31:0] MEM_D2,
	input wire [4:0] MEM_RD,
	input wire MEM_RegWrite,
	input wire MEM_MemToReg,
	input wire clock,
	input wire reset,
	output reg WB_RegWrite,
	output reg WB_MemToReg,
	output reg [31:0] WB_D2,
	output reg [4:0] WB_RD);

	always @(posedge clock or posedge reset) begin
		if(reset) begin
			WB_D2 <= 32'd0;
			WB_RD <= 5'd0;
		end else begin
			WB_D2 <= MEM_D2;
			WB_RD <= MEM_RD;
			WB_RegWrite <= MEM_RegWrite;
			WB_MemToReg <= MEM_MemToReg;
		end
	end
endmodule
