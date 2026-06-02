.text
.globl main
main:
lw $s0, x
lw $s1, y
lw $s2, z
srl $t0, $s0, 24 # $t0 = $s0 >> 24, левые 8 бит $s0 в $t0
sll $v0, $t0, 24 # $v0 = $t0 << 24, левые 8 бит $s0 в $v0
srl $t1, $s1, 16 # $t1 = $s1 >> 16, средние 8 бит $s1 в $t1
sll $t1, $t1, 16 # $t1 = $t1 << 16, средние 8 бит $s1 в $t1 поднимаем 23-16
or $v0, $v0, $t1 # $v0 = $v0 or $t1, объединение
andi $t2, $s2, 0x00FF # $t2 = $s2 and 0xFF, младшие 8 бит $s2 в $t2
or $v0, $v0, $t2 # $v0 = $v0 or $t2, младшие 8 бит $s2 в $v0
ori $v0, $v0, 0xFF00 # $v0 = $v0 or 0xFF00, остальные биты единички
sw $v0, f
.data
x: .word 0x11000000
y: .word 0x00220000
z: .word 0x00000033
f: .word 0x11111111