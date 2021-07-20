.data

message2: 	.asciiz "Please input character \n"
userInput: 	.space  256

num: 	.asciiz " is number!\n"
lchar: 	.asciiz " is lowercase character!\n"
uchar: 	.asciiz " is uppercase character!\n"

temp: "\n"
.text
.globl main
main:

	# ask user for input
	li $v0, 4
	la $a0, message2
	syscall
	# read user data/input from keyboard
	li $v0, 12
	la $a0, userInput
	syscall
	addi $s0,$v0,0
	
	la $a0,temp
	li $v0,4
	syscall
	
	li $t1,58
	slt $t0,$s0,$t1
	bnez $t0, NUMBER
	
	li $t1,91
	slt $t0,$s0,$t1
	bnez $t0, UPPER
	 
	li $t1, 123
	slt $t0,$s0,$t1
	bnez $t0, LOWER
	
	NUMBER:
	li $v0, 11
	#move $a0, $s0
	addi $a0,$s0, 0
	syscall
	li $v0, 4
	la $a0, num
	syscall
	j exit
	
	LOWER:
	addi $a0,$s0, 0
	li $v0,11
	syscall
	li $v0, 4
	la $a0, lchar
	syscall
	j exit
	
	UPPER:
	addi $a0,$s0, 0
	li $v0,11
	syscall
	li $v0, 4
	la $a0, uchar
	syscall
	j exit
	  
	exit: 