/* file.v
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Other Authors: Landyn Francis <landyn.francis@maine.edu>
 * Description:
    The forwarding unit takes in various singals from 
	 across the pipeline to check for a read-after-write
	 to prevent stalling the pipline for *most* hazard-y
	 cases.
*/

module forwarding_unit(
	input wire [4:0] ID_EX_RS,
	input wire [4:0] ID_EX_RT,
	input wire [4:0] EX_MEM_RD,
	input wire [4:0] MEM_WB_RD,
	input wire EX_MEM_REGWRITE,
	input wire MEM_WB_REGWRITE,
	input wire [4:0] IF_ID_RS,
	input wire [4:0] IF_ID_RT,
	output reg [1:0] ALU_A, // controls the MUX going to ALU A operand
	output reg [1:0] ALU_B,
	output reg Branch_FWD_A,
	output reg Branch_FWD_B);  // controls the MUX going to ALU B operand
	
	always @* begin
		// first, ALU_A MUX control signal, which controls register RS into the ALU
		if(EX_MEM_REGWRITE && ID_EX_RS && ID_EX_RS == EX_MEM_RD) begin // foward from EX_MEM
			// if the RS register in the next instruction is RD for the current instruction,
			// then forward the result from the ALU to RS, as long as RS is not register 0
			ALU_A = 2'b10;
		end else if (MEM_WB_REGWRITE && ID_EX_RS && ID_EX_RS == MEM_WB_RD) begin // forward from MEM_WB
			// if we are not forwarding from the ALU, then we might be forwarding from the WB stage to the instruction after the next
			// if the RS register is not register 0 and is also RD from the current instruction, then forward
			ALU_A = 2'b01;
		end else begin // no forwarding
			ALU_A = 2'b00;		
		end
		
		// next, ALU_B MUX control signal, which controls register RT into the ALU
		if(EX_MEM_REGWRITE && ID_EX_RT && ID_EX_RT == EX_MEM_RD) begin // foward from EX_MEM
			// if the RT register in the next instruction is RD for the current instruction,
			// then forward the result from the ALU to RT, as long as RT is not register 0
			ALU_B = 2'b10;
			Branch_FWD_B = 1'b1;
		end else if (MEM_WB_REGWRITE && ID_EX_RT && ID_EX_RT == MEM_WB_RD) begin // forward from MEM_WB
			// if we are not forwarding from the ALU, then we might be forwarding from the WB stage to the instruction after the next
			// if the RT register is not register 0 and is also RD from the current instruction, then forward
			ALU_B = 2'b01;
		end else begin // no forwarding
			ALU_B = 2'b00;
			Branch_FWD_B = 1'b0;
		end
		
		//Branch Forwarding
		if(EX_MEM_REGWRITE && IF_ID_RS && IF_ID_RS == EX_MEM_RD) begin 
		//If destination register of previous instruction matches RS of current instruction, forward
			Branch_FWD_A = 1'b1;
		end else //Else don't
			Branch_FWD_A = 1'b0;
			
		if(EX_MEM_REGWRITE && IF_ID_RT && IF_ID_RT == EX_MEM_RD) begin
		//If destination register of previous instruction matches RT of current instruction, forward
			Branch_FWD_B = 1'b1;
		end else //Else don't
			Branch_FWD_B = 1'b0;
		
		
	end
endmodule
