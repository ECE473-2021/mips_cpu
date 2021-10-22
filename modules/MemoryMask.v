/* MemoryMask.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Performs masking in order to convert the word addressable memory
	 to byte addressable
*/

`include "./controller_constants.vh"

module MemoryMask(TARGET_MEM_ADDR, MEM_DATA_WB, MEM_DATA_READ, OP_CODE, BYTE_ENABLE);
	input wire [31:0] TARGET_MEM_ADDR; // the memory address (in bytes)
	input wire [31:0] MEM_DATA_READ; // the raw data read from memory
	input wire [5:0] OP_CODE; // the op-code of the instruction
	
	output reg [5:0] MEM_ADDRESS; // the memory address sent to the memory port
	output reg [31:0] MEM_DATA_WB; // the masked data sent to the write-back stage
	output reg [3:0] BYTE_ENABLE; // the actual mask used for writing the data

	always @* begin
		// Loading instructions
		if(OP_CODE == `OP_LB) begin // load byte
			// we want to store the lower byte from memory into the register
			// signed data, so perform sign extension
			MEM_DATA_WB = { {24{MEM_DATA_READ[7]}}, MEM_DATA_READ[7:0] };
		
		end else if (OP_CODE == `OP_LBU) begin // load byte unsigned
			// want to store the lower byte from memory into the register
			MEM_DATA_WB = {24'd0,MEM_DATA_READ[7:0]};
		
		end else if (OP_CODE == `OP_LH) begin // load halfword
			// want to store the lower 2 bytes from memory into the register
			// signed data, perform sign extension
			MEM_DATA_WB = { {16{MEM_DATA_READ[15]}}, MEM_DATA_READ[15:0] };
		
		end else if (OP_CODE == `OP_LHU) begin // load halfword unsigned
			// store lower halfword from the memory into the register (no sign extension)
			MEM_DATA_WB = {16'd0,MEM_DATA_READ[15:0]};
			
		end else if(OP_CODE == `OP_LW) begin // load word
			// no need for sign extension
			MEM_DATA_WB = MEM_DATA_READ;
		
		end else if(OP_CODE == `OP_LWL) begin // load word left
		
		end else if(OP_CODE == `OP_LWR) begin // load word right
		
		
		// store insructions
		end else if(OP_CODE == `OP_SB) begin // store byte
			// 
		
		
		end else begin
			// memory not being written/read, set outputs to 0
			MEM_ADDRESS = 6'd0;
			MEM_DATA_WB = 32'd0;
			BYTE_ENABLE = 4'd0;
		end
	end

endmodule
