.data
num1: .word
num2: .word

message1: .asciiz "Please input first number: \n"
message2: .asciiz "Please input second number: \n"
message3: .asciiz "\nThe greater one: "
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
	
	li $v0, 4
	la $a0, message3
	syscall
	
	#Compare
	beq $s0,$s1, FIRST #if num1 = num2, print one of them
	
	slt $t0, $s0, $s1
	bnez $t0, FIRST # if num2 > num 1
	
	j SECOND # else ...
	
	FIRST: #print num2
	li $v0, 1
	move $a0, $s1 
	syscall
	j exit
	
	SECOND: #print num1
	li $v0, 1
	move $a0, $s0 
	syscall
	j exit
	
	exit: #break
	