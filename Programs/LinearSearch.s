	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 88
	sw $ra, -4($fp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 72($sp)
	li $a0 12
	jal _halloc
	move $v1 $v0
	sw $v1, 68($sp)
	la $v1 LS_Start
	sw $v1, 64($sp)
	lw $v1, 72($sp)
	lw $v0, 64($sp)
	sw $v0, 0($v1)
	la $v1 LS_Print
	sw $v1, 60($sp)
	lw $v1, 72($sp)
	lw $v0, 60($sp)
	sw $v0, 4($v1)
	la $v1 LS_Search
	sw $v1, 56($sp)
	lw $v1, 72($sp)
	lw $v0, 56($sp)
	sw $v0, 8($v1)
	la $v1 LS_Init
	sw $v1, 52($sp)
	lw $v1, 72($sp)
	lw $v0, 52($sp)
	sw $v0, 12($v1)
	lw $v1, 68($sp)
	lw $v0, 72($sp)
	sw $v0, 0($v1)
	li $v1 10
	sw $v1, 48($sp)
	lw $v1, 68($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 0($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 68($sp)
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
	addu $sp, $sp, 88
	j $ra
	
	.text
	.globl LS_Start
LS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 156
	sw $ra, -4($fp)
	sw $a0, 144($sp)
	sw $a1, 140($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 12($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	lw $v0, 140($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 4($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 9999
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	move $a0 $v1
	jal _print
	li $v1 8
	sw $v1, 100($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 96($sp)
	lw $v1, 96($sp)
	lw $v0, 8($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	lw $v0, 100($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	move $a0 $v1
	jal _print
	li $v1 12
	sw $v1, 84($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 8($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	lw $v0, 84($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $a0 $v1
	jal _print
	li $v1 17
	sw $v1, 68($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 8($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	lw $v0, 68($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $a0 $v1
	jal _print
	li $v1 50
	sw $v1, 52($sp)
	lw $v1, 144($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 8($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 144($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $a0 $v1
	jal _print
	li $v1 55
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 156
	j $ra
	
	.text
	.globl LS_Print
LS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 92
	sw $ra, -4($fp)
	sw $a0, 80($sp)
	li $v1 1
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 76($sp)
L2:
	nop
	lw $v1, 80($sp)
	lw $v0, 8($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	beqz $v1 L1
	lw $v1, 80($sp)
	lw $v0, 4($v1)
	sw $v0, 60($sp)
	lw $v0, 76($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 60($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 4($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	move $a0 $v1
	jal _print
	li $v1 1
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 76($sp)
	b L2
L1:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 92
	j $ra
	
	.text
	.globl LS_Search
LS_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 164
	sw $ra, -4($fp)
	sw $a0, 152($sp)
	sw $a1, 148($sp)
	li $v1 1
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	move $v1 $v1
	sw $v1, 144($sp)
	li $v1 0
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	move $v1 $v1
	sw $v1, 140($sp)
	li $v1 0
	sw $v1, 112($sp)
	lw $v1, 112($sp)
	move $v1 $v1
	sw $v1, 136($sp)
L4:
	nop
	lw $v1, 152($sp)
	lw $v0, 8($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 144($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	beqz $v1 L3
	lw $v1, 152($sp)
	lw $v0, 4($v1)
	sw $v0, 100($sp)
	lw $v0, 144($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 100($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	lw $v0, 4($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 1
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 148($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	move $v1 $v1
	sw $v1, 128($sp)
	lw $v1, 148($sp)
	lw $v0, 132($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	beqz $v1 L5
	li $v1 0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 124($sp)
	b L6
L5:
	nop
	lw $v1, 128($sp)
	lw $v0, 132($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 68($sp)
	li $v1 1
	sw $v1, 64($sp)
	lw $v1, 68($sp)
	lw $v0, 64($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	beqz $v1 L7
	li $v1 0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 124($sp)
	b L8
L7:
	nop
	li $v1 1
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	move $v1 $v1
	sw $v1, 140($sp)
	li $v1 1
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	lw $v1, 152($sp)
	lw $v0, 8($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 144($sp)
L8:
	nop
L6:
	nop
	li $v1 1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 144($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 144($sp)
	b L4
L3:
	nop
	lw $v1, 136($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 164
	j $ra
	
	.text
	.globl LS_Init
LS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 156
	sw $ra, -4($fp)
	sw $a0, 144($sp)
	sw $a1, 140($sp)
	lw $v1, 144($sp)
	lw $v0, 140($sp)
	sw $v0, 8($v1)
	lw $v0, 140($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 120($sp)
	lw $v0, 120($sp)
	li $v1 4
	add $v1, $v0, $v1
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	move $a0 $v1
	jal _halloc
	move $v1 $v0
	sw $v1, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 140($sp)
	sw $v0, 0($v1)
	lw $v1, 144($sp)
	lw $v0, 112($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	lw $v1, 144($sp)
	lw $v0, 8($v1)
	sw $v0, 104($sp)
	li $v1 1
	sw $v1, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 104($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	move $v1 $v1
	sw $v1, 132($sp)
L10:
	nop
	lw $v1, 144($sp)
	lw $v0, 8($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 136($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	beqz $v1 L9
	li $v1 2
	sw $v1, 84($sp)
	lw $v1, 136($sp)
	lw $v0, 84($sp)
	move $v1 $v1
	mul $v1, $v0, $v1
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	move $v1 $v1
	sw $v1, 128($sp)
	li $v1 3
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 132($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 128($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 68($sp)
	lw $v0, 136($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 56($sp)
	lw $v1, 144($sp)
	lw $v0, 4($v1)
	sw $v0, 64($sp)
	lw $v1, 56($sp)
	lw $v0, 64($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 68($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 136($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	li $v1 1
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 132($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	b L10
L9:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 156
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

