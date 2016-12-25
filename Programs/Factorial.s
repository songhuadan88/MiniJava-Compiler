	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $s1 $v0
	la $s2 Fac_ComputeFac
	sw $s2, 0($s0)
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
	.globl Fac_ComputeFac
Fac_ComputeFac:
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
	li $s2 1
	move $v0 $s2
	slt $s3, $s1, $v0
	beqz $s3 L1
	li $s0 1
	move $s2 $s0
	b L2
L1:
	nop
	li $s3 1
	move $v0 $s3
	sub $s4, $s1, $v0
	lw $s3, 0($s0)
	lw $s5, 0($s3)
	move $a0 $s0
	move $a1 $s4
	jalr $s5
	move $s3 $v0
	move $v0 $s3
	mul $s4, $s1, $v0
	move $s2 $s4
L2:
	nop
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

