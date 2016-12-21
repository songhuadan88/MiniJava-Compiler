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
	la $v1 BT_Start
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
	.globl BT_Start
BT_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 444
	sw $ra, -4($fp)
	sw $a0, 432($sp)
	li $a0 80
	jal _halloc
	move $v1 $v0
	sw $v1, 416($sp)
	li $a0 28
	jal _halloc
	move $v1 $v0
	sw $v1, 412($sp)
	la $v1 Tree_Init
	sw $v1, 408($sp)
	lw $v1, 416($sp)
	lw $v0, 408($sp)
	sw $v0, 0($v1)
	la $v1 Tree_SetRight
	sw $v1, 404($sp)
	lw $v1, 416($sp)
	lw $v0, 404($sp)
	sw $v0, 4($v1)
	la $v1 Tree_SetLeft
	sw $v1, 400($sp)
	lw $v1, 416($sp)
	lw $v0, 400($sp)
	sw $v0, 8($v1)
	la $v1 Tree_GetRight
	sw $v1, 396($sp)
	lw $v1, 416($sp)
	lw $v0, 396($sp)
	sw $v0, 12($v1)
	la $v1 Tree_GetLeft
	sw $v1, 392($sp)
	lw $v1, 416($sp)
	lw $v0, 392($sp)
	sw $v0, 16($v1)
	la $v1 Tree_GetKey
	sw $v1, 388($sp)
	lw $v1, 416($sp)
	lw $v0, 388($sp)
	sw $v0, 20($v1)
	la $v1 Tree_SetKey
	sw $v1, 384($sp)
	lw $v1, 416($sp)
	lw $v0, 384($sp)
	sw $v0, 24($v1)
	la $v1 Tree_GetHas_Right
	sw $v1, 380($sp)
	lw $v1, 416($sp)
	lw $v0, 380($sp)
	sw $v0, 28($v1)
	la $v1 Tree_GetHas_Left
	sw $v1, 376($sp)
	lw $v1, 416($sp)
	lw $v0, 376($sp)
	sw $v0, 32($v1)
	la $v1 Tree_SetHas_Left
	sw $v1, 372($sp)
	lw $v1, 416($sp)
	lw $v0, 372($sp)
	sw $v0, 36($v1)
	la $v1 Tree_SetHas_Right
	sw $v1, 368($sp)
	lw $v1, 416($sp)
	lw $v0, 368($sp)
	sw $v0, 40($v1)
	la $v1 Tree_Compare
	sw $v1, 364($sp)
	lw $v1, 416($sp)
	lw $v0, 364($sp)
	sw $v0, 44($v1)
	la $v1 Tree_Insert
	sw $v1, 360($sp)
	lw $v1, 416($sp)
	lw $v0, 360($sp)
	sw $v0, 48($v1)
	la $v1 Tree_Delete
	sw $v1, 356($sp)
	lw $v1, 416($sp)
	lw $v0, 356($sp)
	sw $v0, 52($v1)
	la $v1 Tree_Remove
	sw $v1, 352($sp)
	lw $v1, 416($sp)
	lw $v0, 352($sp)
	sw $v0, 56($v1)
	la $v1 Tree_RemoveRight
	sw $v1, 348($sp)
	lw $v1, 416($sp)
	lw $v0, 348($sp)
	sw $v0, 60($v1)
	la $v1 Tree_RemoveLeft
	sw $v1, 344($sp)
	lw $v1, 416($sp)
	lw $v0, 344($sp)
	sw $v0, 64($v1)
	la $v1 Tree_Search
	sw $v1, 340($sp)
	lw $v1, 416($sp)
	lw $v0, 340($sp)
	sw $v0, 68($v1)
	la $v1 Tree_Print
	sw $v1, 336($sp)
	lw $v1, 416($sp)
	lw $v0, 336($sp)
	sw $v0, 72($v1)
	la $v1 Tree_RecPrint
	sw $v1, 332($sp)
	lw $v1, 416($sp)
	lw $v0, 332($sp)
	sw $v0, 76($v1)
	lw $v1, 412($sp)
	lw $v0, 416($sp)
	sw $v0, 0($v1)
	lw $v1, 412($sp)
	move $v1 $v1
	sw $v1, 428($sp)
	li $v1 16
	sw $v1, 328($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 324($sp)
	lw $v1, 324($sp)
	lw $v0, 0($v1)
	sw $v0, 320($sp)
	lw $v1, 320($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 328($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 316($sp)
	lw $v1, 316($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 312($sp)
	lw $v1, 312($sp)
	lw $v0, 72($v1)
	sw $v0, 308($sp)
	lw $v1, 308($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 304($sp)
	lw $v1, 304($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 100000000
	sw $v1, 300($sp)
	lw $v1, 300($sp)
	move $a0 $v1
	jal _print
	li $v1 8
	sw $v1, 296($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 292($sp)
	lw $v1, 292($sp)
	lw $v0, 48($v1)
	sw $v0, 288($sp)
	lw $v1, 288($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 296($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 284($sp)
	lw $v1, 284($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 280($sp)
	lw $v1, 280($sp)
	lw $v0, 72($v1)
	sw $v0, 276($sp)
	lw $v1, 276($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 272($sp)
	lw $v1, 272($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 24
	sw $v1, 268($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 264($sp)
	lw $v1, 264($sp)
	lw $v0, 48($v1)
	sw $v0, 260($sp)
	lw $v1, 260($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 268($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 256($sp)
	lw $v1, 256($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 4
	sw $v1, 252($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 248($sp)
	lw $v1, 248($sp)
	lw $v0, 48($v1)
	sw $v0, 244($sp)
	lw $v1, 244($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 252($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 240($sp)
	lw $v1, 240($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 12
	sw $v1, 236($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 232($sp)
	lw $v1, 232($sp)
	lw $v0, 48($v1)
	sw $v0, 228($sp)
	lw $v1, 228($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 236($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 224($sp)
	lw $v1, 224($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 20
	sw $v1, 220($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 216($sp)
	lw $v1, 216($sp)
	lw $v0, 48($v1)
	sw $v0, 212($sp)
	lw $v1, 212($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 220($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 208($sp)
	lw $v1, 208($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 28
	sw $v1, 204($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 200($sp)
	lw $v1, 200($sp)
	lw $v0, 48($v1)
	sw $v0, 196($sp)
	lw $v1, 196($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 204($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 192($sp)
	lw $v1, 192($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 14
	sw $v1, 188($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 184($sp)
	lw $v1, 184($sp)
	lw $v0, 48($v1)
	sw $v0, 180($sp)
	lw $v1, 180($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 188($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 176($sp)
	lw $v1, 176($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 172($sp)
	lw $v1, 172($sp)
	lw $v0, 72($v1)
	sw $v0, 168($sp)
	lw $v1, 168($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 164($sp)
	lw $v1, 164($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 24
	sw $v1, 160($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 156($sp)
	lw $v1, 156($sp)
	lw $v0, 68($v1)
	sw $v0, 152($sp)
	lw $v1, 152($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 160($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 148($sp)
	lw $v1, 148($sp)
	move $a0 $v1
	jal _print
	li $v1 12
	sw $v1, 144($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 140($sp)
	lw $v1, 140($sp)
	lw $v0, 68($v1)
	sw $v0, 136($sp)
	lw $v1, 136($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 144($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 132($sp)
	lw $v1, 132($sp)
	move $a0 $v1
	jal _print
	li $v1 16
	sw $v1, 128($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 68($v1)
	sw $v0, 120($sp)
	lw $v1, 120($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 128($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	move $a0 $v1
	jal _print
	li $v1 50
	sw $v1, 112($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 68($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 112($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 100($sp)
	lw $v1, 100($sp)
	move $a0 $v1
	jal _print
	li $v1 12
	sw $v1, 96($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 68($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 96($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	move $a0 $v1
	jal _print
	li $v1 12
	sw $v1, 80($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 52($v1)
	sw $v0, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 80($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 72($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 424($sp)
	li $v1 12
	sw $v1, 52($sp)
	lw $v1, 428($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 68($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 428($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $a0 $v1
	jal _print
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 444
	j $ra
	
	.text
	.globl Tree_Init
Tree_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 64
	sw $ra, -4($fp)
	sw $a0, 52($sp)
	sw $a1, 48($sp)
	lw $v1, 52($sp)
	lw $v0, 48($sp)
	sw $v0, 12($v1)
	li $v1 0
	sw $v1, 44($sp)
	lw $v1, 52($sp)
	lw $v0, 44($sp)
	sw $v0, 16($v1)
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 52($sp)
	lw $v0, 40($sp)
	sw $v0, 20($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 64
	j $ra
	
	.text
	.globl Tree_SetRight
Tree_SetRight:
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
	lw $fp, 12($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl Tree_SetLeft
Tree_SetLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	sw $a1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl Tree_GetRight
Tree_GetRight:
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
	lw $fp, 12($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Tree_GetLeft
Tree_GetLeft:
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
	lw $fp, 12($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Tree_GetKey
Tree_GetKey:
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
	lw $fp, 12($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Tree_SetKey
Tree_SetKey:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	sw $a1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 12($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl Tree_GetHas_Right
Tree_GetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 20($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Tree_GetHas_Left
Tree_GetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 52
	sw $ra, -4($fp)
	sw $a0, 40($sp)
	lw $v1, 40($sp)
	lw $v0, 16($v1)
	sw $v0, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 52
	j $ra
	
	.text
	.globl Tree_SetHas_Left
Tree_SetHas_Left:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	sw $a1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 16($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl Tree_SetHas_Right
Tree_SetHas_Right:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 56
	sw $ra, -4($fp)
	sw $a0, 44($sp)
	sw $a1, 40($sp)
	lw $v1, 44($sp)
	lw $v0, 40($sp)
	sw $v0, 20($v1)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 56
	j $ra
	
	.text
	.globl Tree_Compare
Tree_Compare:
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
	beqz $v1 L1
	li $v1 0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 80($sp)
	b L2
L1:
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
	beqz $v1 L3
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 80($sp)
	b L4
L3:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 80($sp)
L4:
	nop
L2:
	nop
	lw $v1, 80($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 104
	j $ra
	
	.text
	.globl Tree_Insert
Tree_Insert:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 308
	sw $ra, -4($fp)
	sw $a0, 296($sp)
	sw $a1, 292($sp)
	li $a0 80
	jal _halloc
	move $v1 $v0
	sw $v1, 268($sp)
	li $a0 28
	jal _halloc
	move $v1 $v0
	sw $v1, 264($sp)
	la $v1 Tree_Init
	sw $v1, 260($sp)
	lw $v1, 268($sp)
	lw $v0, 260($sp)
	sw $v0, 0($v1)
	la $v1 Tree_SetRight
	sw $v1, 256($sp)
	lw $v1, 268($sp)
	lw $v0, 256($sp)
	sw $v0, 4($v1)
	la $v1 Tree_SetLeft
	sw $v1, 252($sp)
	lw $v1, 268($sp)
	lw $v0, 252($sp)
	sw $v0, 8($v1)
	la $v1 Tree_GetRight
	sw $v1, 248($sp)
	lw $v1, 268($sp)
	lw $v0, 248($sp)
	sw $v0, 12($v1)
	la $v1 Tree_GetLeft
	sw $v1, 244($sp)
	lw $v1, 268($sp)
	lw $v0, 244($sp)
	sw $v0, 16($v1)
	la $v1 Tree_GetKey
	sw $v1, 240($sp)
	lw $v1, 268($sp)
	lw $v0, 240($sp)
	sw $v0, 20($v1)
	la $v1 Tree_SetKey
	sw $v1, 236($sp)
	lw $v1, 268($sp)
	lw $v0, 236($sp)
	sw $v0, 24($v1)
	la $v1 Tree_GetHas_Right
	sw $v1, 232($sp)
	lw $v1, 268($sp)
	lw $v0, 232($sp)
	sw $v0, 28($v1)
	la $v1 Tree_GetHas_Left
	sw $v1, 228($sp)
	lw $v1, 268($sp)
	lw $v0, 228($sp)
	sw $v0, 32($v1)
	la $v1 Tree_SetHas_Left
	sw $v1, 224($sp)
	lw $v1, 268($sp)
	lw $v0, 224($sp)
	sw $v0, 36($v1)
	la $v1 Tree_SetHas_Right
	sw $v1, 220($sp)
	lw $v1, 268($sp)
	lw $v0, 220($sp)
	sw $v0, 40($v1)
	la $v1 Tree_Compare
	sw $v1, 216($sp)
	lw $v1, 268($sp)
	lw $v0, 216($sp)
	sw $v0, 44($v1)
	la $v1 Tree_Insert
	sw $v1, 212($sp)
	lw $v1, 268($sp)
	lw $v0, 212($sp)
	sw $v0, 48($v1)
	la $v1 Tree_Delete
	sw $v1, 208($sp)
	lw $v1, 268($sp)
	lw $v0, 208($sp)
	sw $v0, 52($v1)
	la $v1 Tree_Remove
	sw $v1, 204($sp)
	lw $v1, 268($sp)
	lw $v0, 204($sp)
	sw $v0, 56($v1)
	la $v1 Tree_RemoveRight
	sw $v1, 200($sp)
	lw $v1, 268($sp)
	lw $v0, 200($sp)
	sw $v0, 60($v1)
	la $v1 Tree_RemoveLeft
	sw $v1, 196($sp)
	lw $v1, 268($sp)
	lw $v0, 196($sp)
	sw $v0, 64($v1)
	la $v1 Tree_Search
	sw $v1, 192($sp)
	lw $v1, 268($sp)
	lw $v0, 192($sp)
	sw $v0, 68($v1)
	la $v1 Tree_Print
	sw $v1, 188($sp)
	lw $v1, 268($sp)
	lw $v0, 188($sp)
	sw $v0, 72($v1)
	la $v1 Tree_RecPrint
	sw $v1, 184($sp)
	lw $v1, 268($sp)
	lw $v0, 184($sp)
	sw $v0, 76($v1)
	lw $v1, 264($sp)
	lw $v0, 268($sp)
	sw $v0, 0($v1)
	lw $v1, 264($sp)
	move $v1 $v1
	sw $v1, 288($sp)
	lw $v1, 288($sp)
	lw $v0, 0($v1)
	sw $v0, 180($sp)
	lw $v1, 180($sp)
	lw $v0, 0($v1)
	sw $v0, 176($sp)
	lw $v1, 176($sp)
	lw $v0, 288($sp)
	move $a0 $v0
	lw $v0, 292($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 172($sp)
	lw $v1, 172($sp)
	move $v1 $v1
	sw $v1, 284($sp)
	lw $v1, 296($sp)
	move $v1 $v1
	sw $v1, 272($sp)
	li $v1 1
	sw $v1, 168($sp)
	lw $v1, 168($sp)
	move $v1 $v1
	sw $v1, 280($sp)
L6:
	nop
	lw $v1, 280($sp)
	beqz $v1 L5
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 164($sp)
	lw $v1, 164($sp)
	lw $v0, 20($v1)
	sw $v0, 160($sp)
	lw $v1, 160($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 156($sp)
	lw $v1, 156($sp)
	move $v1 $v1
	sw $v1, 276($sp)
	lw $v1, 276($sp)
	lw $v0, 292($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 152($sp)
	lw $v1, 152($sp)
	beqz $v1 L7
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 148($sp)
	lw $v1, 148($sp)
	lw $v0, 32($v1)
	sw $v0, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 140($sp)
	lw $v1, 140($sp)
	beqz $v1 L9
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 136($sp)
	lw $v1, 136($sp)
	lw $v0, 16($v1)
	sw $v0, 132($sp)
	lw $v1, 132($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	move $v1 $v1
	sw $v1, 272($sp)
	b L10
L9:
	nop
	li $v1 0
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	move $v1 $v1
	sw $v1, 280($sp)
	li $v1 1
	sw $v1, 120($sp)
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 36($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	lw $v0, 120($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	move $v1 $v1
	sw $v1, 284($sp)
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 8($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	lw $v0, 288($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	move $v1 $v1
	sw $v1, 284($sp)
L10:
	nop
	b L8
L7:
	nop
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 28($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	beqz $v1 L11
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 12($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 272($sp)
	b L12
L11:
	nop
	li $v1 0
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	move $v1 $v1
	sw $v1, 280($sp)
	li $v1 1
	sw $v1, 64($sp)
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 40($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	lw $v0, 64($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	move $v1 $v1
	sw $v1, 284($sp)
	lw $v1, 272($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 4($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 272($sp)
	move $a0 $v0
	lw $v0, 288($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 284($sp)
L12:
	nop
L8:
	nop
	b L6
L5:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 308
	j $ra
	
	.text
	.globl Tree_Delete
Tree_Delete:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 252
	sw $ra, -4($fp)
	sw $a0, 240($sp)
	sw $a1, 236($sp)
	lw $v1, 240($sp)
	move $v1 $v1
	sw $v1, 232($sp)
	lw $v1, 240($sp)
	move $v1 $v1
	sw $v1, 228($sp)
	li $v1 1
	sw $v1, 204($sp)
	lw $v1, 204($sp)
	move $v1 $v1
	sw $v1, 224($sp)
	li $v1 0
	sw $v1, 200($sp)
	lw $v1, 200($sp)
	move $v1 $v1
	sw $v1, 220($sp)
	li $v1 1
	sw $v1, 196($sp)
	lw $v1, 196($sp)
	move $v1 $v1
	sw $v1, 216($sp)
L14:
	nop
	lw $v1, 224($sp)
	beqz $v1 L13
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 192($sp)
	lw $v1, 192($sp)
	lw $v0, 20($v1)
	sw $v0, 188($sp)
	lw $v1, 188($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 184($sp)
	lw $v1, 184($sp)
	move $v1 $v1
	sw $v1, 212($sp)
	lw $v1, 212($sp)
	lw $v0, 236($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 180($sp)
	lw $v1, 180($sp)
	beqz $v1 L15
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 176($sp)
	lw $v1, 176($sp)
	lw $v0, 32($v1)
	sw $v0, 172($sp)
	lw $v1, 172($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 168($sp)
	lw $v1, 168($sp)
	beqz $v1 L17
	lw $v1, 232($sp)
	move $v1 $v1
	sw $v1, 228($sp)
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 164($sp)
	lw $v1, 164($sp)
	lw $v0, 16($v1)
	sw $v0, 160($sp)
	lw $v1, 160($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 156($sp)
	lw $v1, 156($sp)
	move $v1 $v1
	sw $v1, 232($sp)
	b L18
L17:
	nop
	li $v1 0
	sw $v1, 152($sp)
	lw $v1, 152($sp)
	move $v1 $v1
	sw $v1, 224($sp)
L18:
	nop
	b L16
L15:
	nop
	lw $v1, 236($sp)
	lw $v0, 212($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 148($sp)
	lw $v1, 148($sp)
	beqz $v1 L19
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 28($v1)
	sw $v0, 140($sp)
	lw $v1, 140($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 136($sp)
	lw $v1, 136($sp)
	beqz $v1 L21
	lw $v1, 232($sp)
	move $v1 $v1
	sw $v1, 228($sp)
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 132($sp)
	lw $v1, 132($sp)
	lw $v0, 12($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	move $v1 $v1
	sw $v1, 232($sp)
	b L22
L21:
	nop
	li $v1 0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	move $v1 $v1
	sw $v1, 224($sp)
L22:
	nop
	b L20
L19:
	nop
	lw $v1, 216($sp)
	beqz $v1 L23
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 28($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 104($sp)
	li $v1 1
	sw $v1, 100($sp)
	lw $v1, 104($sp)
	lw $v0, 100($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	beqz $v1 L27
	lw $v1, 232($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 32($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 232($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	li $v1 1
	sw $v1, 80($sp)
	lw $v1, 84($sp)
	lw $v0, 80($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	move $v1 $v1
	sw $v1, 116($sp)
	b L28
L27:
	nop
	li $v1 0
	sw $v1, 116($sp)
L28:
	nop
	lw $v1, 116($sp)
	beqz $v1 L25
	li $v1 1
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	b L26
L25:
	nop
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 56($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	lw $v0, 228($sp)
	move $a1 $v0
	lw $v0, 232($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	move $v1 $v1
	sw $v1, 208($sp)
L26:
	nop
	b L24
L23:
	nop
	lw $v1, 240($sp)
	lw $v0, 0($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 56($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 240($sp)
	move $a0 $v0
	lw $v0, 228($sp)
	move $a1 $v0
	lw $v0, 232($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v1 $v1
	sw $v1, 208($sp)
L24:
	nop
	li $v1 1
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 220($sp)
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 224($sp)
L20:
	nop
L16:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 216($sp)
	b L14
L13:
	nop
	lw $v1, 220($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 252
	j $ra
	
	.text
	.globl Tree_Remove
Tree_Remove:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 232
	sw $ra, -4($fp)
	sw $a0, 220($sp)
	sw $a1, 216($sp)
	sw $a2, 212($sp)
	lw $v1, 212($sp)
	lw $v0, 0($v1)
	sw $v0, 196($sp)
	lw $v1, 196($sp)
	lw $v0, 32($v1)
	sw $v0, 192($sp)
	lw $v1, 192($sp)
	lw $v0, 212($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 188($sp)
	lw $v1, 188($sp)
	beqz $v1 L29
	lw $v1, 220($sp)
	lw $v0, 0($v1)
	sw $v0, 184($sp)
	lw $v1, 184($sp)
	lw $v0, 64($v1)
	sw $v0, 180($sp)
	lw $v1, 180($sp)
	lw $v0, 220($sp)
	move $a0 $v0
	lw $v0, 216($sp)
	move $a1 $v0
	lw $v0, 212($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 176($sp)
	lw $v1, 176($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	b L30
L29:
	nop
	lw $v1, 212($sp)
	lw $v0, 0($v1)
	sw $v0, 172($sp)
	lw $v1, 172($sp)
	lw $v0, 28($v1)
	sw $v0, 168($sp)
	lw $v1, 168($sp)
	lw $v0, 212($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 164($sp)
	lw $v1, 164($sp)
	beqz $v1 L31
	lw $v1, 220($sp)
	lw $v0, 0($v1)
	sw $v0, 160($sp)
	lw $v1, 160($sp)
	lw $v0, 60($v1)
	sw $v0, 156($sp)
	lw $v1, 156($sp)
	lw $v0, 220($sp)
	move $a0 $v0
	lw $v0, 216($sp)
	move $a1 $v0
	lw $v0, 212($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 152($sp)
	lw $v1, 152($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	b L32
L31:
	nop
	lw $v1, 212($sp)
	lw $v0, 0($v1)
	sw $v0, 148($sp)
	lw $v1, 148($sp)
	lw $v0, 20($v1)
	sw $v0, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 212($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 140($sp)
	lw $v1, 140($sp)
	move $v1 $v1
	sw $v1, 204($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 136($sp)
	lw $v1, 136($sp)
	lw $v0, 16($v1)
	sw $v0, 132($sp)
	lw $v1, 132($sp)
	lw $v0, 216($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 0($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 20($v1)
	sw $v0, 120($sp)
	lw $v1, 120($sp)
	lw $v0, 128($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	move $v1 $v1
	sw $v1, 200($sp)
	lw $v1, 220($sp)
	lw $v0, 0($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 44($v1)
	sw $v0, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 220($sp)
	move $a0 $v0
	lw $v0, 204($sp)
	move $a1 $v0
	lw $v0, 200($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	beqz $v1 L33
	lw $v1, 220($sp)
	lw $v0, 24($v1)
	sw $v0, 100($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 96($sp)
	lw $v1, 96($sp)
	lw $v0, 8($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 216($sp)
	move $a0 $v0
	lw $v0, 100($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	li $v1 0
	sw $v1, 84($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 36($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 216($sp)
	move $a0 $v0
	lw $v0, 84($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	b L34
L33:
	nop
	lw $v1, 220($sp)
	lw $v0, 24($v1)
	sw $v0, 68($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 4($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 216($sp)
	move $a0 $v0
	lw $v0, 68($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 208($sp)
	li $v1 0
	sw $v1, 52($sp)
	lw $v1, 216($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 40($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 216($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 208($sp)
L34:
	nop
L32:
	nop
L30:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 232
	j $ra
	
	.text
	.globl Tree_RemoveRight
Tree_RemoveRight:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 156
	sw $ra, -4($fp)
	sw $a0, 144($sp)
	sw $a1, 140($sp)
	sw $a2, 136($sp)
L36:
	nop
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 28($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	beqz $v1 L35
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 12($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 0($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 20($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 108($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 96($sp)
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 24($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	lw $v0, 96($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	lw $v1, 136($sp)
	move $v1 $v1
	sw $v1, 140($sp)
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 12($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	b L36
L35:
	nop
	lw $v1, 144($sp)
	lw $v0, 24($v1)
	sw $v0, 68($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 4($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 68($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 0
	sw $v1, 52($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 40($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 156
	j $ra
	
	.text
	.globl Tree_RemoveLeft
Tree_RemoveLeft:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 156
	sw $ra, -4($fp)
	sw $a0, 144($sp)
	sw $a1, 140($sp)
	sw $a2, 136($sp)
L38:
	nop
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 32($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	beqz $v1 L37
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 16($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	lw $v0, 0($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 20($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 108($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 96($sp)
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 24($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	lw $v0, 96($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	lw $v1, 136($sp)
	move $v1 $v1
	sw $v1, 140($sp)
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 16($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	b L38
L37:
	nop
	lw $v1, 144($sp)
	lw $v0, 24($v1)
	sw $v0, 68($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 8($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 68($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 56($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 0
	sw $v1, 52($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 36($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 52($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 156
	j $ra
	
	.text
	.globl Tree_Search
Tree_Search:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 160
	sw $ra, -4($fp)
	sw $a0, 148($sp)
	sw $a1, 144($sp)
	lw $v1, 148($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	li $v1 1
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	move $v1 $v1
	sw $v1, 140($sp)
	li $v1 0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	move $v1 $v1
	sw $v1, 136($sp)
L40:
	nop
	lw $v1, 140($sp)
	beqz $v1 L39
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 20($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 108($sp)
	move $v1 $v1
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 144($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	beqz $v1 L41
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 32($v1)
	sw $v0, 96($sp)
	lw $v1, 96($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	beqz $v1 L43
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 16($v1)
	sw $v0, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	b L44
L43:
	nop
	li $v1 0
	sw $v1, 76($sp)
	lw $v1, 76($sp)
	move $v1 $v1
	sw $v1, 140($sp)
L44:
	nop
	b L42
L41:
	nop
	lw $v1, 144($sp)
	lw $v0, 128($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	beqz $v1 L45
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 28($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	beqz $v1 L47
	lw $v1, 132($sp)
	lw $v0, 0($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 12($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 132($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 48($sp)
	lw $v1, 48($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	b L48
L47:
	nop
	li $v1 0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 140($sp)
L48:
	nop
	b L46
L45:
	nop
	li $v1 1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 136($sp)
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v1 $v1
	sw $v1, 140($sp)
L46:
	nop
L42:
	nop
	b L40
L39:
	nop
	lw $v1, 136($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 160
	j $ra
	
	.text
	.globl Tree_Print
Tree_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 72
	sw $ra, -4($fp)
	sw $a0, 60($sp)
	lw $v1, 60($sp)
	move $v1 $v1
	sw $v1, 56($sp)
	lw $v1, 60($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 76($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 60($sp)
	move $a0 $v0
	lw $v0, 56($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 52($sp)
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 72
	j $ra
	
	.text
	.globl Tree_RecPrint
Tree_RecPrint:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 152
	sw $ra, -4($fp)
	sw $a0, 140($sp)
	sw $a1, 136($sp)
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 32($v1)
	sw $v0, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 120($sp)
	lw $v1, 120($sp)
	beqz $v1 L49
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 16($v1)
	sw $v0, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 108($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 76($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 108($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	b L50
L49:
	nop
	li $v1 1
	sw $v1, 92($sp)
	lw $v1, 92($sp)
	move $v1 $v1
	sw $v1, 132($sp)
L50:
	nop
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 20($v1)
	sw $v0, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	move $a0 $v1
	jal _print
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 76($sp)
	lw $v1, 76($sp)
	lw $v0, 28($v1)
	sw $v0, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	beqz $v1 L51
	lw $v1, 136($sp)
	lw $v0, 0($v1)
	sw $v0, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 12($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 136($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 56($sp)
	lw $v1, 140($sp)
	lw $v0, 0($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 76($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 140($sp)
	move $a0 $v0
	lw $v0, 56($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 132($sp)
	b L52
L51:
	nop
	li $v1 1
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 132($sp)
L52:
	nop
	li $v1 1
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 152
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

