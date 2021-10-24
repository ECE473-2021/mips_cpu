/* SignExtender.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Performs sign extension on a 16 bit input to a 32 bit output.
	 Copies the most significant bit of the input 16 times.
*/

module SignExtender(IN,OUT);
		input wire [15:0] IN;
		output wire [31:0] OUT;
		
		
		//assign OUT = {16{IN[15]},IN};
		assign OUT = { {16{IN[15]}}, IN };
endmodule
