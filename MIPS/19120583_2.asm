.data

message2: 	.asciiz "Please input character \n"
userInput: 	.space  256

 stBefore: "\nPreceding Character: "
 stAfter: "\nCharacter after: "


.text
.globl main
main:
#2
	# ask user for input
	li $v0, 4
	la $a0, message2
	syscall
	# read user data/input from keyboard
	li $v0, 12
	la $a0, userInput
	syscall
	addi $s0,$v0,0
	
	# Print "Preceding character: "
	la $a0,stBefore
	jal printf
	
	# Print the preceding character:
	addi $a0,$s0,-1
	li $v0,11
	syscall
	
	# Print "Character After: "
	la $a0,stAfter
	jal printf
	
	# Print the character after: 
	addi $a0,$s0,1
	li $v0,11
	syscall
	
	exit:
 	addi $v0, $0, 10
  	syscall 
 	
 	# Print function
 	printf:  
  	li $v0, 4
	syscall  	
  	jr $ra