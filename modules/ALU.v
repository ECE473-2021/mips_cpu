/* ALU.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Other Authors: Jacob Mealey <jacob.mealey@maine.edu> ...
 * Description:
    This is the ALU as defined by Yifeng Zhu. it takes in A, B 
	 and an operator, and outputs some operation between A and B.
	 The possible are stored in modules/controller_contstants.vh
*/
`include "./controller_constants.vh"


module ALU(A,B,ALU_OP,ALU_OUT);
	input wire [31:0] A,B;
	input wire [3:0] ALU_OP;
	output reg [31:0] ALU_OUT;

/*
A is the first operand
B is the second operand
ALU_OP is the ALU control signal
ALU_OUT is the result of the operation

Shift instructions use operand B for the data being shifted
Operand A in shift instructions is the shift amount
*/

always @* begin
	if(ALU_OP == `ALU_SRL) begin // srl
		ALU_OUT = B >> A[4:0];
	end else if(ALU_OP == `ALU_SRA) begin // sra
		ALU_OUT = B >>> A[4:0];
	end else if(ALU_OP == `ALU_SLT) begin // slt
		if(A < B) begin
			ALU_OUT = 32'd1;
		end else begin
			ALU_OUT = 32'd0;
		end
	end else if(ALU_OP == `ALU_ADD) begin // add or addu
		ALU_OUT = A + B;
	end else if(ALU_OP == `ALU_SUB) begin // sub or subu
		ALU_OUT = A - B;
	end else if(ALU_OP == `ALU_AND) begin // and
		ALU_OUT = A & B;
	end else if(ALU_OP == `ALU_OR) begin // or
		ALU_OUT = A | B;
	end else if(ALU_OP == `ALU_NOR) begin // nor
		ALU_OUT = ~(A | B);
	end else begin // nop or sll
		ALU_OUT = B << A[4:0];
	end
end

endmodule
