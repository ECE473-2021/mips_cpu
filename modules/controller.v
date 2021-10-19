/* file.v
 * UMAINE ECE 473
 * Initial Author: Jacob Mealey <jacob.mealey@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu> ...
 * Description:
	 The controller takes in the op-code and the func-code
	 from the the IF/ID register and provides various control
	 lines for MUXs, memory read/write and register file 
	 read/write. 
	 NOTE: this modules does not handle forwarding or hazard 
			 detection, that is handled in other modules :)
*/

`include "./controller_constants.vh"

module controller(opcode, func, regwrite, alusrc, aluop, regdst, regwrite, writemem, readmem, memtoreg);

	input wire [5:0] opcode;
	input wire [5:0] func;
	
	output reg [3:0] aluop;
	output reg alusrc;
	output reg regdst;
	output reg regwrite;
	output reg writemem;	// not needed for this milestone
	output reg readmem;	// not needed for this milestone
	output reg memtoreg;
	
	// For this milestone we can assume it is r-type functions
	always @* begin
		regdst <= 1'b1; 	// write to rd
		memtoreg <= 1'b0; // write alu data (not memory data) to register file
		alusrc <= 1'b0; 	// alusrc to register file data 2
		regwrite <= 1'b1;	// Enable writing to the register 

		// decode the function code to get the ALU-op
		case (func)
			`FN_ADD:		aluop <= `ALU_ADD;
			`FN_ADDU:	aluop <= `ALU_ADDU;
			`FN_SUB:		aluop <= `ALU_SUB;
			`FN_SUBU: 	aluop <= `ALU_SUBU;
			`FN_AND:		aluop <= `ALU_AND;
			`FN_OR:		aluop <= `ALU_OR;
			`FN_NOR: 	aluop <= `ALU_NOR;
			`FN_SLL:		aluop <= `ALU_SLL;
			`FN_SRL:		aluop <= `ALU_SRL;
			`FN_SRA:		aluop <= `ALU_SRA;
			`FN_SLT: 	aluop <= `ALU_SLT;
			default:		aluop <= `ALU_NOP;
		endcase
		
	end
	
	
endmodule
