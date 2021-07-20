	
.data

message2: 	.asciiz "Please input character \n"
userInput: 	.space  256
message3: 	.asciiz "\nThe lowercase character is: "

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
	
	# Print "lowercase character"
	li $v0, 4
	la $a0,message3
	syscall
	
	# Convert UPPERCASE to lowercase:
	addi $a0,$s0,32
	li $v0,11
	syscall 
