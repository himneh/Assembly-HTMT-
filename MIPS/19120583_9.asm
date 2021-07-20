.data

input:		.asciiz "Insert string: "
output: 	.asciiz "Reversed string: "

str: .space 256
rvstr: .space 256

.text
#Input
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,8
	la $a0,str
	li $a1,256
	syscall
	
#Init Loop:
	li $t0,0 #index
	la $s0,str
Loop:
	lb $t1,($s0) #Read character
	bne $t1,0,inc
	j end_loop

inc:
	addi $t0,$t0,1 #Increase index
	addi $s0,$s0,1 
	j Loop
	
end_loop:
	#Insert data to Reversed string
	
	addi $s0,$s0,-1
	la, $s1,rvstr
looop: 
	lb $t1,($s0)
	#save character to s1
	sb $t1,($s1)
	
	addi $s0,$s0,-1
	addi $s1,$s1,1
	addi $t0,$t0,-1
	
	bnez $t0,looop #if index (t0) != 0 then looop
	
# Print
	li $v0,4
	la $a0,output
	syscall

	#xuat dn
	li $v0,4
	la $a0,rvstr
	syscall
	
	