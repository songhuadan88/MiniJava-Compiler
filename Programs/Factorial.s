	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 76
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $v1 $v0
	sw $v1, 60($sp)
	li $a0 4
	jal _halloc
	move $v1 $v0
	sw $v1, 56($sp)
	la $v1 Fac_ComputeFac
	sw $v1, 52($sp)
	lw $v1, 60($sp)
	lw $v0, 52($sp)
	sw $v0, 0($v1)
	lw $v1, 56($sp)
	lw $v0, 60($sp)
	sw $v0, 0($v1)
	li $v1 10
	sw $v1, 48($sp)
	lw $v1, 56($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 0($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 56($sp)
	move $a0 $v0
	lw $v0, 48($sp)
	move $a1 $v0	
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $a0 $v1
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 76
	j $ra
	
	.text
	.globl Fac_ComputeFac
Fac_ComputeFac:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 92
	sw $ra, -4($fp)
	sw $a0, 80($sp)
	sw $a1, 76($sp)
	li $v1 1
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	beqz $v1 L1
	li $v1 1
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	move $v1 $v1
	sw $v1, 72($sp)
	b L2
L1:
	nop
	li $v1 1
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 52($sp)
	lw $v1, 80($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 80($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	mul $v1, $v0, $v1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 72($sp)
L2:
	nop
	lw $v1, 72($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 92
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

