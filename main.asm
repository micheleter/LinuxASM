; Program Description: [Insert Description Here]
; Author: Michel Eter
; Creation Date: 02/14/2018
; Revisions: [Insert Any Revisions]
; Date:              Modified by: Michel Eter
; Operating System: Mint Linux
; IDE/Compiler: Geany

%include "./functions.inc"

bits 32
section .data  ;Initialized data definitions go here
    A   db  10h
    B   dw  2000h
    C   dd  30000h
    D   dd  0h
    eq1 db  "Equation 1: A+(B+C)=D", 0dh, 0ah, 0h
    eq2 db  "Equation 2: (A+C)-B=D", 0dh, 0ah, 0h
    arr1    db  "A: ", 0h
    arr2    db  "B: ", 0h
    arr3    db  "C: ", 0h
    arr4    db  "Equation 1: D = ", 0h
    arr5    db  "Equation 2: D = ", 0h

section .bss   ;Uninitialized memory reservations go here

section .text

global _start
_start:
  nop
    mov eax, 0h                         ;Zero out eax register

    push eq1
    call PrintString
    push eq2
    call PrintString
    call Printendl

    push arr1
    call PrintString
    mov al, [A]
    push DWORD eax
    call Print32bitNumHex
    call Printendl
    mov eax, 0h
    
    push arr2
    call PrintString
    mov ax, [B]
    push DWORD eax
    call Print32bitNumHex
    call Printendl
    mov eax, 0h

    push arr3
    call PrintString
    mov eax, [C]
    push DWORD eax
    call Print32bitNumHex
    call Printendl
    call Printendl
    mov eax, 0h
                                        ;End of print statements
    
    mov ax,     [B]                     ;Equation 1
    add eax,    [C]
    add al,     [A]
    mov [D],    eax

    push arr4
    call PrintString
    push DWORD [D]
    call Print32bitNumHex
    call Printendl
    mov eax, 0h

    mov al,     [A]                     ;Equation 2
    add eax,    [C]
    sub eax,     [B]
    mov [D],    eax

    push arr5
    call PrintString
    push DWORD [D]
    call Print32bitNumHex
    call Printendl
    mov eax, 0h
  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
