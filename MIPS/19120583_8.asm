.data 

input: 	 .asciiz  "Insert Number n: "
output:  .asciiz  "\nSum from 1 to n: "

n: 	.word 0
answer:  .word  0

.text 

main: 

# Insert n

	la  $a0, input
	addi  $v0, $zero, 4 
	syscall 

	addi  $v0, $zero, 5 
	syscall 
	sw $v0,n
	lw $a0,n 

# Calculate Sum
	jal calSum
	sw $v0,answer 
	
# Print answer
		
	la $a0, output	
	li $v0,4
	syscall
	
	li $v0,1
	lw $a0,answer 
	syscall
# End
	li $v0,10
	syscall
	
# Calculate Sum Function:
calSum:
	addi $sp,$sp,-32 # Init Stack size
	sw $ra,($sp)
	sw $s0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)

	# Init
	li $s0,0 # s = 0
	li $t0,1 # i = 1
calSum.loop:
	add $s0,$s0,$t0 # s = s + i
	addi $t0,$t0,1 # i = i + 1

	# Check if i <= n then loop:
	slt $t1,$a0,$t0 
	beq $t1,0,calSum.loop

	# Save sum
	move $v0,$s0

	# Restore registers
	lw $ra,($sp)
	lw $s0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	
	# Delete stack
	addi $sp,$sp,32
	# Back to breakpoint
	jr $ra