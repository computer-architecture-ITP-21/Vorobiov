C:\masm32\bin\ml.exe /c /coff /Fl task1.asm
C:\masm32\bin\link.exe /SUBSYSTEM:WINDOWS  /LIBPATH:C:\masm32\lib\ task1.obj
pause
del task1.obj
