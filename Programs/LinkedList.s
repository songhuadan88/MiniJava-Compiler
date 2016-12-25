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
	la $s2 LL_Start
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
	.globl Element_Init
Element_Init:
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
	move $s2 $a2
	move $s3 $a3
	sw $s1, 4($s0)
	sw $s2, 8($s0)
	sw $s3, 12($s0)
	li $s4 1
	move $v0 $s4
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
	.globl Element_GetAge
Element_GetAge:
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
	.globl Element_GetSalary
Element_GetSalary:
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
	.globl Element_GetMarried
Element_GetMarried:
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
	.globl Element_Equal
Element_Equal:
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
	li $s3 1
	move $s2 $s3
	lw $s3, 0($s1)
	lw $s4, 4($s3)
	move $a0 $s1
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	lw $s3, 4($s0)
	lw $s5, 0($s0)
	lw $s6, 20($s5)
	move $a0 $s0
	move $a1 $s4
	move $a2 $s3
	jalr $s6
	move $s5 $v0
	li $s3 1
	move $v0 $s5
	sub $s4, $s3, $v0
	beqz $s4 L1
	li $s0 0
	move $s2 $s0
	b L2
L1:
	nop
	lw $s3, 0($s1)
	lw $s4, 8($s3)
	move $a0 $s1
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	lw $s3, 8($s0)
	lw $s5, 0($s0)
	lw $s6, 20($s5)
	move $a0 $s0
	move $a1 $s4
	move $a2 $s3
	jalr $s6
	move $s5 $v0
	li $s3 1
	move $v0 $s5
	sub $s4, $s3, $v0
	beqz $s4 L3
	li $s0 0
	move $s2 $s0
	b L4
L3:
	nop
	lw $s3, 12($s0)
	beqz $s3 L5
	lw $s0, 0($s1)
	lw $s3, 12($s0)
	move $a0 $s1
	jalr $s3
	move $s0 $v0
	li $s3 1
	move $v0 $s0
	sub $s4, $s3, $v0
	beqz $s4 L7
	li $s0 0
	move $s2 $s0
	b L8
L7:
	nop
	li $s0 0
	move $s1 $s0
L8:
	nop
	b L6
L5:
	nop
	lw $s0, 0($s1)
	lw $s3, 12($s0)
	move $a0 $s1
	jalr $s3
	move $s0 $v0
	beqz $s0 L9
	li $s0 0
	move $s2 $s0
	b L10
L9:
	nop
	li $s0 0
	move $s1 $s0
L10:
	nop
L6:
	nop
L4:
	nop
L2:
	nop
	move $v0 $s2
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
	.globl Element_Compare
Element_Compare:
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
	beqz $s3 L11
	li $s1 0
	move $s0 $s1
	b L12
L11:
	nop
	move $v0 $s2
	slt $s1, $s0, $v0
	li $s3 1
	move $v0 $s1
	sub $s4, $s3, $v0
	beqz $s4 L13
	li $s1 0
	move $s0 $s1
	b L14
L13:
	nop
	li $s1 1
	move $s0 $s1
L14:
	nop
L12:
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
	.globl List_Init
List_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 16
	sw $ra, -4($fp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0 $a0
	li $s1 1
	sw $s1, 12($s0)
	li $s1 1
	move $v0 $s1
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 8($sp)
	addu $sp, $sp, 16
	j $ra
	
	.text
	.globl List_InitNew
List_InitNew:
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
	move $s2 $a2
	move $s3 $a3
	sw $s3, 12($s0)
	sw $s1, 4($s0)
	sw $s2, 8($s0)
	li $s4 1
	move $v0 $s4
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
	.globl List_Insert
List_Insert:
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
	move $s2 $s0
	li $a0 40
	jal _halloc
	move $s3 $v0
	li $a0 16
	jal _halloc
	move $s4 $v0
	la $s5 List_Init
	sw $s5, 0($s3)
	la $s5 List_InitNew
	sw $s5, 4($s3)
	la $s5 List_Insert
	sw $s5, 8($s3)
	la $s5 List_SetNext
	sw $s5, 12($s3)
	la $s5 List_Delete
	sw $s5, 16($s3)
	la $s5 List_Search
	sw $s5, 20($s3)
	la $s5 List_GetEnd
	sw $s5, 24($s3)
	la $s5 List_GetElem
	sw $s5, 28($s3)
	la $s5 List_GetNext
	sw $s5, 32($s3)
	la $s5 List_Print
	sw $s5, 36($s3)
	sw $s3, 0($s4)
	move $s3 $s4
	li $s4 0
	lw $s5, 0($s3)
	lw $s6, 4($s5)
	move $a0 $s3
	move $a1 $s1
	move $a2 $s2
	move $a3 $s4
	jalr $s6
	move $s5 $v0
	move $s2 $s5
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
	.globl List_SetNext
List_SetNext:
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
	.globl List_Delete
List_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $s0, 44($sp)
	sw $s1, 40($sp)
	sw $s2, 36($sp)
	sw $s3, 32($sp)
	sw $s4, 28($sp)
	sw $s5, 24($sp)
	sw $s6, 20($sp)
	sw $s7, 16($sp)
	sw $t0, 12($sp)
	sw $t1, 8($sp)
	sw $t2, 4($sp)
	sw $t3, 0($sp)
	move $s0 $a0
	move $s1 $a1
	move $s2 $s0
	li $t1 0
	move $s3 $t1
	li $t1 0
	li $t2 1
	move $v0 $t2
	sub $t3, $t1, $v0
	move $t0 $t3
	move $s4 $s0
	move $s5 $s0
	lw $t1, 12($s0)
	move $s6 $t1
	lw $t1, 4($s0)
	move $s7 $t1
L16:
	nop
	li $s0 1
	move $v0 $s6
	sub $t1, $s0, $v0
	beqz $t1 L17
	li $t1 1
	move $v0 $s3
	sub $t2, $t1, $v0
	move $s0 $t2
	b L18
L17:
	nop
	li $s0 0
L18:
	nop
	beqz $s0 L15
	lw $s0, 0($s1)
	lw $t1, 16($s0)
	move $a0 $s1
	move $a1 $s7
	jalr $t1
	move $s0 $v0
	beqz $s0 L19
	li $s0 1
	move $s3 $s0
	li $s0 0
	move $v0 $s0
	slt $t1, $t0, $v0
	beqz $t1 L21
	lw $s0, 0($s4)
	lw $t1, 32($s0)
	move $a0 $s4
	jalr $t1
	move $s0 $v0
	move $s2 $s0
	b L22
L21:
	nop
	li $s0 0
	li $t1 555
	move $v0 $t1
	sub $t2, $s0, $v0
	move $a0 $t2
	jal _print
	lw $s0, 0($s4)
	lw $t1, 32($s0)
	move $a0 $s4
	jalr $t1
	move $s0 $v0
	lw $t1, 0($s5)
	lw $t2, 12($t1)
	move $a0 $s5
	move $a1 $s0
	jalr $t2
	move $t1 $v0
	move $s0 $t1
	li $s0 0
	li $t1 555
	move $v0 $t1
	sub $t2, $s0, $v0
	move $a0 $t2
	jal _print
L22:
	nop
	b L20
L19:
	nop
	li $s0 0
	move $t1 $s0
L20:
	nop
	li $s0 1
	move $v0 $s3
	sub $t1, $s0, $v0
	beqz $t1 L23
	move $s5 $s4
	lw $s0, 0($s4)
	lw $t1, 32($s0)
	move $a0 $s4
	jalr $t1
	move $s0 $v0
	move $s4 $s0
	lw $s0, 0($s4)
	lw $t1, 24($s0)
	move $a0 $s4
	jalr $t1
	move $s0 $v0
	move $s6 $s0
	lw $s0, 0($s4)
	lw $t1, 28($s0)
	move $a0 $s4
	jalr $t1
	move $s0 $v0
	move $s7 $s0
	li $s0 1
	move $t0 $s0
	b L24
L23:
	nop
	li $s0 0
	move $t1 $s0
L24:
	nop
	b L16
L15:
	nop
	move $v0 $s2
	lw $s0, 44($sp)
	lw $s1, 40($sp)
	lw $s2, 36($sp)
	lw $s3, 32($sp)
	lw $s4, 28($sp)
	lw $s5, 24($sp)
	lw $s6, 20($sp)
	lw $s7, 16($sp)
	lw $t0, 12($sp)
	lw $t1, 8($sp)
	lw $t2, 4($sp)
	lw $t3, 0($sp)
	lw $ra, -4($fp)
	lw $fp, 48($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl List_Search
List_Search:
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
	li $s6 0
	move $s2 $s6
	move $s3 $s0
	lw $s6, 12($s0)
	move $s5 $s6
	lw $s6, 4($s0)
	move $s4 $s6
L26:
	nop
	li $s0 1
	move $v0 $s5
	sub $s6, $s0, $v0
	beqz $s6 L25
	lw $s0, 0($s1)
	lw $s5, 16($s0)
	move $a0 $s1
	move $a1 $s4
	jalr $s5
	move $s0 $v0
	beqz $s0 L27
	li $s0 1
	move $s2 $s0
	b L28
L27:
	nop
	li $s0 0
	move $s4 $s0
L28:
	nop
	lw $s0, 0($s3)
	lw $s6, 32($s0)
	move $a0 $s3
	jalr $s6
	move $s0 $v0
	move $s3 $s0
	lw $s0, 0($s3)
	lw $s6, 24($s0)
	move $a0 $s3
	jalr $s6
	move $s0 $v0
	move $s5 $s0
	lw $s0, 0($s3)
	lw $s6, 28($s0)
	move $a0 $s3
	jalr $s6
	move $s0 $v0
	move $s4 $s0
	b L26
L25:
	nop
	move $v0 $s2
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
	.globl List_GetEnd
List_GetEnd:
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
	.globl List_GetElem
List_GetElem:
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
	.globl List_GetNext
List_GetNext:
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
	.globl List_Print
List_Print:
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
	move $s1 $s0
	lw $s4, 12($s0)
	move $s2 $s4
	lw $s4, 4($s0)
	move $s3 $s4
L30:
	nop
	li $s0 1
	move $v0 $s2
	sub $s4, $s0, $v0
	beqz $s4 L29
	lw $s0, 0($s3)
	lw $s4, 4($s0)
	move $a0 $s3
	jalr $s4
	move $s0 $v0
	move $a0 $s0
	jal _print
	lw $s0, 0($s1)
	lw $s4, 32($s0)
	move $a0 $s1
	jalr $s4
	move $s0 $v0
	move $s1 $s0
	lw $s0, 0($s1)
	lw $s4, 24($s0)
	move $a0 $s1
	jalr $s4
	move $s0 $v0
	move $s2 $s0
	lw $s0, 0($s1)
	lw $s4, 28($s0)
	move $a0 $s1
	jalr $s4
	move $s0 $v0
	move $s3 $s0
	b L30
L29:
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
	.globl LL_Start
LL_Start:
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
	li $a0 40
	jal _halloc
	move $s0 $v0
	li $a0 16
	jal _halloc
	move $s1 $v0
	la $s2 List_Init
	sw $s2, 0($s0)
	la $s2 List_InitNew
	sw $s2, 4($s0)
	la $s2 List_Insert
	sw $s2, 8($s0)
	la $s2 List_SetNext
	sw $s2, 12($s0)
	la $s2 List_Delete
	sw $s2, 16($s0)
	la $s2 List_Search
	sw $s2, 20($s0)
	la $s2 List_GetEnd
	sw $s2, 24($s0)
	la $s2 List_GetElem
	sw $s2, 28($s0)
	la $s2 List_GetNext
	sw $s2, 32($s0)
	la $s2 List_Print
	sw $s2, 36($s0)
	sw $s0, 0($s1)
	move $s0 $s1
	lw $s1, 0($s0)
	lw $s2, 0($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	move $s1 $s0
	lw $s0, 0($s1)
	lw $s2, 0($s0)
	move $a0 $s1
	jalr $s2
	move $s0 $v0
	move $s2 $s0
	lw $s0, 0($s1)
	lw $s2, 36($s0)
	move $a0 $s1
	jalr $s2
	move $s0 $v0
	move $s2 $s0
	li $a0 24
	jal _halloc
	move $s0 $v0
	li $a0 16
	jal _halloc
	move $s2 $v0
	la $s3 Element_Init
	sw $s3, 0($s0)
	la $s3 Element_GetAge
	sw $s3, 4($s0)
	la $s3 Element_GetSalary
	sw $s3, 8($s0)
	la $s3 Element_GetMarried
	sw $s3, 12($s0)
	la $s3 Element_Equal
	sw $s3, 16($s0)
	la $s3 Element_Compare
	sw $s3, 20($s0)
	sw $s0, 0($s2)
	move $s0 $s2
	li $s2 25
	li $s3 37000
	li $s4 0
	lw $s5, 0($s0)
	lw $s6, 0($s5)
	move $a0 $s0
	move $a1 $s2
	move $a2 $s3
	move $a3 $s4
	jalr $s6
	move $s5 $v0
	move $s2 $s5
	lw $s2, 0($s1)
	lw $s3, 8($s2)
	move $a0 $s1
	move $a1 $s0
	jalr $s3
	move $s2 $v0
	move $s0 $s2
	lw $s1, 0($s0)
	lw $s2, 36($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s2 $s1
	li $s1 10000000
	move $a0 $s1
	jal _print
	li $a0 24
	jal _halloc
	move $s1 $v0
	li $a0 16
	jal _halloc
	move $s2 $v0
	la $s3 Element_Init
	sw $s3, 0($s1)
	la $s3 Element_GetAge
	sw $s3, 4($s1)
	la $s3 Element_GetSalary
	sw $s3, 8($s1)
	la $s3 Element_GetMarried
	sw $s3, 12($s1)
	la $s3 Element_Equal
	sw $s3, 16($s1)
	la $s3 Element_Compare
	sw $s3, 20($s1)
	sw $s1, 0($s2)
	move $s1 $s2
	li $s2 39
	li $s3 42000
	li $s4 1
	lw $s5, 0($s1)
	lw $s6, 0($s5)
	move $a0 $s1
	move $a1 $s2
	move $a2 $s3
	move $a3 $s4
	jalr $s6
	move $s5 $v0
	move $s2 $s5
	move $s2 $s1
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s1
	jalr $s4
	move $s3 $v0
	move $s0 $s3
	lw $s1, 0($s0)
	lw $s3, 36($s1)
	move $a0 $s0
	jalr $s3
	move $s1 $v0
	move $s3 $s1
	li $s1 10000000
	move $a0 $s1
	jal _print
	li $a0 24
	jal _halloc
	move $s1 $v0
	li $a0 16
	jal _halloc
	move $s3 $v0
	la $s4 Element_Init
	sw $s4, 0($s1)
	la $s4 Element_GetAge
	sw $s4, 4($s1)
	la $s4 Element_GetSalary
	sw $s4, 8($s1)
	la $s4 Element_GetMarried
	sw $s4, 12($s1)
	la $s4 Element_Equal
	sw $s4, 16($s1)
	la $s4 Element_Compare
	sw $s4, 20($s1)
	sw $s1, 0($s3)
	move $s1 $s3
	li $s3 22
	li $s4 34000
	li $s5 0
	lw $s6, 0($s1)
	lw $s7, 0($s6)
	move $a0 $s1
	move $a1 $s3
	move $a2 $s4
	move $a3 $s5
	jalr $s7
	move $s6 $v0
	move $s3 $s6
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s1
	jalr $s4
	move $s3 $v0
	move $s0 $s3
	lw $s1, 0($s0)
	lw $s3, 36($s1)
	move $a0 $s0
	jalr $s3
	move $s1 $v0
	move $s3 $s1
	li $a0 24
	jal _halloc
	move $s1 $v0
	li $a0 16
	jal _halloc
	move $s3 $v0
	la $s4 Element_Init
	sw $s4, 0($s1)
	la $s4 Element_GetAge
	sw $s4, 4($s1)
	la $s4 Element_GetSalary
	sw $s4, 8($s1)
	la $s4 Element_GetMarried
	sw $s4, 12($s1)
	la $s4 Element_Equal
	sw $s4, 16($s1)
	la $s4 Element_Compare
	sw $s4, 20($s1)
	sw $s1, 0($s3)
	move $s1 $s3
	li $s3 27
	li $s4 34000
	li $s5 0
	lw $s6, 0($s1)
	lw $s7, 0($s6)
	move $a0 $s1
	move $a1 $s3
	move $a2 $s4
	move $a3 $s5
	jalr $s7
	move $s6 $v0
	move $s3 $s6
	lw $s3, 0($s0)
	lw $s4, 20($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	lw $s3, 0($s0)
	lw $s4, 20($s3)
	move $a0 $s0
	move $a1 $s1
	jalr $s4
	move $s3 $v0
	move $a0 $s3
	jal _print
	li $s1 10000000
	move $a0 $s1
	jal _print
	li $a0 24
	jal _halloc
	move $s1 $v0
	li $a0 16
	jal _halloc
	move $s3 $v0
	la $s4 Element_Init
	sw $s4, 0($s1)
	la $s4 Element_GetAge
	sw $s4, 4($s1)
	la $s4 Element_GetSalary
	sw $s4, 8($s1)
	la $s4 Element_GetMarried
	sw $s4, 12($s1)
	la $s4 Element_Equal
	sw $s4, 16($s1)
	la $s4 Element_Compare
	sw $s4, 20($s1)
	sw $s1, 0($s3)
	move $s1 $s3
	li $s3 28
	li $s4 35000
	li $s5 0
	lw $s6, 0($s1)
	lw $s7, 0($s6)
	move $a0 $s1
	move $a1 $s3
	move $a2 $s4
	move $a3 $s5
	jalr $s7
	move $s6 $v0
	move $s3 $s6
	lw $s3, 0($s0)
	lw $s4, 8($s3)
	move $a0 $s0
	move $a1 $s1
	jalr $s4
	move $s3 $v0
	move $s0 $s3
	lw $s3, 0($s0)
	lw $s4, 36($s3)
	move $a0 $s0
	jalr $s4
	move $s3 $v0
	move $s4 $s3
	li $s3 2220000
	move $a0 $s3
	jal _print
	lw $s3, 0($s0)
	lw $s4, 16($s3)
	move $a0 $s0
	move $a1 $s2
	jalr $s4
	move $s3 $v0
	move $s0 $s3
	lw $s2, 0($s0)
	lw $s3, 36($s2)
	move $a0 $s0
	jalr $s3
	move $s2 $v0
	move $s3 $s2
	li $s2 33300000
	move $a0 $s2
	jal _print
	lw $s2, 0($s0)
	lw $s3, 16($s2)
	move $a0 $s0
	move $a1 $s1
	jalr $s3
	move $s2 $v0
	move $s0 $s2
	lw $s1, 0($s0)
	lw $s2, 36($s1)
	move $a0 $s0
	jalr $s2
	move $s1 $v0
	move $s0 $s1
	li $s0 44440000
	move $a0 $s0
	jal _print
	li $s0 0
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

