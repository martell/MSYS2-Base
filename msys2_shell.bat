@echo off

rem ember value of GOTO: is used to know recursion has happened.
if "%1" == "GOTO:" goto %2

if NOT "x%WD%" == "x" set WD=

rem ember command.com only uses the first eight characters of the label.
goto _WindowsNT

start /min %COMSPEC% /e:4096 /c %0 GOTO: _Resume %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
goto EOF

rem ember that we execute here if we recursed.
:_Resume
for %%F in (1 2 3) do shift
if NOT EXIST %WD%msys-2.0.dll set WD=.\bin\

rem ember that we get here even in command.com.
:_WindowsNT

if NOT EXIST %WD%msys-2.0.dll set WD=%~dp0\bin\

set MSYSCON=mintty.exe

goto startmintty

:startmintty
if "%1" == "MINGW" set MSYSTEM=MINGW
if "%1" == "MSYS" set MSYSTEM=MSYS
start %WD%mintty -i /msys.ico -
exit

:EOF