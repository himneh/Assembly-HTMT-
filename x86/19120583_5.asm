%include "io.inc"

extern _scanf 
extern _printf
extern _getch

SECTION .data
message1: db "Nhap so dau tien: ", 0
message2: db "Nhap so thu hai: ", 0
formatin: db "%d", 0
formatout: db "So lon hon la %d",10,0

int1: times 4 db 0 
int2: times 4 db 0 

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here

    ;Xuat thong bao nhap so dau tien
    push message1
    call printf
    add esp, 4
    
    ;Nhap so dau tien
    push int1 
    push formatin   
    call scanf
    add esp, 8 
    
    ;Xuat thong nhap so thu hai
    push message2
    call printf
    add esp, 4 
    
    ;Nhap so thu 2
    push int2 
    push formatin 
    call scanf
    add esp, 8 
    
    mov eax,[int1]
    mov ebx,[int2]
    cmp eax,ebx
    jg print1
    
    push ebx
    push formatout
    call printf
 
    
    add esp, 8 ; remove parameters
    pop ecx
    pop ebx ; restore registers in reverse order
    mov eax, 0 ; no error
    ret
    
    print1:
    push eax
    push formatout
    call printf
    add esp,8
    call _getch
    
    