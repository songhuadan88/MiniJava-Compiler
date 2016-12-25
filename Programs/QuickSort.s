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
	la $s2 QS_Start
	sw $s2, 0($s0)
	la $s2 QS_Sort
	sw $s2, 4($s0)
	la $s2 QS_Print
	sw $s2, 8($s0)
	la $s2 QS_Init
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
	.globl QS_Start
QS_Start:
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
	li $s2 9999
	move $a0 $s2
	jal _print
	lw $s2, 8($s0)
	li $s3 1
	move $v0 $s3
	sub $s4, $s2, $v0
	move $s2 $s4
	li $s3 0
	lw $s4, 0($s0)
	lw $s5, 4($s4)
	move $a0 $s0
	move $a1 $s3
	move $a2 $s2
	jalr $s5
	move $s4 $v0
	move $s2 $s4
	lw $s2, 0($s0)
	lw $s3, 8($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
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
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $s0, 40($sp)
	sw $s1, 36($sp)
	sw $s2, 32($sp)
	sw $s3, 28($sp)
	sw $s4, 24($sp)
	sw $s5, 20($sp)
	sw $s6, 16($sp)
	sw $s7, 12($sp)
	sw $t0, 8($sp)
	sw $t1, 4($sp)
	sw $t2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	move $s2 $a2
	li $s4 0
	move $s3 $s4
	move $v0 $s2
	slt $s4, $s1, $v0
	beqz $s4 L1
	lw $t0, 4($s0)
	li $v0 4
	mul $t1, $s2, $v0
	move $v0 $t1
	add $t2, $t0, $v0
	lw $t0, 4($t2)
	move $s4 $t0
	li $t0 1
	move $v0 $t0
	sub $t1, $s1, $v0
	move $s5 $t1
	move $s6 $s2
	li $t0 1
	move $s7 $t0
L4:
	nop
	beqz $s7 L3
	li $s7 1
	move $s3 $s7
L6:
	nop
	beqz $s3 L5
	li $s3 1
	move $v0 $s3
	add $s7, $s5, $v0
	move $s5 $s7
	lw $s3, 4($s0)
	li $v0 4
	mul $s7, $s5, $v0
	move $v0 $s7
	add $t0, $s3, $v0
	lw $s3, 4($t0)
	move $s7 $s3
	move $v0 $s4
	slt $s3, $s7, $v0
	li $s7 1
	move $v0 $s3
	sub $t0, $s7, $v0
	beqz $t0 L7
	li $s7 0
	move $s3 $s7
	b L8
L7:
	nop
	li $s7 1
	move $s3 $s7
L8:
	nop
	b L6
L5:
	nop
	li $s7 1
	move $s3 $s7
L10:
	nop
	beqz $s3 L9
	li $s3 1
	move $v0 $s3
	sub $s7, $s6, $v0
	move $s6 $s7
	lw $s3, 4($s0)
	li $v0 4
	mul $s7, $s6, $v0
	move $v0 $s7
	add $t0, $s3, $v0
	lw $s3, 4($t0)
	move $s7 $s3
	move $v0 $s7
	slt $s3, $s4, $v0
	li $s7 1
	move $v0 $s3
	sub $t0, $s7, $v0
	beqz $t0 L11
	li $s7 0
	move $s3 $s7
	b L12
L11:
	nop
	li $s7 1
	move $s3 $s7
L12:
	nop
	b L10
L9:
	nop
	lw $s7, 4($s0)
	li $v0 4
	mul $t0, $s5, $v0
	move $v0 $t0
	add $t1, $s7, $v0
	lw $s7, 4($t1)
	move $s3 $s7
	lw $s7, 4($s0)
	li $v0 4
	mul $t0, $s6, $v0
	move $v0 $t0
	add $t1, $s7, $v0
	lw $s7, 4($t1)
	li $v0 4
	mul $t0, $s5, $v0
	lw $t1, 4($s0)
	move $v0 $t0
	add $t2, $t1, $v0
	sw $s7, 4($t2)
	li $v0 4
	mul $s7, $s6, $v0
	lw $t0, 4($s0)
	move $v0 $s7
	add $t1, $t0, $v0
	sw $s3, 4($t1)
	li $s7 1
	move $v0 $s7
	add $t0, $s5, $v0
	move $v0 $t0
	slt $s7, $s6, $v0
	beqz $s7 L13
	li $t0 0
	move $s7 $t0
	b L14
L13:
	nop
	li $t0 1
	move $s7 $t0
L14:
	nop
	b L4
L3:
	nop
	lw $s4, 4($s0)
	li $v0 4
	mul $s7, $s5, $v0
	move $v0 $s7
	add $t0, $s4, $v0
	lw $s4, 4($t0)
	li $v0 4
	mul $s7, $s6, $v0
	lw $t0, 4($s0)
	move $v0 $s7
	add $t1, $t0, $v0
	sw $s4, 4($t1)
	lw $s4, 4($s0)
	li $v0 4
	mul $s7, $s2, $v0
	move $v0 $s7
	add $t0, $s4, $v0
	lw $s4, 4($t0)
	li $v0 4
	mul $s7, $s5, $v0
	lw $t0, 4($s0)
	move $v0 $s7
	add $t1, $t0, $v0
	sw $s4, 4($t1)
	li $v0 4
	mul $s4, $s2, $v0
	lw $s7, 4($s0)
	move $v0 $s4
	add $t0, $s7, $v0
	sw $s3, 4($t0)
	li $s4 1
	move $v0 $s4
	sub $s7, $s5, $v0
	lw $s4, 0($s0)
	lw $t0, 4($s4)
	move $a0 $s0
	move $a1 $s1
	move $a2 $s7
	jalr $t0
	move $s4 $v0
	move $s7 $s4
	li $s4 1
	move $v0 $s4
	add $s7, $s5, $v0
	lw $s4, 0($s0)
	lw $t0, 4($s4)
	move $a0 $s0
	move $a1 $s7
	move $a2 $s2
	jalr $t0
	move $s4 $v0
	move $s7 $s4
	b L2
L1:
	nop
	li $s0 0
	move $s1 $s0
L2:
	nop
	li $s0 0
	move $v0 $s0
	lw $s0, 40($sp)
	lw $s1, 36($sp)
	lw $s2, 32($sp)
	lw $s3, 28($sp)
	lw $s4, 24($sp)
	lw $s5, 20($sp)
	lw $s6, 16($sp)
	lw $s7, 12($sp)
	lw $t0, 8($sp)
	lw $t1, 4($sp)
	lw $t2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl QS_Print
QS_Print:
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
L16:
	nop
	lw $s2, 8($s0)
	move $v0 $s2
	slt $s3, $s1, $v0
	beqz $s3 L15
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
	b L16
L15:
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
	.globl QS_Init
QS_Init:
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

