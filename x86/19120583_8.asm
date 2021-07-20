;19120583
%include "io.inc"
extern _printf
extern _scanf
extern _getch

section .data
    ms1 db "Insert size number: ",0
    ms2 db "Sum from 1 to %d is %d",0
    fmt db "%d",0
section .bss
    n resd 1
    res resd 1 
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;ask for insert n
    push ms1
    call _printf
    add esp,4
    
    ;insert n
    push n
    push fmt
    call _scanf
    add esp,8
    
    ;init loop
    mov eax,0; s = 0
    mov esi,1; i = 1
_loop:
    add eax,esi; s += i
    inc esi; i++
    ;if i <= n then loop
    cmp esi,dword[n]
    jle _loop
    
    ;save the result
    mov dword[res],eax
    
    ;Print result
    push dword[res]
    push dword[n]
    push ms2
    call _printf
    add esp,12
    
    call _getch
    
    xor eax, eax
    ret