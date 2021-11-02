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

module hazard_unit(IDEX_memread, IDEX_register_rs, IFID_register_rs, IDEX_register_rt, IFID_register_rt, stall);
	input wire IDEX_memread;
	input wire [4:0] IDEX_register_rs;
	input wire [4:0] IDEX_register_rt;
	input wire [4:0] IFID_register_rs;
	input wire [4:0] IFID_register_rt;
	
	output reg stall;
	
	// I'm not convinced this has to be in an always block, 
	// incase we have to add more to it in the future it will 
	// good to have it? 
	always @* begin
		stall = IDEX_memread && ((IDEX_register_rt == IFID_register_rs) || (IDEX_register_rt == IFID_register_rt));
	end
	
endmodule
	