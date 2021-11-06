/* hazard_unit.v
 * UMAINE ECE 473
 * Initial Author: Jacob Mealey <jacob.mealey@maine.edu>
 * Other Authors: Ryan Kinney <ryan.kinney@maine.edu> ...
 * Description:
	 This is the hazard detection unit, this takes in the previous registers
	 and the current registers and detects if there is going to be a read 
	 after write / read after load conflict. 
	 
	 Output should go to a mux that conrolls what control lines are being written
	 to the ID/EX register.
*/

module hazard_unit(IDEX_memread, EXMEM_memread, IFID_branch, IFID_rs, IFID_rt, IDEX_dest, EXMEM_dest, stall);
	input wire IDEX_memread; // memory read and branch flags
	input wire EXMEM_memread;
	input wire IFID_branch;
	
	input wire [4:0] IFID_rs; // current instruction source register addresses
	input wire [4:0] IFID_rt;
	
	input wire [4:0] IDEX_dest; // next instruction destination address
	input wire [4:0] EXMEM_dest; // next next instruction destination address
	
	output reg stall; // stall flag
	
	// I'm not convinced this has to be in an always block, 
	// incase we have to add more to it in the future it will 
	// good to have it? 
	always @* begin
		if (IDEX_dest || EXMEM_dest) begin
			// next destinations are not register 0, might need to stall
			
			if (IFID_branch) begin
				// handle branch instruction stalling
				
				if(IDEX_dest && (IFID_rs == IDEX_dest || IFID_rt == IDEX_dest)) begin
					// next instruction destination is a source register for the branch; stall
					stall = 1'b1;
				end else begin // check if the current source depends on a load
					stall = EXMEM_memread && EXMEM_dest && (IFID_rs == EXMEM_dest || IFID_rt == EXMEM_dest);
				end
				//stall = IDEX_memread && IDEX_rt && (IFID_rs == IDEX_dest || IDEX_rt == IFID_rt);
			end else begin
				// now handle read after load
				stall = IDEX_memread && (IFID_rs == IDEX_dest || IFID_rt == IDEX_dest);
			end
		end else begin // no need to stall if the next instruction destinations are register 0
			stall = 1'b0;
		end
	end
endmodule
	