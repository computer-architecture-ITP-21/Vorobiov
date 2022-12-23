.386
.model flat, stdcall
option casemap: none

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
Decc dw 65
Negg dw -160
Bin1 dd 1000111011b
Bin2 dd 1011110000b
Hex dd 0ad456c4h
text db 'Good bye, America'
array dw 5 dup(256, 765, 89, 654, 9)
Bin3 dd ?

.code
start:
    mov EAX, 0
    xor EAX, EBX

    mov EAX, Bin1
    add EAX, Bin2
    mov Bin3, EAX

    push Decc
    push Negg

    pop Negg
    pop Decc
    
    push NULL
    call ExitProcess
end start