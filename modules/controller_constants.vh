// Constants for the op-codes, function codes, and ALU-op codes

`ifndef _controller_constants_vh_
`define _controller_constants_vh_

// R-function funct codes
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