%include "io.inc"

extern _scanf 
extern _printf
extern _getch

SECTION .data
message1: db "Nhap so dau tien: ", 0
message2: db "Nhap so thu hai: ", 0
formatin: db "%d", 0
formatSum: db "Sum = %d",10,0
formatSub: db "Difference = %d",10,0
formatMul: db "Product = %d",10,0
formatDiv: db "Quotient = %d",10,0
formatDivv: db "Remainder = %d",10,0
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
    
    ;Cong 2 so
    mov ebx, dword [int1]
    mov ecx, dword [int2]
    add ebx, ecx 
    push ebx
    push formatSum
    call printf ; display the sum
    add esp,8
    
    ;Tru 2 so
    mov ebx, dword [int1]
    mov ecx, dword [int2]
    sub ebx, ecx 
    push ebx
    push formatSub
    call printf ; display the Difference
    add esp,8
    
    ;Nhan 2 so
    mov ebx, dword [int1]
    mov ecx, dword [int2]
    imul ebx,ecx 
    push ebx
    push formatMul
    call printf ; display the Product
    add esp,8
    
     ;Chia 2 so
    mov eax, dword [int1]
    mov ecx, dword [int2]
    mov edx,0
    idiv ecx 
    push eax
    push formatDiv
    call printf ; display the Quotient
    add esp,8
    
    mov eax, dword [int1]
    mov ecx, dword [int2]
    mov edx,0
    idiv ecx 
    push edx
    push formatDivv
    call printf ; display the Remainder
    add esp,8
    
    call _getch
    
    add esp, 8 ; remove parameters
    pop ecx
    pop ebx ; restore registers in reverse order
    mov eax, 0 ; no error
    ret