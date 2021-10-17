// file ID_EX.v

module ID_EX(
	input wire [31:0] ID_RS,
	input wire [31:0] ID_RT,
	input wire [4:0] ID_RD,
	input wire clock,
	input wire reset,
	output reg [31:0] EX_RS,
	output reg [31:0] EX_RT,
	output reg [4:0] EX_RD);
	
	
	// write on the positive edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			EX_RS <= 32'd0;
			EX_RT <= 32'd0;
			EX_RD <= 5'd0;
		end else begin
			EX_RS <= ID_RS;
			EX_RT <= ID_RT;
			EX_RD <= ID_RD;
		end
	end
	
endmodule
