/* MemoryMask.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    Performs masking in order to convert the word addressable memory
	 to byte addressable
*/

module MemoryMask(TARGET_MEM_ADDR, MEM_DATA_IN, MEM_DATA_OUT, MEM_DATA_READ, MEM_DATA_WRITE, OP_CODE, BYTE_ENABLE);
	input wire [31:0] TARGET_MEM_ADDR; // the memory address (in bytes)
	input wire [31:0] MEM_DATA_IN; // the raw data from the register to write into memory
	input wire [31:0] MEM_DATA_READ; // the raw data read from memory
	input wire [5:0] OP_CODE; // the op-code of the instruction
	
	
	output reg [31:0] MEM_DATA_WRITE; // the masked data sent to the memory port
	output reg [31:0] MEM_DATA_OUT; // the masked data sent to the write-back stage
	output reg [3:0] BYTE_ENABLE; // the actual mask used for writing the data


endmodule
