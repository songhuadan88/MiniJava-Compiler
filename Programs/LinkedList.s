	.text
	.globl main
main:
	move $fp, $sp
	subu $sp, $sp, 72
	sw $ra, -4($fp)
	li $a0 4
	jal _halloc
	move $v1 $v0
	sw $v1, 56($sp)
	li $a0 4
	jal _halloc
	move $v1 $v0
	sw $v1, 52($sp)
	la $v1 LL_Start
	sw $v1, 48($sp)
	lw $v1, 56($sp)
	lw $v0, 48($sp)
	sw $v0, 0($v1)
	lw $v1, 52($sp)
	lw $v0, 56($sp)
	sw $v0, 0($v1)
	lw $v1, 52($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 0($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 52($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $a0 $v1
	jal _print
	lw $ra, -4($fp)
	addu $sp, $sp, 72
	j $ra
	
	.text
	.globl Element_Init
Element_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 64
	sw $ra, -4($fp)
	sw $a0, 52($sp)
	sw $a1, 48($sp)
	sw $a2, 44($sp)
	sw $a3, 40($sp)
	lw $v1, 52($sp)
	lw $v0, 48($sp)
	sw $v0, 4($v1)
	lw $v1, 52($sp)
	lw $v0, 44($sp)
	sw $v0, 8($v1)
	lw $v1, 52($sp)
	lw $v0, 40($sp)
	sw $v0, 12($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 56($sp)
	addu $sp, $sp, 64
	j $ra
	
	.text
	.globl Element_GetAge
Element_GetAge:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 4($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Element_GetSalary
Element_GetSalary:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 8($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Element_GetMarried
Element_GetMarried:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 12($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Element_Equal
Element_Equal:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 204
	sw $ra, -4($fp)
	sw $a0, 192($sp)
	sw $a1, 188($sp)
	li $v1 1
	sw $v1, 168($sp)
	lw $v1, 168($sp)
	move $v1 $v1
	sw $v1, 184($sp)
	lw $v1, 188($sp)
	lw $v0, 0($v1)
	sw $v0, 164($sp)
	lw $v1, 164($sp)
	lw $v0, 4($v1)
	sw $v0, 160($sp)
	lw $v1, 160($sp)
	lw $v0, 188($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 156($sp)
	lw $v1, 156($sp)
	move $v1 $v1
	sw $v1, 180($sp)
	lw $v1, 192($sp)
	lw $v0, 4($v1)
	sw $v0, 152($sp)
	lw $v1, 192($sp)
	lw $v0, 0($v1)
	sw $v0, 148($sp)
	lw $v1, 148($sp)
	lw $v0, 20($v1)
	sw $v0, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 192($sp)
	move $a0 $v0
	lw $v0, 180($sp)
	move $a1 $v0
	lw $v0, 152($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 140($sp)
	li $v1 1
	sw $v1, 136($sp)
	lw $v1, 140($sp)
	lw $v0, 136($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 132($sp)
	lw $v1, 132($sp)
	beqz $v1 L1
	li $v1 0
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	move $v1 $v1
	sw $v1, 184($sp)
	b L2
L1:
	nop
	lw $v1, 188($sp)
	lw $v0, 0($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 8($v1)
	sw $v0, 120($sp)
	lw $v1, 120($sp)
	lw $v0, 188($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	move $v1 $v1
	sw $v1, 176($sp)
	lw $v1, 192($sp)
	lw $v0, 8($v1)
	sw $v0, 112($sp)
	lw $v1, 192($sp)
	lw $v0, 0($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 20($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 192($sp)
	move $a0 $v0
	lw $v0, 176($sp)
	move $a1 $v0
	lw $v0, 112($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 100($sp)
	li $v1 1
	sw $v1, 96($sp)
	lw $v1, 100($sp)
	lw $v0, 96($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	beqz $v1 L3
	li $v1 0
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	move $v1 $v1
	sw $v1, 184($sp)
	b L4
L3:
	nop
	lw $v1, 192($sp)
	lw $v0, 12($v1)
	sw $v0, 84($sp)
	lw $v1, 84($sp)
	beqz $v1 L5
	lw $v1, 188($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 12($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 188($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	li $v1 1
	sw $v1, 68($sp)
	lw $v1, 72($sp)
	lw $v0, 68($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	beqz $v1 L7
	li $v1 0
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	move $v1 $v1
	sw $v1, 184($sp)
	b L8
L7:
	nop
	li $v1 0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 172($sp)
L8:
	nop
	b L6
L5:
	nop
	lw $v1, 188($sp)
	lw $v0, 0($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 12($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 188($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	beqz $v1 L9
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 184($sp)
	b L10
L9:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 172($sp)
L10:
	nop
L6:
	nop
L4:
	nop
L2:
	nop
	lw $v1, 184($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 196($sp)
	addu $sp, $sp, 204
	j $ra
	
	.text
	.globl Element_Compare
Element_Compare:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 104
	sw $ra, -4($fp)
	sw $a0, 92($sp)
	sw $a1, 88($sp)
	sw $a2, 84($sp)
	li $v1 0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 80($sp)
	li $v1 1
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 84($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	move $v1 $v1
	sw $v1, 76($sp)
	lw $v1, 84($sp)
	lw $v0, 88($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	beqz $v1 L11
	li $v1 0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 80($sp)
	b L12
L11:
	nop
	lw $v1, 76($sp)
	lw $v0, 88($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 52($sp)
	li $v1 1
	sw $v1, 48($sp)
	lw $v1, 52($sp)
	lw $v0, 48($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	beqz $v1 L13
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 80($sp)
	b L14
L13:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 80($sp)
L14:
	nop
L12:
	nop
	lw $v1, 80($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 96($sp)
	addu $sp, $sp, 104
	j $ra
	
	.text
	.globl List_Init
List_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	li $v1 1
	sw $v1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 12($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 48($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl List_InitNew
List_InitNew:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 64
	sw $ra, -4($fp)
	sw $a0, 52($sp)
	sw $a1, 48($sp)
	sw $a2, 44($sp)
	sw $a3, 40($sp)
	lw $v1, 52($sp)
	lw $v0, 40($sp)
	sw $v0, 12($v1)
	lw $v1, 52($sp)
	lw $v0, 48($sp)
	sw $v0, 4($v1)
	lw $v1, 52($sp)
	lw $v0, 44($sp)
	sw $v0, 8($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 56($sp)
	addu $sp, $sp, 64
	j $ra
	
	.text
	.globl List_Insert
List_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 128
	sw $ra, -4($fp)
	sw $a0, 116($sp)
	sw $a1, 112($sp)
	lw $v1, 116($sp)
	move $v1 $v1
	sw $v1, 104($sp)
	li $a0 40
	jal _halloc
	move $v1 $v0
	sw $v1, 96($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 92($sp)
	la $v1 List_Init
	sw $v1, 88($sp)
	lw $v1, 96($sp)
	lw $v0, 88($sp)
	sw $v0, 0($v1)
	la $v1 List_InitNew
	sw $v1, 84($sp)
	lw $v1, 96($sp)
	lw $v0, 84($sp)
	sw $v0, 4($v1)
	la $v1 List_Insert
	sw $v1, 80($sp)
	lw $v1, 96($sp)
	lw $v0, 80($sp)
	sw $v0, 8($v1)
	la $v1 List_SetNext
	sw $v1, 76($sp)
	lw $v1, 96($sp)
	lw $v0, 76($sp)
	sw $v0, 12($v1)
	la $v1 List_Delete
	sw $v1, 72($sp)
	lw $v1, 96($sp)
	lw $v0, 72($sp)
	sw $v0, 16($v1)
	la $v1 List_Search
	sw $v1, 68($sp)
	lw $v1, 96($sp)
	lw $v0, 68($sp)
	sw $v0, 20($v1)
	la $v1 List_GetEnd
	sw $v1, 64($sp)
	lw $v1, 96($sp)
	lw $v0, 64($sp)
	sw $v0, 24($v1)
	la $v1 List_GetElem
	sw $v1, 60($sp)
	lw $v1, 96($sp)
	lw $v0, 60($sp)
	sw $v0, 28($v1)
	la $v1 List_GetNext
	sw $v1, 56($sp)
	lw $v1, 96($sp)
	lw $v0, 56($sp)
	sw $v0, 32($v1)
	la $v1 List_Print
	sw $v1, 52($sp)
	lw $v1, 96($sp)
	lw $v0, 52($sp)
	sw $v0, 36($v1)
	lw $v1, 92($sp)
	lw $v0, 96($sp)
	sw $v0, 0($v1)
	lw $v1, 92($sp)
	move $v1 $v1
	sw $v1, 100($sp)
	li $v1 0
	sw $v1, 48($sp)
	lw $v1, 100($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 4($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 100($sp)
	move $a0 $v0
	lw $v0, 112($sp)
	move $a1 $v0
	lw $v0, 104($sp)
	move $a2 $v0
	lw $v0, 48($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	lw $v1, 100($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 120($sp)
	addu $sp, $sp, 128
	j $ra
	
	.text
	.globl List_SetNext
List_SetNext:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	sw $a1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 8($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 48($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl List_Delete
List_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 272
	sw $ra, -4($fp)
	sw $a0, 260($sp)
	sw $a1, 256($sp)
	lw $v1, 260($sp)
	move $v1 $v1
	sw $v1, 252($sp)
	li $v1 0
	sw $v1, 216($sp)
	lw $v1, 216($sp)
	move $v1 $v1
	sw $v1, 248($sp)
	li $v1 0
	sw $v1, 212($sp)
	li $v1 1
	sw $v1, 208($sp)
	lw $v1, 208($sp)
	lw $v0, 212($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 204($sp)
	lw $v1, 204($sp)
	move $v1 $v1
	sw $v1, 224($sp)
	lw $v1, 260($sp)
	move $v1 $v1
	sw $v1, 240($sp)
	lw $v1, 260($sp)
	move $v1 $v1
	sw $v1, 236($sp)
	lw $v1, 260($sp)
	lw $v0, 12($v1)
	sw $v0, 200($sp)
	lw $v1, 200($sp)
	move $v1 $v1
	sw $v1, 232($sp)
	lw $v1, 260($sp)
	lw $v0, 4($v1)
	sw $v0, 196($sp)
	lw $v1, 196($sp)
	move $v1 $v1
	sw $v1, 228($sp)
L16:
	nop
	li $v1 1
	sw $v1, 188($sp)
	lw $v1, 232($sp)
	lw $v0, 188($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 184($sp)
	lw $v1, 184($sp)
	beqz $v1 L17
	li $v1 1
	sw $v1, 180($sp)
	lw $v1, 248($sp)
	lw $v0, 180($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 176($sp)
	lw $v1, 176($sp)
	move $v1 $v1
	sw $v1, 192($sp)
	b L18
L17:
	nop
	li $v1 0
	sw $v1, 192($sp)
L18:
	nop
	lw $v1, 192($sp)
	beqz $v1 L15
	lw $v1, 256($sp)
	lw $v0, 0($v1)
	sw $v0, 172($sp)
	lw $v1, 172($sp)
	lw $v0, 16($v1)
	sw $v0, 168($sp)
	lw $v1, 168($sp)
	lw $v0, 256($sp)
	move $a0 $v0
	lw $v0, 228($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 164($sp)
	lw $v1, 164($sp)
	beqz $v1 L19
	li $v1 1
	sw $v1, 160($sp)
	lw $v1, 160($sp)
	move $v1 $v1
	sw $v1, 248($sp)
	li $v1 0
	sw $v1, 156($sp)
	lw $v1, 156($sp)
	lw $v0, 224($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 152($sp)
	lw $v1, 152($sp)
	beqz $v1 L21
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 148($sp)
	lw $v1, 148($sp)
	lw $v0, 32($v1)
	sw $v0, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 140($sp)
	lw $v1, 140($sp)
	move $v1 $v1
	sw $v1, 252($sp)
	b L22
L21:
	nop
	li $v1 0
	sw $v1, 136($sp)
	li $v1 555
	sw $v1, 132($sp)
	lw $v1, 132($sp)
	lw $v0, 136($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	move $a0 $v1
	jal _print
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 32($v1)
	sw $v0, 120($sp)
	lw $v1, 120($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 116($sp)
	lw $v1, 236($sp)
	lw $v0, 0($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 12($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 236($sp)
	move $a0 $v0
	lw $v0, 116($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	move $v1 $v1
	sw $v1, 244($sp)
	li $v1 0
	sw $v1, 100($sp)
	li $v1 555
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	lw $v0, 100($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	move $a0 $v1
	jal _print
L22:
	nop
	b L20
L19:
	nop
	li $v1 0
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	move $v1 $v1
	sw $v1, 220($sp)
L20:
	nop
	li $v1 1
	sw $v1, 84($sp)
	lw $v1, 248($sp)
	lw $v0, 84($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	beqz $v1 L23
	lw $v1, 240($sp)
	move $v1 $v1
	sw $v1, 236($sp)
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 32($v1)
	sw $v0, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	move $v1 $v1
	sw $v1, 240($sp)
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 24($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 232($sp)
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 28($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 228($sp)
	li $v1 1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 224($sp)
	b L24
L23:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 220($sp)
L24:
	nop
	b L16
L15:
	nop
	lw $v1, 252($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 264($sp)
	addu $sp, $sp, 272
	j $ra
	
	.text
	.globl List_Search
List_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 148
	sw $ra, -4($fp)
	sw $a0, 136($sp)
	sw $a1, 132($sp)
	li $v1 0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	move $v1 $v1
	sw $v1, 128($sp)
	lw $v1, 136($sp)
	move $v1 $v1
	sw $v1, 124($sp)
	lw $v1, 136($sp)
	lw $v0, 12($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	move $v1 $v1
	sw $v1, 116($sp)
	lw $v1, 136($sp)
	lw $v0, 4($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	move $v1 $v1
	sw $v1, 120($sp)
L26:
	nop
	li $v1 1
	sw $v1, 96($sp)
	lw $v1, 116($sp)
	lw $v0, 96($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	beqz $v1 L25
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 16($v1)
	sw $v0, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	lw $v0, 120($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	beqz $v1 L27
	li $v1 1
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	move $v1 $v1
	sw $v1, 128($sp)
	b L28
L27:
	nop
	li $v1 0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 112($sp)
L28:
	nop
	lw $v1, 124($sp)
	lw $v0, 0($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 32($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 124($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	move $v1 $v1
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 0($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 24($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 124($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v1 $v1
	sw $v1, 116($sp)
	lw $v1, 124($sp)
	lw $v0, 0($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 28($v1)
	sw $v0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 124($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 120($sp)
	b L26
L25:
	nop
	lw $v1, 128($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 140($sp)
	addu $sp, $sp, 148
	j $ra
	
	.text
	.globl List_GetEnd
List_GetEnd:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 12($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl List_GetElem
List_GetElem:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 4($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl List_GetNext
List_GetNext:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 8($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 44($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl List_Print
List_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 128
	sw $ra, -4($fp)
	sw $a0, 116($sp)
	lw $v1, 116($sp)
	move $v1 $v1
	sw $v1, 112($sp)
	lw $v1, 116($sp)
	lw $v0, 12($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	lw $v1, 116($sp)
	lw $v0, 4($v1)
	sw $v0, 96($sp)
	lw $v1, 96($sp)
	move $v1 $v1
	sw $v1, 104($sp)
L30:
	nop
	li $v1 1
	sw $v1, 92($sp)
	lw $v1, 108($sp)
	lw $v0, 92($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	beqz $v1 L29
	lw $v1, 104($sp)
	lw $v0, 0($v1)
	sw $v0, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 4($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 104($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	move $a0 $v1
	jal _print
	lw $v1, 112($sp)
	lw $v0, 0($v1)
	sw $v0, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 32($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 112($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	move $v1 $v1
	sw $v1, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 0($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 24($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 112($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	lw $v1, 112($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 28($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 112($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 104($sp)
	b L30
L29:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 120($sp)
	addu $sp, $sp, 128
	j $ra
	
	.text
	.globl LL_Start
LL_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 632
	sw $ra, -4($fp)
	sw $a0, 620($sp)
	li $a0 40
	jal _halloc
	move $v1 $v0
	sw $v1, 592($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 588($sp)
	la $v1 List_Init
	sw $v1, 584($sp)
	lw $v1, 592($sp)
	lw $v0, 584($sp)
	sw $v0, 0($v1)
	la $v1 List_InitNew
	sw $v1, 580($sp)
	lw $v1, 592($sp)
	lw $v0, 580($sp)
	sw $v0, 4($v1)
	la $v1 List_Insert
	sw $v1, 576($sp)
	lw $v1, 592($sp)
	lw $v0, 576($sp)
	sw $v0, 8($v1)
	la $v1 List_SetNext
	sw $v1, 572($sp)
	lw $v1, 592($sp)
	lw $v0, 572($sp)
	sw $v0, 12($v1)
	la $v1 List_Delete
	sw $v1, 568($sp)
	lw $v1, 592($sp)
	lw $v0, 568($sp)
	sw $v0, 16($v1)
	la $v1 List_Search
	sw $v1, 564($sp)
	lw $v1, 592($sp)
	lw $v0, 564($sp)
	sw $v0, 20($v1)
	la $v1 List_GetEnd
	sw $v1, 560($sp)
	lw $v1, 592($sp)
	lw $v0, 560($sp)
	sw $v0, 24($v1)
	la $v1 List_GetElem
	sw $v1, 556($sp)
	lw $v1, 592($sp)
	lw $v0, 556($sp)
	sw $v0, 28($v1)
	la $v1 List_GetNext
	sw $v1, 552($sp)
	lw $v1, 592($sp)
	lw $v0, 552($sp)
	sw $v0, 32($v1)
	la $v1 List_Print
	sw $v1, 548($sp)
	lw $v1, 592($sp)
	lw $v0, 548($sp)
	sw $v0, 36($v1)
	lw $v1, 588($sp)
	lw $v0, 592($sp)
	sw $v0, 0($v1)
	lw $v1, 588($sp)
	move $v1 $v1
	sw $v1, 612($sp)
	lw $v1, 612($sp)
	lw $v0, 0($v1)
	sw $v0, 544($sp)
	lw $v1, 544($sp)
	lw $v0, 0($v1)
	sw $v0, 540($sp)
	lw $v1, 540($sp)
	lw $v0, 612($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 536($sp)
	lw $v1, 536($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 612($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 532($sp)
	lw $v1, 532($sp)
	lw $v0, 0($v1)
	sw $v0, 528($sp)
	lw $v1, 528($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 524($sp)
	lw $v1, 524($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 520($sp)
	lw $v1, 520($sp)
	lw $v0, 36($v1)
	sw $v0, 516($sp)
	lw $v1, 516($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 512($sp)
	lw $v1, 512($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $a0 24
	jal _halloc
	move $v1 $v0
	sw $v1, 508($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 504($sp)
	la $v1 Element_Init
	sw $v1, 500($sp)
	lw $v1, 508($sp)
	lw $v0, 500($sp)
	sw $v0, 0($v1)
	la $v1 Element_GetAge
	sw $v1, 496($sp)
	lw $v1, 508($sp)
	lw $v0, 496($sp)
	sw $v0, 4($v1)
	la $v1 Element_GetSalary
	sw $v1, 492($sp)
	lw $v1, 508($sp)
	lw $v0, 492($sp)
	sw $v0, 8($v1)
	la $v1 Element_GetMarried
	sw $v1, 488($sp)
	lw $v1, 508($sp)
	lw $v0, 488($sp)
	sw $v0, 12($v1)
	la $v1 Element_Equal
	sw $v1, 484($sp)
	lw $v1, 508($sp)
	lw $v0, 484($sp)
	sw $v0, 16($v1)
	la $v1 Element_Compare
	sw $v1, 480($sp)
	lw $v1, 508($sp)
	lw $v0, 480($sp)
	sw $v0, 20($v1)
	lw $v1, 504($sp)
	lw $v0, 508($sp)
	sw $v0, 0($v1)
	lw $v1, 504($sp)
	move $v1 $v1
	sw $v1, 604($sp)
	li $v1 25
	sw $v1, 476($sp)
	li $v1 37000
	sw $v1, 472($sp)
	li $v1 0
	sw $v1, 468($sp)
	lw $v1, 604($sp)
	lw $v0, 0($v1)
	sw $v0, 464($sp)
	lw $v1, 464($sp)
	lw $v0, 0($v1)
	sw $v0, 460($sp)
	lw $v1, 460($sp)
	lw $v0, 604($sp)
	move $a0 $v0
	lw $v0, 476($sp)
	move $a1 $v0
	lw $v0, 472($sp)
	move $a2 $v0
	lw $v0, 468($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 456($sp)
	lw $v1, 456($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 452($sp)
	lw $v1, 452($sp)
	lw $v0, 8($v1)
	sw $v0, 448($sp)
	lw $v1, 448($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 604($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 444($sp)
	lw $v1, 444($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 440($sp)
	lw $v1, 440($sp)
	lw $v0, 36($v1)
	sw $v0, 436($sp)
	lw $v1, 436($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 432($sp)
	lw $v1, 432($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $v1 10000000
	sw $v1, 428($sp)
	lw $v1, 428($sp)
	move $a0 $v1
	jal _print
	li $a0 24
	jal _halloc
	move $v1 $v0
	sw $v1, 424($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 420($sp)
	la $v1 Element_Init
	sw $v1, 416($sp)
	lw $v1, 424($sp)
	lw $v0, 416($sp)
	sw $v0, 0($v1)
	la $v1 Element_GetAge
	sw $v1, 412($sp)
	lw $v1, 424($sp)
	lw $v0, 412($sp)
	sw $v0, 4($v1)
	la $v1 Element_GetSalary
	sw $v1, 408($sp)
	lw $v1, 424($sp)
	lw $v0, 408($sp)
	sw $v0, 8($v1)
	la $v1 Element_GetMarried
	sw $v1, 404($sp)
	lw $v1, 424($sp)
	lw $v0, 404($sp)
	sw $v0, 12($v1)
	la $v1 Element_Equal
	sw $v1, 400($sp)
	lw $v1, 424($sp)
	lw $v0, 400($sp)
	sw $v0, 16($v1)
	la $v1 Element_Compare
	sw $v1, 396($sp)
	lw $v1, 424($sp)
	lw $v0, 396($sp)
	sw $v0, 20($v1)
	lw $v1, 420($sp)
	lw $v0, 424($sp)
	sw $v0, 0($v1)
	lw $v1, 420($sp)
	move $v1 $v1
	sw $v1, 604($sp)
	li $v1 39
	sw $v1, 392($sp)
	li $v1 42000
	sw $v1, 388($sp)
	li $v1 1
	sw $v1, 384($sp)
	lw $v1, 604($sp)
	lw $v0, 0($v1)
	sw $v0, 380($sp)
	lw $v1, 380($sp)
	lw $v0, 0($v1)
	sw $v0, 376($sp)
	lw $v1, 376($sp)
	lw $v0, 604($sp)
	move $a0 $v0
	lw $v0, 392($sp)
	move $a1 $v0
	lw $v0, 388($sp)
	move $a2 $v0
	lw $v0, 384($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 372($sp)
	lw $v1, 372($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 604($sp)
	move $v1 $v1
	sw $v1, 600($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 368($sp)
	lw $v1, 368($sp)
	lw $v0, 8($v1)
	sw $v0, 364($sp)
	lw $v1, 364($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 604($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 360($sp)
	lw $v1, 360($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 356($sp)
	lw $v1, 356($sp)
	lw $v0, 36($v1)
	sw $v0, 352($sp)
	lw $v1, 352($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 348($sp)
	lw $v1, 348($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $v1 10000000
	sw $v1, 344($sp)
	lw $v1, 344($sp)
	move $a0 $v1
	jal _print
	li $a0 24
	jal _halloc
	move $v1 $v0
	sw $v1, 340($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 336($sp)
	la $v1 Element_Init
	sw $v1, 332($sp)
	lw $v1, 340($sp)
	lw $v0, 332($sp)
	sw $v0, 0($v1)
	la $v1 Element_GetAge
	sw $v1, 328($sp)
	lw $v1, 340($sp)
	lw $v0, 328($sp)
	sw $v0, 4($v1)
	la $v1 Element_GetSalary
	sw $v1, 324($sp)
	lw $v1, 340($sp)
	lw $v0, 324($sp)
	sw $v0, 8($v1)
	la $v1 Element_GetMarried
	sw $v1, 320($sp)
	lw $v1, 340($sp)
	lw $v0, 320($sp)
	sw $v0, 12($v1)
	la $v1 Element_Equal
	sw $v1, 316($sp)
	lw $v1, 340($sp)
	lw $v0, 316($sp)
	sw $v0, 16($v1)
	la $v1 Element_Compare
	sw $v1, 312($sp)
	lw $v1, 340($sp)
	lw $v0, 312($sp)
	sw $v0, 20($v1)
	lw $v1, 336($sp)
	lw $v0, 340($sp)
	sw $v0, 0($v1)
	lw $v1, 336($sp)
	move $v1 $v1
	sw $v1, 604($sp)
	li $v1 22
	sw $v1, 308($sp)
	li $v1 34000
	sw $v1, 304($sp)
	li $v1 0
	sw $v1, 300($sp)
	lw $v1, 604($sp)
	lw $v0, 0($v1)
	sw $v0, 296($sp)
	lw $v1, 296($sp)
	lw $v0, 0($v1)
	sw $v0, 292($sp)
	lw $v1, 292($sp)
	lw $v0, 604($sp)
	move $a0 $v0
	lw $v0, 308($sp)
	move $a1 $v0
	lw $v0, 304($sp)
	move $a2 $v0
	lw $v0, 300($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 288($sp)
	lw $v1, 288($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 284($sp)
	lw $v1, 284($sp)
	lw $v0, 8($v1)
	sw $v0, 280($sp)
	lw $v1, 280($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 604($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 276($sp)
	lw $v1, 276($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 272($sp)
	lw $v1, 272($sp)
	lw $v0, 36($v1)
	sw $v0, 268($sp)
	lw $v1, 268($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 264($sp)
	lw $v1, 264($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $a0 24
	jal _halloc
	move $v1 $v0
	sw $v1, 260($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 256($sp)
	la $v1 Element_Init
	sw $v1, 252($sp)
	lw $v1, 260($sp)
	lw $v0, 252($sp)
	sw $v0, 0($v1)
	la $v1 Element_GetAge
	sw $v1, 248($sp)
	lw $v1, 260($sp)
	lw $v0, 248($sp)
	sw $v0, 4($v1)
	la $v1 Element_GetSalary
	sw $v1, 244($sp)
	lw $v1, 260($sp)
	lw $v0, 244($sp)
	sw $v0, 8($v1)
	la $v1 Element_GetMarried
	sw $v1, 240($sp)
	lw $v1, 260($sp)
	lw $v0, 240($sp)
	sw $v0, 12($v1)
	la $v1 Element_Equal
	sw $v1, 236($sp)
	lw $v1, 260($sp)
	lw $v0, 236($sp)
	sw $v0, 16($v1)
	la $v1 Element_Compare
	sw $v1, 232($sp)
	lw $v1, 260($sp)
	lw $v0, 232($sp)
	sw $v0, 20($v1)
	lw $v1, 256($sp)
	lw $v0, 260($sp)
	sw $v0, 0($v1)
	lw $v1, 256($sp)
	move $v1 $v1
	sw $v1, 596($sp)
	li $v1 27
	sw $v1, 228($sp)
	li $v1 34000
	sw $v1, 224($sp)
	li $v1 0
	sw $v1, 220($sp)
	lw $v1, 596($sp)
	lw $v0, 0($v1)
	sw $v0, 216($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 212($sp)
	lw $v1, 212($sp)
	lw $v0, 596($sp)
	move $a0 $v0
	lw $v0, 228($sp)
	move $a1 $v0
	lw $v0, 224($sp)
	move $a2 $v0
	lw $v0, 220($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 208($sp)
	lw $v1, 208($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 204($sp)
	lw $v1, 204($sp)
	lw $v0, 20($v1)
	sw $v0, 200($sp)
	lw $v1, 200($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 600($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 196($sp)
	lw $v1, 196($sp)
	move $a0 $v1
	jal _print
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 192($sp)
	lw $v1, 192($sp)
	lw $v0, 20($v1)
	sw $v0, 188($sp)
	lw $v1, 188($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 596($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 184($sp)
	lw $v1, 184($sp)
	move $a0 $v1
	jal _print
	li $v1 10000000
	sw $v1, 180($sp)
	lw $v1, 180($sp)
	move $a0 $v1
	jal _print
	li $a0 24
	jal _halloc
	move $v1 $v0
	sw $v1, 176($sp)
	li $a0 16
	jal _halloc
	move $v1 $v0
	sw $v1, 172($sp)
	la $v1 Element_Init
	sw $v1, 168($sp)
	lw $v1, 176($sp)
	lw $v0, 168($sp)
	sw $v0, 0($v1)
	la $v1 Element_GetAge
	sw $v1, 164($sp)
	lw $v1, 176($sp)
	lw $v0, 164($sp)
	sw $v0, 4($v1)
	la $v1 Element_GetSalary
	sw $v1, 160($sp)
	lw $v1, 176($sp)
	lw $v0, 160($sp)
	sw $v0, 8($v1)
	la $v1 Element_GetMarried
	sw $v1, 156($sp)
	lw $v1, 176($sp)
	lw $v0, 156($sp)
	sw $v0, 12($v1)
	la $v1 Element_Equal
	sw $v1, 152($sp)
	lw $v1, 176($sp)
	lw $v0, 152($sp)
	sw $v0, 16($v1)
	la $v1 Element_Compare
	sw $v1, 148($sp)
	lw $v1, 176($sp)
	lw $v0, 148($sp)
	sw $v0, 20($v1)
	lw $v1, 172($sp)
	lw $v0, 176($sp)
	sw $v0, 0($v1)
	lw $v1, 172($sp)
	move $v1 $v1
	sw $v1, 604($sp)
	li $v1 28
	sw $v1, 144($sp)
	li $v1 35000
	sw $v1, 140($sp)
	li $v1 0
	sw $v1, 136($sp)
	lw $v1, 604($sp)
	lw $v0, 0($v1)
	sw $v0, 132($sp)
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 604($sp)
	move $a0 $v0
	lw $v0, 144($sp)
	move $a1 $v0
	lw $v0, 140($sp)
	move $a2 $v0
	lw $v0, 136($sp)
	move $a3 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 120($sp)
	lw $v1, 120($sp)
	lw $v0, 8($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 604($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 112($sp)
	lw $v1, 112($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 36($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 100($sp)
	lw $v1, 100($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $v1 2220000
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	move $a0 $v1
	jal _print
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 16($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 600($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 36($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $v1 33300000
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	move $a0 $v1
	jal _print
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 16($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	lw $v0, 604($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 616($sp)
	lw $v1, 616($sp)
	lw $v0, 0($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 36($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 616($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 608($sp)
	li $v1 44440000
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $a0 $v1
	jal _print
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 624($sp)
	addu $sp, $sp, 632
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

