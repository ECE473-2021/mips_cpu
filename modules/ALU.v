// file ALU.v

module ALU(A,B,ALU_OP,ALU_OUT);
	input wire [31:0] A,B;
	input wire [3:0] ALU_OP;
	output reg [31:0] ALU_OUT;

/*
A is the first operand
B is the second operand
ALU_OP is the ALU control signal
ALU_OUT is the result of the operation

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

always @* begin
	if(ALU_OP == 4'b0010) begin // srl
		ALU_OUT = A >> B[4:0];
	end else if(ALU_OP == 4'b0011) begin // sra
		ALU_OUT = A >>> B[4:0];
	end else if(ALU_OP == 4'b0101) begin // slt
		if(A < B) begin
			ALU_OUT = 32'd1;
		end else begin
			ALU_OUT = 32'd0;
		end
	end else if(ALU_OP == 4'b1000) begin // add or addu
		ALU_OUT = A + B;
	end else if(ALU_OP == 4'b1010) begin // sub or subu
		ALU_OUT = A - B;
	end else if(ALU_OP == 4'b1100) begin // and
		ALU_OUT = A & B;
	end else if(ALU_OP == 4'b1101) begin // or
		ALU_OUT = A | B;
	end else if(ALU_OP == 4'b1111) begin // nor
		ALU_OUT = ~(A | B);
	end else begin // nop or sll
		ALU_OUT = A << B[4:0];
	end
end

endmodule
