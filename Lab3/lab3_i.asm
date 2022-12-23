;-----------------------------
; Программа вывода сообщения
;-----------------------------

.386
.model flat, stdcall
option casemap: none

; Подключаем используемые библиотеки
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

; Сегмент данных
; -----------------
.data
string db "Hello World", 0Ah, 0h
sConsoleTitle db "My first project", 0

.data?
stdout dd ?
cWritten dd ?

; Код программы
; -------------------
.code
start:
; Заголовок консоли
    invoke SetConsoleTitle, offset sConsoleTitle
   

; Получаем дексриптор
    invoke GetStdHandle, STD_OUTPUT_HANDLE
    mov stdout, eax
    mov cWritten, ebx

; Выводим строку в консоль
    invoke WriteConsole, stdout, offset string, sizeof string, offset cWritten, NULL

; задержка (4)
    invoke Sleep, INFINITE
    
; завершаем процесс
    invoke ExitProcess, NULL

end start