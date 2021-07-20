#19120583  -   #1
.data

message1: 	.asciiz "Please input string \n"
userInput: 	.space  256
message2: 	.asciiz "\nThe string u just entered is: "

.text
.globl main
main:
#1
	# ask user for input
	li $v0, 4
	la $a0, message1
	syscall
	# read user data/input from keyboard
	li $v0, 8
	la $a0, userInput
	li $a1, 256
	syscall
	move $t0,$a0
	
	li $v0,4
	la $a0, message2
	syscall 
	
	# write data
	li $v0,4
	la $a0,userInput
	syscall