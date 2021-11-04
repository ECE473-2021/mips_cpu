.text	
main:         
     ori  $2, $0, 5
     addi $3, $0, 5
     addi $4,$0, 5

     jal, subroutine
     nop
     ori $5,$0, -1
     ori $6,$0, -1
     ori $7,$0, -1

dead:
     j dead

subroutine:   
     ori $8,$0, 1
     ori $9,$0, 1
     ori $10,$0, 1
     jr  $ra
