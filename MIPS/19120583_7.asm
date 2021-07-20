.data 

input1:  .asciiz  "Insert Array Size Number: "

input2:  .asciiz  "["

input3:  .asciiz  "] = "

output:  .asciiz  "\nArray entered: "

array:  .word  0:100   # int array[100] 

  .text 

main: 

# Insert n

	la  $a0, input1 
	addi  $v0, $zero, 4 
	syscall 

	addi  $v0, $zero, 5 
	syscall 
	addi  $t0, $v0, 0 

# Initialization

 	addi  $t1, $zero, 0 
 	la  $a1, array 

Insert: 

# check index

	subu  $t2, $t1, $t0
	bgez  $t2, ENDINPUT

# print index [i]

	la    $a0, input2 
	addi  $v0, $zero, 4 
	syscall 

	addi  $a0, $t1, 0 
	addi  $v0, $zero, 1 
	syscall 

	la    $a0, input3 
	addi  $v0, $zero, 4 
	syscall 

# Insert number and save to array

	addi  $v0, $zero, 5 
	syscall 
	sw    $v0, ($a1) 

# Increase index

	addi  $t1, $t1, 1 
	addi  $a1, $a1, 4 

	j    Insert

ENDINPUT:
	la    $a0, output 
	addi  $v0, $zero, 4 
	syscall 

# Initialization

	la    $a1, array
	addi  $t1, $zero, 0 

Print: 

# check index

	subu  $t2, $t1, $t0
	bgez  $t2, END

# Print element array[i] 

 	lw    $a0, ($a1) 
	addi  $v0, $zero, 1 
	syscall 

# Print space 

	addi  $a0, $zero, 0x20 
	addi  $v0, $zero, 11 
	syscall 

# increase index

	addi  $t1, $t1, 1 
	addi  $a1, $a1, 4 

 	j    Print 

END: 

	addi  $v0, $zero, 10 
	syscall