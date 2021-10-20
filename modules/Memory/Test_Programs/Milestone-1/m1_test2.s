li   $1, -30
li   $2, 56
add  $2, $2, $1       #  $2 = 0x0000001a
sub  $2, $1, $2       #  $2 = 0xffffffc8
addu $2, $2, $1       #  $2 = 0xffffffaa
subu $2, $2, $1       #  $2 = 0xffffffc8
and  $2, $2, $1       #  $2 = 0xffffffc0
or   $2, $1, $2       #  $2 = 0xffffffe2
nor  $2, $2, $1       #  $2 = 0x0000001d
slt  $2, $2, $1       #  $2 = 0x00000000
slt  $2, $1, $2       #  $2 = 0x00000001
sll  $2, $2, 1        #  $2 = 0x00000002
srl  $2, $2, 1        #  $2 = 0x00000001
sra  $2, $1, 3        #  $2 = 0xfffffffc
jr   $2               #  pc = 0xfffffffc
nop    
nop
nop
nop
nop
nop
nop
nop
