.data
array:  .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

.text
.globl main
main:
 ori  $2, $0, 0x3F
 ori  $1, $0, 0xFF
 andi $2, $2, 0x14
 ori  $2, $2, 0x15
 slti $2, $2, 0x14
 slti $2, $2, 0xFFF
 addi $2, $2, 0x14
 ori  $1, $0, 0xFF
 ori  $1, $0, 0xFF
 addiu $2,$2, 0x14
 lui $2, 0xEE
 la   $3, array     # put base address of array in $3
 lw   $4, 0($3)
 addi  $4, $4, 7
 sw   $4, 4($3)
 ori  $4, $3, 0
 addi  $4, $4, 8
 sw   $4, 8($4)
 nop
 nop
 nop
 nop
