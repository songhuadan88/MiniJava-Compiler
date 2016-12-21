	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 100
	sw $ra, -4($fp)
	li $a0 8
	jal _halloc
	move $v1 $v0
	sw $v1, 84($sp)
	li $a0 4
	jal _halloc
	move $v1 $v0
	sw $v1, 80($sp)
	la $v1 MT4_Start
	sw $v1, 76($sp)
	lw $v1, 84($sp)
	lw $v0, 76($sp)
	sw $v0, 0($v1)
	la $v1 MT4_Change
	sw $v1, 72($sp)
	lw $v1, 84($sp)
	lw $v0, 72($sp)
	sw $v0, 4($v1)
	lw $v1, 80($sp)
	lw $v0, 84($sp)
	sw $v0, 0($v1)
	li $v1 1
	sw $v1, 68($sp)
	li $v1 2
	sw $v1, 64($sp)
	li $v1 3
	sw $v1, 60($sp)
	li $v1 4
	sw $v1, 56($sp)
	li $v1 5
	sw $v1, 52($sp)
	li $v1 6
	sw $v1, 48($sp)
	lw $v1, 80($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 0($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 80($sp)
	move $a0 $v0
	lw $v0, 68($sp)
	move $a1 $v0
	lw $v0, 64($sp)
	move $a2 $v0
	lw $v0, 60($sp)
	move $a3 $v0
	lw $v0, 56($sp)
	sw $v0, -12($sp)
	lw $v0, 52($sp)
	sw $v0, -16($sp)
	lw $v0, 48($sp)
	sw $v0, -20($sp)
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $a0 $v1
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 100
	j $ra
	
	.text
	.globl MT4_Start
MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 88
	sw $ra, -4($fp)
	lw $v0, 76($sp)
	sw $v0, 60($sp)
	lw $v0, 72($sp)
	sw $v0, 56($sp)
	lw $v0, 68($sp)
	sw $v0, 52($sp)
	sw $a0, 76($sp)
	sw $a1, 72($sp)
	sw $a2, 68($sp)
	sw $a3, 64($sp)
	lw $v1, 72($sp)
	move $a0 $v1
	jal _print
	lw $v1, 68($sp)
	move $a0 $v1
	jal _print
	lw $v1, 64($sp)
	move $a0 $v1
	jal _print
	lw $v1, 60($sp)
	move $a0 $v1
	jal _print
	lw $v1, 56($sp)
	move $a0 $v1
	jal _print
	lw $v1, 52($sp)
	move $a0 $v1
	jal _print
	lw $v1, 76($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 4($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 76($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	lw $v0, 56($sp)
	move $a2 $v0
	lw $v0, 60($sp)
	move $a3 $v0
	lw $v0, 64($sp)
	sw $v0, -12($sp)
	lw $v0, 68($sp)
	sw $v0, -16($sp)
	lw $v0, 72($sp)
	sw $v0, -20($sp)
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 88
	j $ra
	
	.text
	.globl MT4_Change
MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 76
	sw $ra, -4($fp)
	lw $v0, 64($sp)
	sw $v0, 48($sp)
	lw $v0, 60($sp)
	sw $v0, 44($sp)
	lw $v0, 56($sp)
	sw $v0, 40($sp)
	sw $a0, 64($sp)
	sw $a1, 60($sp)
	sw $a2, 56($sp)
	sw $a3, 52($sp)
	lw $v1, 60($sp)
	move $a0 $v1
	jal _print
	lw $v1, 56($sp)
	move $a0 $v1
	jal _print
	lw $v1, 52($sp)
	move $a0 $v1
	jal _print
	lw $v1, 48($sp)
	move $a0 $v1
	jal _print
	lw $v1, 44($sp)
	move $a0 $v1
	jal _print
	lw $v1, 40($sp)
	move $a0 $v1
	jal _print
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 76
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

