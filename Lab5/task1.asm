.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
a dw 10
b dw 3
x dw -15
d dw ?

.code
start:
    mov cx, 0
    mov ax, 0
   
    mov cx, b       ; bx = 5
    sub cx, 5       ; b - 5
    
    imul cx, 5       ; 5 * (b - 5)

    mov ax, a
    imul ax, x       ; a * x
    imul ax, 3       ; 3 * a * x

    idiv cx     ; a * 3 * x / (5 * (b - 5))

    mov d, ax

    push NULL
    call ExitProcess
end start