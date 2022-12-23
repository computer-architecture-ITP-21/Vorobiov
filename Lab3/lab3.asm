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
    push offset sConsoleTitle
    call SetConsoleTitle

; Получаем дексриптор
    push STD_OUTPUT_HANDLE
    call GetStdHandle
    mov stdout, eax
    mov cWritten, ebx

; Выводим строку в консоль
    push NULL
    push offset cWritten
    push sizeof string
    push offset string
    push stdout
    call WriteConsole

; задержка (4)
    push INFINITE
    call Sleep
    
; завершаем процесс
    push NULL
    call ExitProcess
end start