%include "io.inc"

extern _scanf 
extern _printf
extern _getch

SECTION .data
message1: db "Insert: ", 0

formatin: db "%c", 0
fmt1: db "%c is number!",10,0
fmt2: db "%c is lowercase character!",10,0
fmt3: db "%c is uppercase number!",10,0

section .bss
char resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here

    ;Xuat thong bao nhap so dau tien
    push message1
    call _printf
    add esp, 8
    
    ;Nhap so dau tien
    push char 
    push formatin   
    call _scanf
    add esp, 8 
    

    mov eax,[char]
    cmp eax,'9'
    jle print1
    
    mov eax,[char]
    cmp eax,'Z'
    jle print2
    
    mov eax,[char]
    cmp eax,'z'
    jle print3
    
    add esp, 8 ; remove parameters
    pop ecx
    pop ebx ; restore registers in reverse order
    mov eax, 0 ; no error
    ret
    
    print1:
    
    push eax
    push fmt1
    
    call _printf
    add esp,8
    call _getch
    ret
    
    print2:
    
    push eax
    push fmt3
    call _printf
    add esp,8
    call _getch
    ret
    
    print3:
    
    push eax
    push fmt2
    call _printf
    add esp,8   
    call _getch

    
    