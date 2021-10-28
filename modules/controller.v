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

module controller(opcode, func, alusrc, aluop, regdst, regwrite, writemem, readmem, memtoreg, shift, PC_jump);

	input wire [5:0] opcode;
	input wire [5:0] func;
	
	output reg [3:0] aluop;
	output reg alusrc;
	output reg regdst;
	output reg regwrite;
	output reg writemem;	
	output reg readmem;	
	output reg memtoreg;
	output reg shift;
	output reg PC_jump;
	
	// For this milestone we can assume it is r-type functions
	always @* begin
		//regdst <= 1'b1; 	// write to rd
		memtoreg = 1'b0; // write alu data (not memory data) to register file
		alusrc = 1'b0; 	// alusrc to register file data 2
		regwrite = 1'b1;	// Enable writing to the register 
		
		// If the opcode is an R type then we go into here. 
		if(opcode == `OP_R_TYPE) begin
			regdst = 1'b1;
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
				PC_jump = 1'b1;
			end else begin
				PC_jump = 1'b0;
			end
			
			// decode the function code to set the shift flag
			if(func == `FN_SLL || func == `FN_SRL || func == `FN_SRA) begin
				shift = 1'b1;
			end else begin
				shift = 1'b0;
			end
		// Here is the beginning of the I Type functions. 
		// the ALU codes are decided upon by the Mips spec. 
		// The memtoreg and reamem flags are set according 
		// the the tables we've been given through out the 
		// semester. Right now BEQ and BNE are not implemented
		// as they are complex enough to mostlikely be there own
		// modules. 
		end else if(opcode == `OP_ADDI) begin
			aluop = `ALU_ADD;
			alusrc = 1'b1;
		end else if(opcode == `OP_ADDIU) begin
			aluop = `ALU_ADD;
			alusrc = 1'b1;
		end else if(opcode == `OP_ANDI) begin
			aluop = `ALU_AND;
			alusrc = 1'b1;
		end else if(opcode == `OP_BEQ) begin
			// Come back when branch stuff is done
			// Or maybe this should be handled by custom module?
			// I'm also not sure if the flushing of the registers 
			// should be handled by this or by the other custom branch
			// unit? 
		end else if(opcode == `OP_BNE) begin
			// Come back when branch stuff is done
		end else if(opcode == `OP_LBU) begin
			readmem = 1'b1;
			memtoreg = 1'b1;
			aluop = `ALU_ADD;
		end else if(opcode == `OP_LHU) begin
			readmem = 1'b1;
			memtoreg = 1'b1;
			aluop = `ALU_ADD;
		end else if(opcode == `OP_LUI) begin
			readmem = 1'b1;
			memtoreg = 1'b1;
			aluop = `ALU_ADD;
		end else if(opcode == `OP_LW) begin
			readmem = 1'b1;
			memtoreg = 1'b1;
			aluop = `ALU_ADD;
		end else if(opcode == `OP_ORI) begin
			aluop = `ALU_OR;
			alusrc = 1'b1;	
		end else if(opcode == `OP_SLTI) begin
			aluop = `ALU_SLT;
			alusrc = 1'b1;
		end else if(opcode == `OP_SLTIU) begin
			aluop = `ALU_SLT;
			alusrc = 1'b1;
		end else if(opcode == `OP_SB) begin
			writemem = 1'b0;
			aluop = `ALU_ADD;
		end else if(opcode == `OP_SH) begin
			writemem = 1'b0;
			aluop = `ALU_ADD;
		end
	end
	
	
endmodule
