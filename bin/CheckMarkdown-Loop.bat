setlocal
cd /D "%~dp0"

:loop
call CheckMarkdown.bat
pause
goto :loop

