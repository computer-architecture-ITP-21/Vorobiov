C:\masm32\bin\ml.exe /c /coff /Fl lab3_i.asm
C:\masm32\bin\link.exe /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib\ lab3_i.obj
pause
del lab3_i.obj
start lab3_i.exe
