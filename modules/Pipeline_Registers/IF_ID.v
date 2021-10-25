// file IF_ID.v

module IF_ID(
	input wire [31:0] IF_IN,
	input wire [31:0] IF_PC,
	input wire clock,
	input wire reset,
	input wire [31:0] IF_PCplus4,
	output reg [31:0] INSTR,
	output reg [31:0] ID_PC,
	output reg [31:0] ID_PCplus4);
	
	// set INSTR to IF_IN on the rising edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			INSTR <= 32'd0;
			ID_PC <= 32'd0;
		end else begin
			INSTR <= IF_IN;
			ID_PC <= IF_PC;
			ID_PCplus4 <= IF_PCplus4;
		end
	end
	
	
endmodule
