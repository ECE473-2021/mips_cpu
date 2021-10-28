/* controller_constants.vh
 * UMAINE ECE 473
 * Initial Author: Ryan Kinney <ryan.kinney@maine.edu>
 * Description:
    MIPS compatible constants for ALU and Opcode defs.
*/
`ifndef _controller_constants_vh_
`define _controller_constants_vh_

// R-function funct codes
`define FN_SLL 	6'd0
`define FN_SRL 	6'd2
`define FN_SRA 	6'd3
`define FN_SLLV 	6'd4
`define FN_SRLV 	6'd6
`define FN_SRAV	6'd7
`define FN_JR 		6'd8
`define FN_JALR 	6'd9
`define FN_MOVZ	6'd10
`define FN_MOVN 	6'd11
`define FN_SYSCALL 6'd12
`define FN_BREAK 	6'd13
`define FN_SYNC	6'd15
`define FN_MFHI 	6'd16
`define FN_MTHI	6'd17
`define FN_MFLO	6'd18
`define FN_MTLO 	6'd19

`define FN_MULT	6'd24
`define FN_MULTU	6'd25
`define FN_DIV 	6'd26
`define FN_DIVU	6'd27

`define FN_ADD 	6'd32
`define FN_ADDU 	6'd33
`define FN_SUB 	6'd34
`define FN_SUBU 	6'd35
`define FN_AND 	6'd36
`define FN_OR		6'd37
`define FN_XOR 	6'd38
`define FN_NOR 	6'd39

`define FN_SLT 	6'd42
`define FN_SLTU 	6'd43

`define FN_TGE 	6'd48
`define FN_TGEU 	6'd49
`define FN_TLT 	6'd50
`define FN_TLTU 	6'd51
`define FN_TEQ 	6'd52

`define FN_TNE 	6'd54

// OP codes 
`define OP_R_TYPE 6'd0
`define OP_BGEZ	6'd1
`define OP_J 		6'd2
`define OP_JAL 	6'd3
`define OP_BEQ 	6'd4
`define OP_BNE 	6'd5
`define OP_BLEZ 	6'd6
`define OP_BGTZ 	6'd7
`define OP_ADDI 	6'd8
`define OP_ADDIU 	6'd9
`define OP_SLTI 	6'd10
`define OP_SLTIU 	6'd11
`define OP_ANDI 	6'd12 // Dwalin, Balin, 
`define OP_ORI 	6'd13 // Fili, Kili,  Dori, Ori, Nori, 
`define OP_XORI 	6'd14 // Oin, Gloin, Bifur, Bofur, Bombur, 
`define OP_LUI 	6'd15 // and Thorin

`define OP_LB 		6'd32
`define OP_LH 		6'd33
`define OP_LWL 	6'd34
`define OP_LW 		6'd35
`define OP_LBU 	6'd36
`define OP_LHU 	6'd37
`define OP_LWR 	6'd38

`define OP_SB 		6'd40
`define OP_SH		6'd41
`define OP_SWL 	6'd42
`define OP_SW 		6'd43

`define OP_SWR		6'd46
`define OP_CAHCE 	6'd47
`define OP_LL 		6'd48
`define OP_LWC1 	6'd49
`define OP_LWC2 	6'd50
`define OP_SC 		6'd56
`define OP_SWC1 	6'd57
`define OP_SWC2 	6'd58
`define OP_SDC1	6'd61
`define OP_SDC2 	6'd62

// ALU-op codes
`define ALU_SLL	4'h0
`define ALU_SRL	4'h2
`define ALU_SRA	4'h3
`define ALU_SLT	4'h5
`define ALU_ADD	4'h8
`define ALU_SUB	4'hA
`define ALU_AND	4'hC
`define ALU_OR		4'hD
`define ALU_NOR	4'hF

// these just alias to the above ALU-ops
`define ALU_NOP	`ALU_SLL
`define ALU_ADDU	`ALU_ADD
`define ALU_SUBU	`ALU_SUB

`endif