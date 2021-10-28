/* register_file.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    The register file has 32 32-bit wide registers. it
	 writes on the first half of the clock cycle and writes 
	 on the second half of the clock cycle. you can read 2 
	 registers at the same time. but only write one.
*/
module register_file(
	input wire [4:0] read_address_1,
	input wire [4:0] read_address_2,
	input wire [31:0] write_data_in,
	input wire [4:0] write_address,
	input wire WriteEnable,
	input wire reset,
	input wire clock,
	input wire [4:0] read_address_debug,
	input wire clock_debug,
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug);
	
	// 32 32 bit registers
	reg [31:0] Registers [0:31];
	
	// iterator for "unrolling" the for loop
	integer idx;
		
	// write on first half cycle or reset
	always @(posedge clock or posedge reset) begin
		if (reset == 1'b1) begin
			// reset state
			for(idx = 0; idx < 31; idx = idx+1) begin
				Registers[idx] <= 32'd0;
			end
		end else if (WriteEnable == 1'b1) begin
				// write into register
				Registers[write_address] <= write_data_in;
		end	
	end
	
	// read data out on second half cycle
	always @(negedge clock) begin
			// choose which register to read from based on the read_address inputs
			data_out_1 <= Registers[read_address_1];
			data_out_2 <= Registers[read_address_2];
	end
	
	always @(posedge clock_debug) begin
		// debug mode; output the wanted register
		data_out_debug <= Registers[read_address_debug];
	end	
endmodule
