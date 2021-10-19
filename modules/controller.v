// Defining R-func variables fire milestone 1 here 
// should be put in seperate file.
`define FN_ADD 	6'd32
`define FN_ADDU 	6'd33
`define FN_SUB 	6'd34
`define FN_SUBU 	6'd35
`define FN_AND 	6'd36
`define FN_OR		6'd37
`define FN_NOR 	6'd39
`define FN_SLT 	6'd42
`define FN_SLL 	6'd0
`define FN_SRL 	6'd2
`define FN_SRA 	6'd3
`define FN_JR 		6'd8


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
		/* ALU ops as defined in ALU.v
		ALU_OP corresponds to the following operations:
		0 - 0000 --- nop or sll
		2 - 0010 --- srl
		3 - 0011 --- sra
		5 - 0101 --- slt
		8 - 1000 --- add or addu
		A - 1010 --- sub or subu
		C - 1100 --- and
		D - 1101 --- or
		F - 1111 --- nor
		*/
		case (func)
			`FN_ADD:		aluop <= 4'hB;
			`FN_ADDU:	aluop <= 4'hB;
			`FN_SUB:		aluop <= 4'hA;
			`FN_SUBU: 	aluop <= 4'hA;
			`FN_AND:		aluop <= 4'hC;
			`FN_OR:		aluop <= 4'hD;
			`FN_NOR: 	aluop <= 4'hF;
			`FN_SLL:		aluop <= 4'h0;
			`FN_SRL:		aluop <= 4'h2;
			`FN_SRA:		aluop <= 4'h3;
			`FN_SLT: 	aluop <= 4'h5;
			default:		aluop <= 4'h0;
		endcase
		
	end
	
	
endmodule
