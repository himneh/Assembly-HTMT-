
%include "io.inc"
extern _printf
extern _scanf
extern _getch

section .data
    tbNhap db "Nhap vao mot chuoi: ", 0
    tbXuat db "Chuoi nguoc la: ",0
    fmt db "%s" , 0
    
section .bss
    str_Nhap resb 100
    str_Xuat resb 100
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp;
    
    push tbNhap
    call _printf
    add esp, 4
    
    ; Nhap chuoi tu ban phim
    push str_Nhap
    push fmt
    call _scanf
    add esp, 8
    
    mov esi, 0
    mov eax, str_Nhap
    
_DoDaiChuoi:
    mov edx, [eax]
    inc eax
    inc esi
    test edx, edx
    jnz _DoDaiChuoi
    
    sub eax, 2
    sub esi, 2
    
    mov edx, str_Xuat
    
_ChuoiNguoc:
    mov ch, [eax]           
    mov [edx], ch
    dec eax
    inc edx
    dec esi
    cmp esi, 0
    jge _ChuoiNguoc
    
    push tbXuat
    call _printf
    add esp, 4
    
    mov edx, str_Xuat
    
    ;xuat str_Nguoc
    push edx
    push fmt
    call _printf
    add esp, 8
    
    call _getch
    xor eax, eax
    ret