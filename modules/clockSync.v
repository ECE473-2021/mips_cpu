/* clockSync.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Allows the user to pause, unpause, and reset the clock.
	 Used in tandem with the CLOCK_DIV in order to not press
	 a pushbutton thousands of times.
*/

module clockSync(clk_in, start_button, reset, clk_out);
	input wire clk_in, start_button, reset;
	output reg clk_out;
	
	reg started; // on vs off flag
	
	always @(posedge reset or negedge start_button) begin
		if(reset) begin
			// reset, turn off clock
			started <= 1'b0;
		end else if (!start_button) begin
			started <= ~started; // button pressed, toggle the clock status
		end
	end

	always @* begin // set the clk_out to clk_in if the clock is running
		clk_out = !(started && clk_in);
	end
	
endmodule
