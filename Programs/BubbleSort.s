	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	li $a0 16
	jal _halloc
	move $s0 $v0
	li $a0 12
	jal _halloc
	move $s1 $v0
	la $s2 BBS_Start
	sw $s2, 0($s0)
	la $s2 BBS_Sort
	sw $s2, 4($s0)
	la $s2 BBS_Print
	sw $s2, 8($s0)
	la $s2 BBS_Init
	sw $s2, 12($s0)
	sw $s0, 0($s1)
	li $s0 10
	lw $s2, 0($s1)
	lw $s3, 0($s2)
	move $a0 $s1
	move $a1 $s0
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl BBS_Start
BBS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 24
	sw $ra, -4($fp)
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $s3, 0($sp)
	move $s0 $a0
	move $s1 $a1
	lw $s2, 0($s0)
	lw $s3, 12($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	lw $s2, 0($s0)
	lw $s3, 8($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	li $s2 99999
	move $a0 $s2
	jal _print
	lw $s2, 0($s0)
	lw $s3, 4($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	lw $s2, 0($s0)
	lw $s3, 8($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	li $s2 0
	move $v0 $s2
	lw $s0, 12($sp)
	lw $s1, 8($sp)
	lw $s2, 4($sp)
	lw $s3, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 16($sp)
	addu $sp, $sp, 24
	j $ra
	
	.text
	.globl BBS_Sort
BBS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 44
	sw $ra, -4($fp)
	sw $s0, 32($sp)
	sw $s1, 28($sp)
	sw $s2, 24($sp)
	sw $s3, 20($sp)
	sw $s4, 16($sp)
	sw $s5, 12($sp)
	sw $s6, 8($sp)
	sw $s7, 4($sp)
	sw $t0, 0($sp)
	move $s0 $a0
	lw $s3, 8($s0)
	li $s4 1
	move $v0 $s4
	sub $s5, $s3, $v0
	move $s1 $s5
	li $s3 0
	li $s4 1
	move $v0 $s4
	sub $s5, $s3, $v0
	move $s2 $s5
L2:
	nop
	move $v0 $s1
	slt $s3, $s2, $v0
	beqz $s3 L1
	li $s4 1
	move $s3 $s4
L4:
	nop
	li $s4 1
	move $v0 $s4
	add $s5, $s1, $v0
	move $v0 $s5
	slt $s4, $s3, $v0
	beqz $s4 L3
	li $s4 1
	move $v0 $s4
	sub $s5, $s3, $v0
	move $s4 $s5
	lw $s5, 4($s0)
	li $v0 4
	mul $s6, $s4, $v0
	move $v0 $s6
	add $s4, $s5, $v0
	lw $s5, 4($s4)
	move $s4 $s5
	lw $s5, 4($s0)
	li $v0 4
	mul $s6, $s3, $v0
	move $v0 $s6
	add $s7, $s5, $v0
	lw $s5, 4($s7)
	move $s6 $s5
	move $v0 $s4
	slt $s5, $s6, $v0
	beqz $s5 L5
	li $s4 1
	move $v0 $s4
	sub $s5, $s3, $v0
	move $s4 $s5
	lw $s5, 4($s0)
	li $v0 4
	mul $s6, $s4, $v0
	move $v0 $s6
	add $s7, $s5, $v0
	lw $s5, 4($s7)
	move $s6 $s5
	lw $s5, 4($s0)
	li $v0 4
	mul $s7, $s3, $v0
	move $v0 $s7
	add $t0, $s5, $v0
	lw $s5, 4($t0)
	li $v0 4
	mul $s7, $s4, $v0
	lw $s4, 4($s0)
	move $v0 $s7
	add $t0, $s4, $v0
	sw $s5, 4($t0)
	li $v0 4
	mul $s4, $s3, $v0
	lw $s5, 4($s0)
	move $v0 $s4
	add $s7, $s5, $v0
	sw $s6, 4($s7)
	b L6
L5:
	nop
	li $s4 0
	move $s5 $s4
L6:
	nop
	li $s4 1
	move $v0 $s4
	add $s5, $s3, $v0
	move $s3 $s5
	b L4
L3:
	nop
	li $s3 1
	move $v0 $s3
	sub $s4, $s1, $v0
	move $s1 $s4
	b L2
L1:
	nop
	li $s0 0
	move $v0 $s0
	lw $s0, 32($sp)
	lw $s1, 28($sp)
	lw $s2, 24($sp)
	lw $s3, 20($sp)
	lw $s4, 16($sp)
	lw $s5, 12($sp)
	lw $s6, 8($sp)
	lw $s7, 4($sp)
	lw $t0, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 36($sp)
	addu $sp, $sp, 44
	j $ra
	
	.text
	.globl BBS_Print
BBS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $ra, -4($fp)
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $s3, 4($sp)
	sw $s4, 0($sp)
	move $s0 $a0
	li $s2 0
	move $s1 $s2
L8:
	nop
	lw $s2, 8($s0)
	move $v0 $s2
	slt $s3, $s1, $v0
	beqz $s3 L7
	lw $s2, 4($s0)
	li $v0 4
	mul $s3, $s1, $v0
	move $v0 $s3
	add $s4, $s2, $v0
	lw $s2, 4($s4)
	move $a0 $s2
	jal _print
	li $s2 1
	move $v0 $s2
	add $s3, $s1, $v0
	move $s1 $s3
	b L8
L7:
	nop
	li $s0 0
	move $v0 $s0
	lw $s0, 16($sp)
	lw $s1, 12($sp)
	lw $s2, 8($sp)
	lw $s3, 4($sp)
	lw $s4, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 20($sp)
	addu $sp, $sp, 28
	j $ra
	
	.text
	.globl BBS_Init
BBS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 32
	sw $ra, -4($fp)
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)
	sw $s3, 8($sp)
	sw $s4, 4($sp)
	sw $s5, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 8($s0)
	li $v0 4
	mul $s2, $s1, $v0
	li $v0 4
	add $s3, $s2, $v0
	move $a0 $s3
	jal _halloc
	move $s2 $v0
	sw $s1, 0($s2)
	sw $s2, 4($s0)
	li $s2 0
	li $s3 20
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 1
	li $s3 7
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 2
	li $s3 12
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 3
	li $s3 18
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 4
	li $s3 2
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 5
	li $s3 11
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 6
	li $s3 6
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 7
	li $s3 9
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 8
	li $s3 19
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 9
	li $s3 5
	li $v0 4
	mul $s4, $s2, $v0
	lw $s2, 4($s0)
	move $v0 $s4
	add $s5, $s2, $v0
	sw $s3, 4($s5)
	li $s2 0
	move $v0 $s2
	lw $s0, 20($sp)
	lw $s1, 16($sp)
	lw $s2, 12($sp)
	lw $s3, 8($sp)
	lw $s4, 4($sp)
	lw $s5, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 24($sp)
	addu $sp, $sp, 32
	j $ra
	
	.text
	.globl _halloc
_halloc:
	li $v0, 9
	syscall
	j $ra
	
	.text
	.globl _print
_print:
	li $v0, 1
	syscall
	la $a0, newl
	li $v0, 4
	syscall
	j $ra
	
	.data
	.align 0
newl:
	.asciiz "\n"
	.data
	.align 0
str_er:
	.asciiz " ERROR: abnormal termination\n"

