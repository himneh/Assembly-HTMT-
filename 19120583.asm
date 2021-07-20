#yeu cau: Viet ham tinh tong tu 1 den N
.data
	tb1: .asciiz "Nhap n: "
	tb2: .asciiz "Tong 1 den n la: "
	n: .word 0
.text
	#xuat tb1
	li $v0,4
	la $a0,tb1
	syscall

	#Nhap n
	li $v0,5
	syscall

	#Luu $v0 vao n 
	sw $v0,n
	
	#truyen tham so 
	lw $a0,n
	
	#goi ham
	jal _TinhTong
	
	#Lay ket qua tra ve
	sw $v0,kq

	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall

	#xuat kq
	li $v0,1
	lw $a0,kq
	syscall

	#ket thuc
	li $v0,10
	syscall


# ====== Ham Tinh Tong ===========

#dau thu tuc
_TinhTong:
	addi $sp,$sp,-32 #khai bao kich thuoc stack
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	
#Than thu tuc
	#khoi tao
	li $s0,0 # s = 0
	li $t0,1 # i = 1
_TinhTong.Lap:
	add $s0,$s0,$t0 # s = s + i
	addi $t0,$t0,1 # i = i + 1
	#Kiem tra n >= i thi Lap
	slt $t1,$a0,$t0 
	beq $t1,0,_TinhTong.Lap

	#Luu tong vao $v0
	move $v0,$s0
#Cuoi thu tuc:
	#restore thanh ghi
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	#Xoa stack
	addi $sp,$sp,32
	#quay ve
	jr $ra

	
	
