// file EX_MEM.v

module EX_MEM(
	input wire [31:0] EX_D1,
	input wire [31:0] EX_D2,
	input wire [4:0] EX_RD,
	input wire [31:0] EX_ALUResult,
	input wire clock,
	input wire reset,
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
	end
end
	
endmodule




