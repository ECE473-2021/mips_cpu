// file Nx1MUX.v

module Nx1MUX #(

	// these define the number of inputs and the width of the input
	parameter WIDTH = 32,
	parameter NUM_INPUTS = 2,
	parameter SIZE_SEL = $clog2(NUM_INPUTS))
	
	(input wire [NUM_INPUTS*WIDTH-1:0] inputs,
	input wire [SIZE_SEL-1:0] SEL, // number of bits needed is found by taking the log base 2 and rounding up
	output wire [WIDTH-1:0] MUX_OUT);
	
	
	// set the output corresponding to the SEL line
	assign MUX_OUT = inputs>>WIDTH*SEL;

endmodule
