.data  

  stNhap: .asciiz "Nhap vao 1 chuoi: "

  stXuatTruoc: "Ki tu dung truoc"

  stXuatSau: "\nKi tu dung sau "

  stLa: .asciiz " la "

 

.text  

main:  

  la $a0, stNhap  

  jal printf  

 

  addi $v0, $0, 12  

  syscall  

  addi $s0, $v0, 0  

 

  la $a0, stXuatTruoc  

  jal printf  
  
  
   addi $a0, $s0, 0  

  addi $v0, $0, 11  

  syscall  

  la $a0, stLa  

  jal printf  

  addi $a0, $s0, -1  

  addi $v0, $0, 11  

  syscall  

 

  la $a0, stXuatSau  

  jal printf  

 

  addi $a0, $s0, 0  

  addi $v0, $0, 11  

  syscall  

  la $a0, stLa  

  jal printf  

  addi $a0, $s0, 1  

  addi $v0, $0, 11  

  syscall  

 
  
  
  printf:  

  addi $v0, $0, 4

  syscall  

  jr $ra
