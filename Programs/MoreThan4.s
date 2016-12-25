	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 40
	sw $ra, -4($fp)
	li $a0 8
	jal _halloc
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $s1 $v0
	la $s2 MT4_Start
	sw $s2, 0($s0)
	la $s2 MT4_Change
	sw $s2, 4($s0)
	sw $s0, 0($s1)
	li $s0 1
	li $s2 2
	li $s3 3
	li $s4 4
	li $s5 5
	li $s6 6
	lw $s7, 0($s1)
	lw $t0, 0($s7)
	move $a0 $s1
	move $a1 $s0
	move $a2 $s2
	move $a3 $s3
	sw $s4, -12($sp)
	sw $s5, -16($sp)
	sw $s6, -20($sp)
	jalr $t0
	move $s7 $v0
	move $a0 $s7
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 40
	j $ra
	
	.text
	.globl MT4_Start
MT4_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
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
	move $s2 $a2
	move $s3 $a3
	lw $s4, 44($sp)
	lw $s5, 40($sp)
	lw $s6, 36($sp)
	move $a0 $s1
	jal _print
	move $a0 $s2
	jal _print
	move $a0 $s3
	jal _print
	move $a0 $s4
	jal _print
	move $a0 $s5
	jal _print
	move $a0 $s6
	jal _print
	lw $s7, 0($s0)
	lw $t0, 4($s7)
	move $a0 $s0
	move $a1 $s6
	move $a2 $s5
	move $a3 $s4
	sw $s3, -12($sp)
	sw $s2, -16($sp)
	sw $s1, -20($sp)
	jalr $t0
	move $s7 $v0
	move $t0 $s7
	move $v0 $t0
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
	lw $fp, 48($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl MT4_Change
MT4_Change:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 48
	sw $ra, -4($fp)
	sw $s0, 24($sp)
	sw $s1, 20($sp)
	sw $s2, 16($sp)
	sw $s3, 12($sp)
	sw $s4, 8($sp)
	sw $s5, 4($sp)
	sw $s6, 0($sp)
	move $s0 $a1
	move $s1 $a2
	move $s2 $a3
	lw $s3, 36($sp)
	lw $s4, 32($sp)
	lw $s5, 28($sp)
	move $a0 $s0
	jal _print
	move $a0 $s1
	jal _print
	move $a0 $s2
	jal _print
	move $a0 $s3
	jal _print
	move $a0 $s4
	jal _print
	move $a0 $s5
	jal _print
	li $s6 0
	move $v0 $s6
	lw $s0, 24($sp)
	lw $s1, 20($sp)
	lw $s2, 16($sp)
	lw $s3, 12($sp)
	lw $s4, 8($sp)
	lw $s5, 4($sp)
	lw $s6, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 40($sp)
	addu $sp, $sp, 48
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

