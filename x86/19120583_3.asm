;19120583, nhap ky tu hoa, in ky tu thuong
%include "io.inc"
extern _printf
extern _scanf
extern _getch

section .data
    tb1 db "Nhap ky tu: ",0
    tb2 db 10,"Ky tu thuong la: %c",0
    fmt db "%c"
 
section .bss
   char resb 1 
   num1 resb 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    ;xuat tb1
    push tb1
    call _printf
    add esp,4
    
    ;Nhap ky tu
    push char
    push fmt
    call _scanf
    add esp, 8
    
    ;Lay ky tu thuong
    mov eax,[char]
    add eax,32
    mov [num1],eax

    ;In ra ky tu thuong
    push dword[num1]
    push tb2
    call _printf
    add esp,8
    
    call _getch
    xor eax, eax
    ret