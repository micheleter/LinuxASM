; Program Description: [Insert Description Here]
; Author: Michel Eter
; Creation Date: [Insert Creation Date]
; Revisions: [Insert Any Revisions]
; Date:              Modified by: Michel Eter
; Operating System: Mint Linux
; IDE/Compiler: Geany

%include "./functions.inc"

bits 32
section .data  ;Initialized data definitions go here
    A   db  2
    B   dw  3
    C   dd  4
    D   dd  0h
    eq1 db  "A+(B+C)=D", 0dh, 0ah, 0h
    eq2 db  "(A+C)-B=D", 0dh, 0ah, 0h

section .bss   ;Uninitialized memory reservations go here

section .text

global _start
_start:
  nop
  ;Code starts here
    push eq1
    call PrintString
    push eq2
    call PrintString
    call Printendl
    
    push A
    call Print32bitNumDecimal
    call Printendl
    mov eax, 0h

    mov ax, [B]
    add eax, [C]
    add al, [A]
    mov [D], eax

    call PrintRegisters

    mov eax, 0

    mov al, [A]
    add eax, [C]
    sub ax, [B]
    mov [D], eax

    call PrintRegisters
  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
