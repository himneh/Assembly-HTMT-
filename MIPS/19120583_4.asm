.data
num1: .word
num2: .word

sum: .word
difference: .word
product: .word
quotient: .word
remainder: .word


message1: .asciiz "Please input first number: \n"
message2: .asciiz "Please input second number: \n"
SumMess: .asciiz "\nSum = "
DiffMess: .asciiz "\nDifference = "
ProdMess: .asciiz "\nProduct = "
QuoMess: .asciiz "\nQuotient = "
RemMess: .asciiz "\nRemainder = "

.text
.globl main
main:
	# ask user for input
	li $v0, 4
	la $a0, message1
	syscall
	
	# read first number from keyboard
	li $v0, 5
	la $a0, num1
	syscall
	move $s0,$v0
	
	# ask user for input
	li $v0, 4
	la $a0, message2
	syscall
	
	# read second number from keyboard
	li $v0, 5
	la $a0, num1
	syscall
	move $s1,$v0
	
	# Calculate sum
	add $t0,$s0,$s1
	move $s3,$t0
	
	# Calculate difference
	sub $t0,$s0,$s1
	move $s4,$t0
	
	# Calculate product
	mul $t0,$s0,$s1
	move $s5,$t0
	
	# Calculate quotient
	div $s0,$s1
	mflo $s6
	mfhi $s7
	
	#Print
	li $v0, 4
	la $a0,SumMess
	syscall
	li $v0, 1
	move $a0, $s3 #Sum
	syscall
	
	li $v0, 4
	la $a0,DiffMess
	syscall
	li $v0, 1
	move $a0, $s4 #Difference
	syscall
	
	li $v0, 4
	la $a0,ProdMess
	syscall
	li $v0, 1
	move $a0, $s5 #Product
	syscall
	
	li $v0, 4
	la $a0,QuoMess
	syscall
	li $v0, 1
	move $a0, $s6 #Quotient
	syscall
	
	li $v0, 4	
	la $a0,RemMess
	syscall
	li $v0, 1
	move $a0, $s7 #Remainder
	syscall