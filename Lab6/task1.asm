
.686
.model flat, stdcall
option casemap: none
; ���������� � ������������ ����� �������
;--------------------------------------------
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc
include C:\masm32\include\fpu.inc
; �������� �������� ������� FpuFLtoA
includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\fpu.lib
; ������� �����
;--------------------------------------------
.data ; ������������������ ������
MsgBoxTitle byte "�������� � ������������ x87", 0
; ��������� ����
MsgBoxText db "Yn = 4 * x / (x + 5) (� ���������� �� 3 � ����� 1,25", 13, 13,
"y1="
res1 db 14 DUP(0), 10, 13 ; ��������������� 14 ���� ��� �������
; ���������� � ��������� ���� 0
db "y2="
res2 db 14 DUP(0), 10, 13
db "y3="
res3 db 14 DUP(0), 10, 13
db "y4="
res4 db 14 DUP(0), 10, 13
db "y5="
res5 db 14 DUP(0), 10, 13
db "y6="
res6 db 14 DUP(0), 10, 13
CrLf equ 0A0Dh
y1 dt 0.0 ; ��� 80 ��� ��� ����� (TBYTE = dt)
y2 dt 0.0
y3 dt 0.0
y4 dt 0.0
y5 dt 0.0
y6 dt 0.0
val dd 0.0
zero dd 0.0
buf dd 0.0
x dd 3.0 ; ��� 32 ���� ��� ����� (DWORD = dd)
op1 dd 4
op2 dd 5
step dd 1.25
.data? ; �������������������� ������
.const ; ���������
; C������ ����
.code
start: 

finit
mov ecx, 4 
fld x

metka: 

fld x
fadd op2

fld x
fadd step
fstp x

loop metka 

fstp y4
fstp y3
fstp y2
fstp y1 

invoke FpuFLtoA, addr y1, 10, addr res1, SRC1_REAL or SRC2_DIMM
mov word ptr res1 + 14, CrLf
invoke FpuFLtoA, addr y2, 10, addr res2, SRC1_REAL or SRC2_DIMM
mov word ptr res2 + 14, CrLf
invoke FpuFLtoA, addr y3, 10, addr res3, SRC1_REAL or SRC2_DIMM
mov word ptr res3 + 14, CrLf
invoke FpuFLtoA, addr y4, 10, addr res4, SRC1_REAL or SRC2_DIMM
mov word ptr res4 + 14, CrLf

; ����� ����������� ����������
invoke MessageBox, NULL, addr MsgBoxText, addr MsgBoxTitle,
MB_ICONINFORMATION
invoke ExitProcess, NULL ; ������� ���������� � ���������� NULL
end start
