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
	la $s2 LS_Start
	sw $s2, 0($s0)
	la $s2 LS_Print
	sw $s2, 4($s0)
	la $s2 LS_Search
	sw $s2, 8($s0)
	la $s2 LS_Init
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
	.globl LS_Start
LS_Start:
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
	move $s1 $a1
	lw $s2, 0($s0)
	lw $s3, 12($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	lw $s2, 0($s0)
	lw $s3, 4($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	li $s2 9999
	move $a0 $s2
	jal _print
	li $s2 8
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	li $s2 12
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	li $s2 17
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	li $s2 50
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	li $s2 55
	move $v0 $s2
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
	.globl LS_Print
LS_Print:
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
	li $s2 1
	move $s1 $s2
L2:
	nop
	lw $s2, 8($s0)
	move $v0 $s2
	slt $s3, $s1, $v0
	beqz $s3 L1
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
	b L2
L1:
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
	.globl LS_Search
LS_Search:
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
	move $s1 $a1
	li $s4 1
	move $s2 $s4
	li $s4 0
	move $s5 $s4
	li $s4 0
	move $s3 $s4
L4:
	nop
	lw $s4, 8($s0)
	move $v0 $s4
	slt $s5, $s2, $v0
	beqz $s5 L3
	lw $s6, 4($s0)
	li $v0 4
	mul $s7, $s2, $v0
	move $v0 $s7
	add $t0, $s6, $v0
	lw $s6, 4($t0)
	move $s4 $s6
	li $s6 1
	move $v0 $s6
	add $s7, $s1, $v0
	move $s5 $s7
	move $v0 $s1
	slt $s6, $s4, $v0
	beqz $s6 L5
	li $s4 0
	move $s5 $s4
	b L6
L5:
	nop
	move $v0 $s5
	slt $s6, $s4, $v0
	li $s7 1
	move $v0 $s6
	sub $t0, $s7, $v0
	beqz $t0 L7
	li $s4 0
	move $s5 $s4
	b L8
L7:
	nop
	li $s4 1
	move $s5 $s4
	li $s4 1
	move $s3 $s4
	lw $s4, 8($s0)
	move $s2 $s4
L8:
	nop
L6:
	nop
	li $s4 1
	move $v0 $s4
	add $s5, $s2, $v0
	move $s2 $s5
	b L4
L3:
	nop
	move $v0 $s3
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
	.globl LS_Init
LS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 36
	sw $ra, -4($fp)
	sw $s0, 24($sp)
	sw $s1, 20($sp)
	sw $s2, 16($sp)
	sw $s3, 12($sp)
	sw $s4, 8($sp)
	sw $s5, 4($sp)
	sw $s6, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 8($s0)
	li $v0 4
	mul $s4, $s1, $v0
	li $v0 4
	add $s5, $s4, $v0
	move $a0 $s5
	jal _halloc
	move $s4 $v0
	sw $s1, 0($s4)
	sw $s4, 4($s0)
	li $s4 1
	move $s2 $s4
	lw $s4, 8($s0)
	li $s5 1
	move $v0 $s5
	add $s6, $s4, $v0
	move $s3 $s6
L10:
	nop
	lw $s1, 8($s0)
	move $v0 $s1
	slt $s4, $s2, $v0
	beqz $s4 L9
	li $s1 2
	move $v0 $s2
	mul $s4, $s1, $v0
	move $s1 $s4
	li $s4 3
	move $v0 $s4
	sub $s5, $s3, $v0
	move $s4 $s5
	move $v0 $s4
	add $s5, $s1, $v0
	li $v0 4
	mul $s1, $s2, $v0
	lw $s4, 4($s0)
	move $v0 $s1
	add $s6, $s4, $v0
	sw $s5, 4($s6)
	li $s1 1
	move $v0 $s1
	add $s4, $s2, $v0
	move $s2 $s4
	li $s1 1
	move $v0 $s1
	sub $s4, $s3, $v0
	move $s3 $s4
	b L10
L9:
	nop
	li $s0 0
	move $v0 $s0
	lw $s0, 24($sp)
	lw $s1, 20($sp)
	lw $s2, 16($sp)
	lw $s3, 12($sp)
	lw $s4, 8($sp)
	lw $s5, 4($sp)
	lw $s6, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 28($sp)
	addu $sp, $sp, 36
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

