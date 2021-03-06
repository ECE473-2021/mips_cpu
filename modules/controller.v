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

module controller(opcode, func, alusrc, aluop, regdst, regwrite, writemem, readmem, memtoreg, shift, PC_source, signextend, branch);

	input wire [5:0] opcode;
	input wire [5:0] func;
	
	output reg [3:0] aluop;
	output reg alusrc;
	output reg regdst;
	output reg regwrite;
	output reg writemem;	
	output reg readmem;	
	output reg memtoreg;
	output reg [1:0] shift;
	output reg  [1:0] PC_source;
	output reg signextend; // If signextend is 1 then do sign extension, otherwise zero extend
	output reg branch;
	
	always @* begin
		// If the opcode is an R type then we go into here. 
		if(opcode == `OP_R_TYPE) begin
			regdst = 1'b1;
			memtoreg = 1'b0;
			alusrc = 1'b0;
			writemem = 1'b0;
			readmem = 1'b0;
			signextend = 1'b0;
			
			// decode the function code to get the ALU-op
			case (func)
				`FN_ADD:		aluop = `ALU_ADD;
				`FN_ADDU:	aluop = `ALU_ADDU;
				`FN_SUB:		aluop = `ALU_SUB;
				`FN_SUBU: 	aluop = `ALU_SUBU;
				`FN_AND:		aluop = `ALU_AND;
				`FN_OR:		aluop = `ALU_OR;
				`FN_NOR: 	aluop = `ALU_NOR;
				`FN_SLL:		aluop = `ALU_SLL;
				`FN_SRL:		aluop = `ALU_SRL;
				`FN_SRA:		aluop = `ALU_SRA;
				`FN_SLT: 	aluop = `ALU_SLT;	
				default:		aluop = `ALU_NOP;
			endcase
			
			// decode the function code to know whether or not to jump
			if (func == `FN_JR) begin
				PC_source = 2'b11;
				regwrite = 1'b0;
				branch = 1'b1;
			end else begin
				PC_source = 2'b00;
				regwrite = 1'b1;
				branch = 1'b1;
			end
			
			// decode the function code to set the shift flag
			if(func == `FN_SLL || func == `FN_SRL || func == `FN_SRA) begin
				shift = 2'b1;
			end else begin
				shift = 2'b0;
			end
			
		// Here is the beginning of the I Type functions. 
		// the ALU codes are decided upon by the Mips spec. 
		// The memtoreg and reamem flags are set according 
		// the the tables we've been given through out the 
		// semester.
		end else if(opcode == `OP_ADDI || opcode == `OP_ADDIU) begin
			aluop = `ALU_ADD;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_ANDI) begin
			aluop = `ALU_AND;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b0;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_ORI) begin
			aluop = `ALU_OR;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b0;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_SLTI) begin
			aluop = `ALU_SLT;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_LUI) begin
			aluop = `ALU_SLL;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b10;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_LW) begin
			aluop = `ALU_ADD;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b1;
			memtoreg = 1'b1;
			shift = 2'b0;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_SW) begin
			aluop = `ALU_ADD;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b0;
			writemem = 1'b1;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b00;
		end else if(opcode == `OP_BEQ || opcode == `OP_BNE || opcode == `OP_BGTZ || opcode == `OP_BGEZ) begin
			// Branching is handled in a seperate
			// module, so all we have to is set some flags
			aluop = `ALU_NOP;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b0;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b1; // Dont care
			branch = 1'b1;
			PC_source = 2'b00;
		end else if(opcode == `OP_J) begin
			aluop = `ALU_NOP;
			alusrc = 1'b1;
			regdst = 1'b0;
			regwrite = 1'b0;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			signextend = 1'b1;
			branch = 1'b0;
			PC_source = 2'b10;
		end else if(opcode == `OP_JAL) begin
			aluop = `ALU_SLL;
			alusrc = 1'b0;
			regdst = 1'b0;
			regwrite = 1'b1;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b1;
			signextend = 1'b0;
			branch = 1'b0;
			PC_source = 2'b10;
		end else begin
			aluop = `ALU_NOP;
			alusrc = 1'b0;
			regdst = 1'b0;
			regwrite = 1'b0;
			writemem = 1'b0;
			readmem = 1'b0;
			memtoreg = 1'b0;
			shift = 2'b0;
			PC_source = 2'b00;
			signextend = 1'b0;
			branch = 1'b0;
		end
	end
	
	
endmodule
