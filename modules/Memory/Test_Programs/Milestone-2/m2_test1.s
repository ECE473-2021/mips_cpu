.data
array:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

.text
.globl main
main:
 ori  $2, $0, 0xFF
 ori  $3, $0, 0x3F
 andi $4, $2, 0x14
 ori  $5, $2, 0x14
 slti $6, $2, 0x14
 slti $7, $2, 0xFFF
 addi $8, $2, 0x14
 addiu $10,$2,0x14
 lui  $11, 0xEE
 la   $12, array     # put base address of array in $3
 lw   $13, 0($12)
 lw   $14, 4($12)
 lw   $15, 8($12)
 sw   $0, 0($12)
 sw   $2, 4($12)
 sw   $3, 8($12)
 nop
 nop
 nop
 nop
 nop
 nop
