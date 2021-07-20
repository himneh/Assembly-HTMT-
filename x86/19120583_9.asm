;19120583
%include "io.inc"
extern _printf
extern _scanf
extern _getch
extern _gets

section .data
  ms1 db "Insert string: ",0
  ms2 db "Reversed string: ",0
  fmt db "%s",0
  
section .bss
string resb 255
rvstring resb 255

section .text
global CMAIN
CMAIN:
    ;write your code here
    ;Ask for insert string
    mov ebp, esp
    push ms1
    call _printf
    add esp,4
    
    ;Insert instring
    push string
    push fmt
    call _gets
    add esp, 4
    
    mov esi,0
    mov eax,string
    
_length: ;count string length
    mov edx,[eax]
    inc eax
    inc esi
    test edx, edx
    jnz _length
    
    sub eax,2
    sub esi, 2
    
    mov edx,rvstring
    
_reversed: ;reverse string
    mov ch, [eax]
    mov [edx],ch
    dec eax
    inc edx
    dec esi
    cmp esi, 0
    jge _reversed
    
;print reversed string
    push ms2
    call _printf
    add esp,4
    
    mov edx, rvstring
    
    push edx
    push fmt
    call _printf
    add esp,8
    
    call _getch
    xor eax, eax
    ret