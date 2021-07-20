
%include "io.inc"
extern _printf
extern _scanf
extern _getch

section .data
    tb1 db "Nhap chuoi: ",0
    tb2 db "Chuoi vua nhap la: ",0
    fmt db "%s",0
section .bss
string resb 255
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;xuat tb1
    mov ebp, esp
    push tb1
    call _printf
    add esp,4
    
    push string
    push fmt
    call _scanf
    add esp, 4
    
    push tb2
    call _printf
    add esp,4
    
    push string
    call _printf
    add esp,4
    
    call _getch
    xor eax, eax
    ret