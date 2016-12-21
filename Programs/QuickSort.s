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
	la $v1 QS_Start
	sw $v1, 64($sp)
	lw $v1, 72($sp)
	lw $v0, 64($sp)
	sw $v0, 0($v1)
	la $v1 QS_Sort
	sw $v1, 60($sp)
	lw $v1, 72($sp)
	lw $v0, 60($sp)
	sw $v0, 4($v1)
	la $v1 QS_Print
	sw $v1, 56($sp)
	lw $v1, 72($sp)
	lw $v0, 56($sp)
	sw $v0, 8($v1)
	la $v1 QS_Init
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
	.globl QS_Start
QS_Start:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 128
	sw $ra, -4($fp)
	sw $a0, 116($sp)
	sw $a1, 112($sp)
	lw $v1, 116($sp)
	lw $v0, 0($v1)
	sw $v0, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 12($v1)
	sw $v0, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 116($sp)
	move $a0 $v0
	lw $v0, 112($sp)
	move $a1 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 96($sp)
	lw $v1, 96($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	lw $v1, 116($sp)
	lw $v0, 0($v1)
	sw $v0, 92($sp)
	lw $v1, 92($sp)
	lw $v0, 8($v1)
	sw $v0, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 116($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	li $v1 9999
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	move $a0 $v1
	jal _print
	lw $v1, 116($sp)
	lw $v0, 8($v1)
	sw $v0, 76($sp)
	li $v1 1
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 76($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 68($sp)
	lw $v1, 68($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	li $v1 0
	sw $v1, 64($sp)
	lw $v1, 116($sp)
	lw $v0, 0($v1)
	sw $v0, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 4($v1)
	sw $v0, 56($sp)
	lw $v1, 56($sp)
	lw $v0, 116($sp)
	move $a0 $v0
	lw $v0, 64($sp)
	move $a1 $v0
	lw $v0, 108($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 52($sp)
	lw $v1, 52($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	lw $v1, 116($sp)
	lw $v0, 0($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 8($v1)
	sw $v0, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 116($sp)
	move $a0 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 108($sp)
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 128
	j $ra
	
	.text
	.globl QS_Sort
QS_Sort:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 412
	sw $ra, -4($fp)
	sw $a0, 400($sp)
	sw $a1, 396($sp)
	sw $a2, 392($sp)
	li $v1 0
	sw $v1, 356($sp)
	lw $v1, 356($sp)
	move $v1 $v1
	sw $v1, 372($sp)
	lw $v1, 392($sp)
	lw $v0, 396($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 352($sp)
	lw $v1, 352($sp)
	beqz $v1 L1
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 348($sp)
	lw $v0, 392($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 340($sp)
	lw $v1, 340($sp)
	lw $v0, 348($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 344($sp)
	lw $v1, 344($sp)
	lw $v0, 4($v1)
	sw $v0, 336($sp)
	lw $v1, 336($sp)
	move $v1 $v1
	sw $v1, 388($sp)
	li $v1 1
	sw $v1, 332($sp)
	lw $v1, 332($sp)
	lw $v0, 396($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 328($sp)
	lw $v1, 328($sp)
	move $v1 $v1
	sw $v1, 384($sp)
	lw $v1, 392($sp)
	move $v1 $v1
	sw $v1, 380($sp)
	li $v1 1
	sw $v1, 324($sp)
	lw $v1, 324($sp)
	move $v1 $v1
	sw $v1, 368($sp)
L4:
	nop
	lw $v1, 368($sp)
	beqz $v1 L3
	li $v1 1
	sw $v1, 320($sp)
	lw $v1, 320($sp)
	move $v1 $v1
	sw $v1, 364($sp)
L6:
	nop
	lw $v1, 364($sp)
	beqz $v1 L5
	li $v1 1
	sw $v1, 316($sp)
	lw $v1, 316($sp)
	lw $v0, 384($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 312($sp)
	lw $v1, 312($sp)
	move $v1 $v1
	sw $v1, 384($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 308($sp)
	lw $v0, 384($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 300($sp)
	lw $v1, 300($sp)
	lw $v0, 308($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 304($sp)
	lw $v1, 304($sp)
	lw $v0, 4($v1)
	sw $v0, 296($sp)
	lw $v1, 296($sp)
	move $v1 $v1
	sw $v1, 360($sp)
	lw $v1, 388($sp)
	lw $v0, 360($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 292($sp)
	li $v1 1
	sw $v1, 288($sp)
	lw $v1, 292($sp)
	lw $v0, 288($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 284($sp)
	lw $v1, 284($sp)
	beqz $v1 L7
	li $v1 0
	sw $v1, 280($sp)
	lw $v1, 280($sp)
	move $v1 $v1
	sw $v1, 364($sp)
	b L8
L7:
	nop
	li $v1 1
	sw $v1, 276($sp)
	lw $v1, 276($sp)
	move $v1 $v1
	sw $v1, 364($sp)
L8:
	nop
	b L6
L5:
	nop
	li $v1 1
	sw $v1, 272($sp)
	lw $v1, 272($sp)
	move $v1 $v1
	sw $v1, 364($sp)
L10:
	nop
	lw $v1, 364($sp)
	beqz $v1 L9
	li $v1 1
	sw $v1, 268($sp)
	lw $v1, 268($sp)
	lw $v0, 380($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 264($sp)
	lw $v1, 264($sp)
	move $v1 $v1
	sw $v1, 380($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 260($sp)
	lw $v0, 380($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 252($sp)
	lw $v1, 252($sp)
	lw $v0, 260($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 256($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 248($sp)
	lw $v1, 248($sp)
	move $v1 $v1
	sw $v1, 360($sp)
	lw $v1, 360($sp)
	lw $v0, 388($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 244($sp)
	li $v1 1
	sw $v1, 240($sp)
	lw $v1, 244($sp)
	lw $v0, 240($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 236($sp)
	lw $v1, 236($sp)
	beqz $v1 L11
	li $v1 0
	sw $v1, 232($sp)
	lw $v1, 232($sp)
	move $v1 $v1
	sw $v1, 364($sp)
	b L12
L11:
	nop
	li $v1 1
	sw $v1, 228($sp)
	lw $v1, 228($sp)
	move $v1 $v1
	sw $v1, 364($sp)
L12:
	nop
	b L10
L9:
	nop
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 224($sp)
	lw $v0, 384($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 216($sp)
	lw $v1, 216($sp)
	lw $v0, 224($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 220($sp)
	lw $v1, 220($sp)
	lw $v0, 4($v1)
	sw $v0, 212($sp)
	lw $v1, 212($sp)
	move $v1 $v1
	sw $v1, 372($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 208($sp)
	lw $v0, 380($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 200($sp)
	lw $v1, 200($sp)
	lw $v0, 208($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 204($sp)
	lw $v1, 204($sp)
	lw $v0, 4($v1)
	sw $v0, 196($sp)
	lw $v0, 384($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 184($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 192($sp)
	lw $v1, 184($sp)
	lw $v0, 192($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 188($sp)
	lw $v1, 188($sp)
	lw $v0, 196($sp)
	sw $v0, 4($v1)
	lw $v0, 380($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 172($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 180($sp)
	lw $v1, 172($sp)
	lw $v0, 180($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 176($sp)
	lw $v1, 176($sp)
	lw $v0, 372($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 168($sp)
	lw $v1, 168($sp)
	lw $v0, 384($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 164($sp)
	lw $v1, 164($sp)
	lw $v0, 380($sp)
	move $v1 $v1
	slt $v1, $v0, $v1
	sw $v1, 160($sp)
	lw $v1, 160($sp)
	beqz $v1 L13
	li $v1 0
	sw $v1, 156($sp)
	lw $v1, 156($sp)
	move $v1 $v1
	sw $v1, 368($sp)
	b L14
L13:
	nop
	li $v1 1
	sw $v1, 152($sp)
	lw $v1, 152($sp)
	move $v1 $v1
	sw $v1, 368($sp)
L14:
	nop
	b L4
L3:
	nop
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 148($sp)
	lw $v0, 384($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 140($sp)
	lw $v1, 140($sp)
	lw $v0, 148($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 4($v1)
	sw $v0, 136($sp)
	lw $v0, 380($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 124($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 132($sp)
	lw $v1, 124($sp)
	lw $v0, 132($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 128($sp)
	lw $v1, 128($sp)
	lw $v0, 136($sp)
	sw $v0, 4($v1)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 120($sp)
	lw $v0, 392($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 112($sp)
	lw $v1, 112($sp)
	lw $v0, 120($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 116($sp)
	lw $v1, 116($sp)
	lw $v0, 4($v1)
	sw $v0, 108($sp)
	lw $v0, 384($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 96($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 104($sp)
	lw $v1, 96($sp)
	lw $v0, 104($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 100($sp)
	lw $v1, 100($sp)
	lw $v0, 108($sp)
	sw $v0, 4($v1)
	lw $v0, 392($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 84($sp)
	lw $v1, 400($sp)
	lw $v0, 4($v1)
	sw $v0, 92($sp)
	lw $v1, 84($sp)
	lw $v0, 92($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 88($sp)
	lw $v1, 88($sp)
	lw $v0, 372($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 80($sp)
	lw $v1, 80($sp)
	lw $v0, 384($sp)
	move $v1 $v1
	sub $v1, $v0, $v1
	sw $v1, 76($sp)
	lw $v1, 400($sp)
	lw $v0, 0($v1)
	sw $v0, 72($sp)
	lw $v1, 72($sp)
	lw $v0, 4($v1)
	sw $v0, 68($sp)
	lw $v1, 68($sp)
	lw $v0, 400($sp)
	move $a0 $v0
	lw $v0, 396($sp)
	move $a1 $v0
	lw $v0, 76($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	move $v1 $v1
	sw $v1, 376($sp)
	li $v1 1
	sw $v1, 60($sp)
	lw $v1, 60($sp)
	lw $v0, 384($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 56($sp)
	lw $v1, 400($sp)
	lw $v0, 0($v1)
	sw $v0, 52($sp)
	lw $v1, 52($sp)
	lw $v0, 4($v1)
	sw $v0, 48($sp)
	lw $v1, 48($sp)
	lw $v0, 400($sp)
	move $a0 $v0
	lw $v0, 56($sp)
	move $a1 $v0
	lw $v0, 392($sp)
	move $a2 $v0
	jalr $v1
	move $v1 $v0
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	move $v1 $v1
	sw $v1, 376($sp)
	b L2
L1:
	nop
	li $v1 0
	sw $v1, 40($sp)
	lw $v1, 40($sp)
	move $v1 $v1
	sw $v1, 376($sp)
L2:
	nop
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 412
	j $ra
	
	.text
	.globl QS_Print
QS_Print:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 92
	sw $ra, -4($fp)
	sw $a0, 80($sp)
	li $v1 0
	sw $v1, 72($sp)
	lw $v1, 72($sp)
	move $v1 $v1
	sw $v1, 76($sp)
L16:
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
	beqz $v1 L15
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
	b L16
L15:
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
	.globl QS_Init
QS_Init:
	sw $fp, -8($sp)
	move $fp, $sp
	subu $sp, $sp, 268
	sw $ra, -4($fp)
	sw $a0, 256($sp)
	sw $a1, 252($sp)
	lw $v1, 256($sp)
	lw $v0, 252($sp)
	sw $v0, 8($v1)
	lw $v0, 252($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 248($sp)
	lw $v0, 248($sp)
	li $v1 4
	add $v1, $v0, $v1
	sw $v1, 244($sp)
	lw $v1, 244($sp)
	move $a0 $v1
	jal _halloc
	move $v1 $v0
	sw $v1, 240($sp)
	lw $v1, 240($sp)
	lw $v0, 252($sp)
	sw $v0, 0($v1)
	lw $v1, 256($sp)
	lw $v0, 240($sp)
	sw $v0, 4($v1)
	li $v1 0
	sw $v1, 236($sp)
	li $v1 20
	sw $v1, 232($sp)
	lw $v0, 236($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 220($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 228($sp)
	lw $v1, 220($sp)
	lw $v0, 228($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 224($sp)
	lw $v1, 224($sp)
	lw $v0, 232($sp)
	sw $v0, 4($v1)
	li $v1 1
	sw $v1, 216($sp)
	li $v1 7
	sw $v1, 212($sp)
	lw $v0, 216($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 200($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 208($sp)
	lw $v1, 200($sp)
	lw $v0, 208($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 204($sp)
	lw $v1, 204($sp)
	lw $v0, 212($sp)
	sw $v0, 4($v1)
	li $v1 2
	sw $v1, 196($sp)
	li $v1 12
	sw $v1, 192($sp)
	lw $v0, 196($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 180($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 188($sp)
	lw $v1, 180($sp)
	lw $v0, 188($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 184($sp)
	lw $v1, 184($sp)
	lw $v0, 192($sp)
	sw $v0, 4($v1)
	li $v1 3
	sw $v1, 176($sp)
	li $v1 18
	sw $v1, 172($sp)
	lw $v0, 176($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 160($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 168($sp)
	lw $v1, 160($sp)
	lw $v0, 168($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 164($sp)
	lw $v1, 164($sp)
	lw $v0, 172($sp)
	sw $v0, 4($v1)
	li $v1 4
	sw $v1, 156($sp)
	li $v1 2
	sw $v1, 152($sp)
	lw $v0, 156($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 140($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 148($sp)
	lw $v1, 140($sp)
	lw $v0, 148($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 144($sp)
	lw $v1, 144($sp)
	lw $v0, 152($sp)
	sw $v0, 4($v1)
	li $v1 5
	sw $v1, 136($sp)
	li $v1 11
	sw $v1, 132($sp)
	lw $v0, 136($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 120($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 128($sp)
	lw $v1, 120($sp)
	lw $v0, 128($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 124($sp)
	lw $v1, 124($sp)
	lw $v0, 132($sp)
	sw $v0, 4($v1)
	li $v1 6
	sw $v1, 116($sp)
	li $v1 6
	sw $v1, 112($sp)
	lw $v0, 116($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 100($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 108($sp)
	lw $v1, 100($sp)
	lw $v0, 108($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 104($sp)
	lw $v1, 104($sp)
	lw $v0, 112($sp)
	sw $v0, 4($v1)
	li $v1 7
	sw $v1, 96($sp)
	li $v1 9
	sw $v1, 92($sp)
	lw $v0, 96($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 80($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 88($sp)
	lw $v1, 80($sp)
	lw $v0, 88($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 84($sp)
	lw $v1, 84($sp)
	lw $v0, 92($sp)
	sw $v0, 4($v1)
	li $v1 8
	sw $v1, 76($sp)
	li $v1 19
	sw $v1, 72($sp)
	lw $v0, 76($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 60($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 68($sp)
	lw $v1, 60($sp)
	lw $v0, 68($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 64($sp)
	lw $v1, 64($sp)
	lw $v0, 72($sp)
	sw $v0, 4($v1)
	li $v1 9
	sw $v1, 56($sp)
	li $v1 5
	sw $v1, 52($sp)
	lw $v0, 56($sp)
	li $v1 4
	mul $v1, $v0, $v1
	sw $v1, 40($sp)
	lw $v1, 256($sp)
	lw $v0, 4($v1)
	sw $v0, 48($sp)
	lw $v1, 40($sp)
	lw $v0, 48($sp)
	move $v1 $v1
	add $v1, $v0, $v1
	sw $v1, 44($sp)
	lw $v1, 44($sp)
	lw $v0, 52($sp)
	sw $v0, 4($v1)
	li $v1 0
	sw $v1, 36($sp)
	lw $v1, 36($sp)
	move $v0 $v1
	lw $ra, -4($fp)
	lw $fp, 12($sp)
	addu $sp, $sp, 268
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

