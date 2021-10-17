// file IF_ID.v

module IF_ID(
	input wire [31:0] IF_IN,
	input wire clock,
	input wire reset,
	output reg [31:0] INSTR);
	
	// set INSTR to IF_IN on the rising edge of the clock
	always @(posedge clock or posedge reset) begin
		if(reset) begin
			INSTR <= 32'd0;
		end else begin
			INSTR <= IF_IN;
		end
	end
	
	
endmodule
