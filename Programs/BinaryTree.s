	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $s0 $v0
	li $a0 4
	jal _halloc
	move $s1 $v0
	la $s2 BT_Start
	sw $s2, 0($s0)
	sw $s0, 0($s1)
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	move $a0 $s1
	jalr $s2
	move $s0 $v0
	move $a0 $s0
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl BT_Start
BT_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 24
	sw $ra, -4($fp)
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $s3, 0($sp)
	li $a0 80
	jal _halloc
	move $s0 $v0
	li $a0 28
	jal _halloc
	move $s1 $v0
	la $s2 Tree_Init
	sw $s2, 0($s0)
	la $s2 Tree_SetRight
	sw $s2, 4($s0)
	la $s2 Tree_SetLeft
	sw $s2, 8($s0)
	la $s2 Tree_GetRight
	sw $s2, 12($s0)
	la $s2 Tree_GetLeft
	sw $s2, 16($s0)
	la $s2 Tree_GetKey
	sw $s2, 20($s0)
	la $s2 Tree_SetKey
	sw $s2, 24($s0)
	la $s2 Tree_GetHas_Right
	sw $s2, 28($s0)
	la $s2 Tree_GetHas_Left
	sw $s2, 32($s0)
	la $s2 Tree_SetHas_Left
	sw $s2, 36($s0)
	la $s2 Tree_SetHas_Right
	sw $s2, 40($s0)
	la $s2 Tree_Compare
	sw $s2, 44($s0)
	la $s2 Tree_Insert
	sw $s2, 48($s0)
	la $s2 Tree_Delete
	sw $s2, 52($s0)
	la $s2 Tree_Remove
	sw $s2, 56($s0)
	la $s2 Tree_RemoveRight
	sw $s2, 60($s0)
	la $s2 Tree_RemoveLeft
	sw $s2, 64($s0)
	la $s2 Tree_Search
	sw $s2, 68($s0)
	la $s2 Tree_Print
	sw $s2, 72($s0)
	la $s2 Tree_RecPrint
	sw $s2, 76($s0)
	sw $s0, 0($s1)
	move $s0 $s1
	li $s1 16
	lw $s2, 0($s0)
	lw $s3, 0($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	lw $s1, 0($s0)
	lw $s2, 72($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	li $s1 100000000
	move $a0 $s1
	jal _print
	li $s1 8
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	lw $s1, 0($s0)
	lw $s2, 72($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	li $s1 24
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 4
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 12
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 20
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 28
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 14
	lw $s2, 0($s0)
	lw $s3, 48($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	lw $s1, 0($s0)
	lw $s2, 72($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	li $s1 24
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s1 12
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s1 16
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s1 50
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s1 12
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s1 12
	lw $s2, 0($s0)
	lw $s3, 52($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	lw $s1, 0($s0)
	lw $s2, 72($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	li $s1 12
	lw $s2, 0($s0)
	lw $s3, 68($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	li $s0 0
	move $v0 $s0
	lw $s0, 12($sp)
	lw $s1, 8($sp)
	lw $s2, 4($sp)
	lw $s3, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 16($sp)
	addu $sp, $sp, 24
	j $ra
	
	.text
	.globl Tree_Init
Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 12($s0)
	li $s2 0
	sw $s2, 16($s0)
	li $s2 0
	sw $s2, 20($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_SetRight
Tree_SetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 8($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_SetLeft
Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 4($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_GetRight
Tree_GetRight:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	lw $s1, 8($s0)
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl Tree_GetLeft
Tree_GetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	lw $s1, 4($s0)
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl Tree_GetKey
Tree_GetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	lw $s1, 12($s0)
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl Tree_SetKey
Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 12($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	lw $s1, 20($s0)
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	lw $s1, 16($s0)
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 16($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 20
	sw $ra, -4($fp)
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	move $s0 $a0
	move $s1 $a1
	sw $s1, 20($s0)
	li $s2 1
	move $v0 $s2
	lw $s0, 8($sp)
	lw $s1, 4($sp)
	lw $s2, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 20
	j $ra
	
	.text
	.globl Tree_Compare
Tree_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 28
	sw $ra, -4($fp)
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $s3, 4($sp)
	sw $s4, 0($sp)
	move $s0 $a1
	move $s1 $a2
	li $s3 0
	move $s4 $s3
	li $s3 1
	move $v0 $s3
	add $s4, $s1, $v0
	move $s2 $s4
	move $v0 $s1
	slt $s3, $s0, $v0
	beqz $s3 L1
	li $s1 0
	move $s0 $s1
	b L2
L1:
	nop
	move $v0 $s2
	slt $s1, $s0, $v0
	li $s3 1
	move $v0 $s1
	sub $s4, $s3, $v0
	beqz $s4 L3
	li $s1 0
	move $s0 $s1
	b L4
L3:
	nop
	li $s1 1
	move $s0 $s1
L4:
	nop
L2:
	nop
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
	.globl Tree_Insert
Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 40
	sw $ra, -4($fp)
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)
	sw $s3, 16($sp)
	sw $s4, 12($sp)
	sw $s5, 8($sp)
	sw $s6, 4($sp)
	sw $s7, 0($sp)
	move $s0 $a0
	move $s1 $a1
	li $a0 80
	jal _halloc
	move $s5 $v0
	li $a0 28
	jal _halloc
	move $s6 $v0
	la $s7 Tree_Init
	sw $s7, 0($s5)
	la $s7 Tree_SetRight
	sw $s7, 4($s5)
	la $s7 Tree_SetLeft
	sw $s7, 8($s5)
	la $s7 Tree_GetRight
	sw $s7, 12($s5)
	la $s7 Tree_GetLeft
	sw $s7, 16($s5)
	la $s7 Tree_GetKey
	sw $s7, 20($s5)
	la $s7 Tree_SetKey
	sw $s7, 24($s5)
	la $s7 Tree_GetHas_Right
	sw $s7, 28($s5)
	la $s7 Tree_GetHas_Left
	sw $s7, 32($s5)
	la $s7 Tree_SetHas_Left
	sw $s7, 36($s5)
	la $s7 Tree_SetHas_Right
	sw $s7, 40($s5)
	la $s7 Tree_Compare
	sw $s7, 44($s5)
	la $s7 Tree_Insert
	sw $s7, 48($s5)
	la $s7 Tree_Delete
	sw $s7, 52($s5)
	la $s7 Tree_Remove
	sw $s7, 56($s5)
	la $s7 Tree_RemoveRight
	sw $s7, 60($s5)
	la $s7 Tree_RemoveLeft
	sw $s7, 64($s5)
	la $s7 Tree_Search
	sw $s7, 68($s5)
	la $s7 Tree_Print
	sw $s7, 72($s5)
	la $s7 Tree_RecPrint
	sw $s7, 76($s5)
	sw $s5, 0($s6)
	move $s2 $s6
	lw $s5, 0($s2)
	lw $s6, 0($s5)
	move $a0 $s2
	move $a1 $s1
	jalr $s6
	move $s5 $v0
	move $s6 $s5
	move $s4 $s0
	li $s5 1
	move $s3 $s5
L6:
	nop
	beqz $s3 L5
	lw $s0, 0($s4)
	lw $s5, 20($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	move $s5 $s0
	move $v0 $s5
	slt $s0, $s1, $v0
	beqz $s0 L7
	lw $s0, 0($s4)
	lw $s5, 32($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	beqz $s0 L9
	lw $s0, 0($s4)
	lw $s5, 16($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	move $s4 $s0
	b L10
L9:
	nop
	li $s0 0
	move $s3 $s0
	li $s0 1
	lw $s5, 0($s4)
	lw $s6, 36($s5)
	move $a0 $s4
	move $a1 $s0
	jalr $s6
	move $s5 $v0
	move $s0 $s5
	lw $s0, 0($s4)
	lw $s5, 8($s0)
	move $a0 $s4
	move $a1 $s2
	jalr $s5
	move $s0 $v0
	move $s5 $s0
L10:
	nop
	b L8
L7:
	nop
	lw $s0, 0($s4)
	lw $s5, 28($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	beqz $s0 L11
	lw $s0, 0($s4)
	lw $s5, 12($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	move $s4 $s0
	b L12
L11:
	nop
	li $s0 0
	move $s3 $s0
	li $s0 1
	lw $s5, 0($s4)
	lw $s6, 40($s5)
	move $a0 $s4
	move $a1 $s0
	jalr $s6
	move $s5 $v0
	move $s0 $s5
	lw $s0, 0($s4)
	lw $s5, 4($s0)
	move $a0 $s4
	move $a1 $s2
	jalr $s5
	move $s0 $v0
	move $s5 $s0
L12:
	nop
L8:
	nop
	b L6
L5:
	nop
	li $s0 1
	move $v0 $s0
	lw $s0, 28($sp)
	lw $s1, 24($sp)
	lw $s2, 20($sp)
	lw $s3, 16($sp)
	lw $s4, 12($sp)
	lw $s5, 8($sp)
	lw $s6, 4($sp)
	lw $s7, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 32($sp)
	addu $sp, $sp, 40
	j $ra
	
	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 48
	sw $ra, -4($fp)
	sw $s0, 36($sp)
	sw $s1, 32($sp)
	sw $s2, 28($sp)
	sw $s3, 24($sp)
	sw $s4, 20($sp)
	sw $s5, 16($sp)
	sw $s6, 12($sp)
	sw $s7, 8($sp)
	sw $t0, 4($sp)
	sw $t1, 0($sp)
	move $s0 $a0
	move $s1 $a1
	move $s2 $s0
	move $s3 $s0
	li $s7 1
	move $s4 $s7
	li $s7 0
	move $s5 $s7
	li $s7 1
	move $s6 $s7
L14:
	nop
	beqz $s4 L13
	lw $t0, 0($s2)
	lw $t1, 20($t0)
	move $a0 $s2
	jalr $t1
	move $t0 $v0
	move $s7 $t0
	move $v0 $s7
	slt $t0, $s1, $v0
	beqz $t0 L15
	lw $s6, 0($s2)
	lw $s7, 32($s6)
	move $a0 $s2
	jalr $s7
	move $s6 $v0
	beqz $s6 L17
	move $s3 $s2
	lw $s6, 0($s2)
	lw $s7, 16($s6)
	move $a0 $s2
	jalr $s7
	move $s6 $v0
	move $s2 $s6
	b L18
L17:
	nop
	li $s6 0
	move $s4 $s6
L18:
	nop
	b L16
L15:
	nop
	move $v0 $s1
	slt $t0, $s7, $v0
	beqz $t0 L19
	lw $s6, 0($s2)
	lw $s7, 28($s6)
	move $a0 $s2
	jalr $s7
	move $s6 $v0
	beqz $s6 L21
	move $s3 $s2
	lw $s6, 0($s2)
	lw $s7, 12($s6)
	move $a0 $s2
	jalr $s7
	move $s6 $v0
	move $s2 $s6
	b L22
L21:
	nop
	li $s6 0
	move $s4 $s6
L22:
	nop
	b L20
L19:
	nop
	beqz $s6 L23
	lw $s4, 0($s2)
	lw $s5, 28($s4)
	move $a0 $s2
	jalr $s5
	move $s4 $v0
	li $s5 1
	move $v0 $s4
	sub $s6, $s5, $v0
	beqz $s6 L27
	lw $s5, 0($s2)
	lw $s6, 32($s5)
	move $a0 $s2
	jalr $s6
	move $s5 $v0
	li $s6 1
	move $v0 $s5
	sub $s7, $s6, $v0
	move $s4 $s7
	b L28
L27:
	nop
	li $s4 0
L28:
	nop
	beqz $s4 L25
	li $s4 1
	move $s5 $s4
	b L26
L25:
	nop
	lw $s4, 0($s0)
	lw $s5, 56($s4)
	move $a0 $s0
	move $a1 $s3
	move $a2 $s2
	jalr $s5
	move $s4 $v0
	move $s5 $s4
L26:
	nop
	b L24
L23:
	nop
	lw $s4, 0($s0)
	lw $s5, 56($s4)
	move $a0 $s0
	move $a1 $s3
	move $a2 $s2
	jalr $s5
	move $s4 $v0
	move $s5 $s4
L24:
	nop
	li $s6 1
	move $s5 $s6
	li $s6 0
	move $s4 $s6
L20:
	nop
L16:
	nop
	li $s7 0
	move $s6 $s7
	b L14
L13:
	nop
	move $v0 $s5
	lw $s0, 36($sp)
	lw $s1, 32($sp)
	lw $s2, 28($sp)
	lw $s3, 24($sp)
	lw $s4, 20($sp)
	lw $s5, 16($sp)
	lw $s6, 12($sp)
	lw $s7, 8($sp)
	lw $t0, 4($sp)
	lw $t1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 40($sp)
	addu $sp, $sp, 48
	j $ra
	
	.text
	.globl Tree_Remove
Tree_Remove:
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
	move $s2 $a2
	lw $s3, 0($s2)
	lw $s4, 32($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	beqz $s3 L29
	lw $s3, 0($s0)
	lw $s4, 64($s3)
	move $a0 $s0
	move $a1 $s1
	move $a2 $s2
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	b L30
L29:
	nop
	lw $s3, 0($s2)
	lw $s4, 28($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	beqz $s3 L31
	lw $s3, 0($s0)
	lw $s4, 60($s3)
	move $a0 $s0
	move $a1 $s1
	move $a2 $s2
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	b L32
L31:
	nop
	lw $s3, 0($s2)
	lw $s4, 20($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	lw $s3, 0($s1)
	lw $s5, 16($s3)
	move $a0 $s1
	jalr $s5
	move $s3 $v0
	lw $s5, 0($s3)
	lw $s6, 20($s5)
	move $a0 $s3
	jalr $s6
	move $s5 $v0
	move $s3 $s5
	lw $s5, 0($s0)
	lw $s6, 44($s5)
	move $a0 $s0
	move $a1 $s4
	move $a2 $s3
	jalr $s6
	move $s5 $v0
	beqz $s5 L33
	lw $s2, 24($s0)
	lw $s3, 0($s1)
	lw $s4, 8($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 0
	lw $s3, 0($s1)
	lw $s4, 36($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	b L34
L33:
	nop
	lw $s2, 24($s0)
	lw $s3, 0($s1)
	lw $s4, 4($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 0
	lw $s3, 0($s1)
	lw $s4, 40($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
L34:
	nop
L32:
	nop
L30:
	nop
	li $s0 1
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
	.globl Tree_RemoveRight
Tree_RemoveRight:
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
	move $s2 $a2
L36:
	nop
	lw $s3, 0($s2)
	lw $s4, 28($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	beqz $s3 L35
	lw $s3, 0($s2)
	lw $s4, 12($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	lw $s4, 0($s3)
	lw $s5, 20($s4)
	move $a0 $s3
	jalr $s5
	move $s4 $v0
	lw $s3, 0($s2)
	lw $s5, 24($s3)
	move $a0 $s2
	move $a1 $s4
	jalr $s5
	move $s3 $v0
	move $s4 $s3
	move $s1 $s2
	lw $s3, 0($s2)
	lw $s4, 12($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	b L36
L35:
	nop
	lw $s2, 24($s0)
	lw $s3, 0($s1)
	lw $s4, 4($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 0
	lw $s3, 0($s1)
	lw $s4, 40($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 1
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
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
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
	move $s2 $a2
L38:
	nop
	lw $s3, 0($s2)
	lw $s4, 32($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	beqz $s3 L37
	lw $s3, 0($s2)
	lw $s4, 16($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	lw $s4, 0($s3)
	lw $s5, 20($s4)
	move $a0 $s3
	jalr $s5
	move $s4 $v0
	lw $s3, 0($s2)
	lw $s5, 24($s3)
	move $a0 $s2
	move $a1 $s4
	jalr $s5
	move $s3 $v0
	move $s4 $s3
	move $s1 $s2
	lw $s3, 0($s2)
	lw $s4, 16($s3)
	move $a0 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	b L38
L37:
	nop
	lw $s2, 24($s0)
	lw $s3, 0($s1)
	lw $s4, 8($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 0
	lw $s3, 0($s1)
	lw $s4, 36($s3)
	move $a0 $s1
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	li $s2 1
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
	.globl Tree_Search
Tree_Search:
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
	move $s4 $s0
	li $s5 1
	move $s2 $s5
	li $s5 0
	move $s3 $s5
L40:
	nop
	beqz $s2 L39
	lw $s5, 0($s4)
	lw $s6, 20($s5)
	move $a0 $s4
	jalr $s6
	move $s5 $v0
	move $s0 $s5
	move $v0 $s0
	slt $s5, $s1, $v0
	beqz $s5 L41
	lw $s0, 0($s4)
	lw $s5, 32($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	beqz $s0 L43
	lw $s0, 0($s4)
	lw $s5, 16($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	move $s4 $s0
	b L44
L43:
	nop
	li $s0 0
	move $s2 $s0
L44:
	nop
	b L42
L41:
	nop
	move $v0 $s1
	slt $s5, $s0, $v0
	beqz $s5 L45
	lw $s0, 0($s4)
	lw $s5, 28($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	beqz $s0 L47
	lw $s0, 0($s4)
	lw $s5, 12($s0)
	move $a0 $s4
	jalr $s5
	move $s0 $v0
	move $s4 $s0
	b L48
L47:
	nop
	li $s0 0
	move $s2 $s0
L48:
	nop
	b L46
L45:
	nop
	li $s0 1
	move $s3 $s0
	li $s0 0
	move $s2 $s0
L46:
	nop
L42:
	nop
	b L40
L39:
	nop
	move $v0 $s3
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
	.globl Tree_Print
Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 24
	sw $ra, -4($fp)
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $s3, 0($sp)
	move $s0 $a0
	move $s1 $s0
	lw $s2, 0($s0)
	lw $s3, 76($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s1 $s2
	li $s1 1
	move $v0 $s1
	lw $s0, 12($sp)
	lw $s1, 8($sp)
	lw $s2, 4($sp)
	lw $s3, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 16($sp)
	addu $sp, $sp, 24
	j $ra
	
	.text
	.globl Tree_RecPrint
Tree_RecPrint:
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
	lw $s2, 0($s1)
	lw $s3, 32($s2)
	move $a0 $s1
	jalr $s3
	move $s2 $v0
	beqz $s2 L49
	lw $s2, 0($s1)
	lw $s3, 16($s2)
	move $a0 $s1
	jalr $s3
	move $s2 $v0
	lw $s3, 0($s0)
	lw $s4, 76($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	b L50
L49:
	nop
	li $s2 1
	move $s3 $s2
L50:
	nop
	lw $s2, 0($s1)
	lw $s3, 20($s2)
	move $a0 $s1
	jalr $s3
	move $s2 $v0
	move $a0 $s2
	jal _print
	lw $s2, 0($s1)
	lw $s3, 28($s2)
	move $a0 $s1
	jalr $s3
	move $s2 $v0
	beqz $s2 L51
	lw $s2, 0($s1)
	lw $s3, 12($s2)
	move $a0 $s1
	jalr $s3
	move $s2 $v0
	lw $s3, 0($s0)
	lw $s4, 76($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s2 $s3
	b L52
L51:
	nop
	li $s0 1
	move $s1 $s0
L52:
	nop
	li $s0 1
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

