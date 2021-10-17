// file MEM_WB.v

module MEM_WB(
	input wire [31:0] MEM_D2,
	input wire [4:0] MEM_RD,
	input wire clock,
	input wire reset,
	output reg [31:0] WB_D2,
	output reg [4:0] WB_RD);

	always @(posedge clock or posedge reset) begin
		if(reset) begin
			WB_D2 <= 32'd0;
			WB_RD <= 5'd0;
		end else begin
			WB_D2 <= MEM_D2;
			WB_RD <= MEM_RD;
		end
	end
endmodule
