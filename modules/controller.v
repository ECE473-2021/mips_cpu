module controller(opcode, func, regwrite, alusrc, aluop, regdst, regwrite, writemem, readmem, wb, memtoreg);
	input wire [5:0] opcode;
	input wire [5:0] func;
	
	output reg [3:0] aluop;
	output reg alusrc;
	output reg regdst;
	output reg regwrite;
	output reg writemem;	// not needed for this milestone
	output reg readmem;	// not needed for this milestone
	output reg wb;
	output reg memtoreg;
	
	// For this milestone we can assume it is r-type functions
	always @* begin
		regdst <= 1'b1; 	// write to rd
		memtoreg <= 1'b0; // write alu data (not memory data) to register file
		alusrc <= 1'b0; 	// alusrc to register file data 2
		regwrite <= 1'b1;	// Enable writing to the register 
	end
	
	
endmodule
