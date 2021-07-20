;19120583
%include "io.inc"
extern _printf
extern _scanf
extern _getch

section .data
    ms1 db "Insert size number: ",0
    ms2 db "a[%d]: ",0
    ms3 db "Entered array: ",0
    fmt1 db "%d",0
    fmt2 db "%d ",0
section .bss
    n resd 1
    arr resd 100
    
section .text
global CMAIN
CMAIN:
    ;write your code here
    ;ask for insert size number
    push ms1
    call _printf
    add esp,4
    
    ;Insert n
    push n
    push fmt1
    call _scanf
    add esp,8
    
    ;Init loop
    mov ebx, arr
    mov esi,0
    
loop_inp:
   
    ;ask for insert arrray's elements a[i]
    push esi
    push ms2
    call _printf
    add esp,8
    
    ;insert a[i]  
    push ebx
    push fmt1
    call _scanf
    add esp,8
    
    ;increase index i
    add ebx,4
    inc esi
    ; if i < n then loop
    cmp esi,dword[n]
    jl loop_inp
    
    ;Print
    push ms3
    call _printf
    add esp,4
    
    ;init loop
    mov ebx,arr
    mov esi,0
    
loop_out:

    ;Print a[i]
    push dword[ebx]
    push fmt2
    call _printf
    add esp,8
    
    ;increase index i
    add ebx,4
    inc esi
    
    ; if i < n then loop
    cmp esi,dword[n]
    jl loop_out
    
    call _getch
    
    xor eax, eax
    ret