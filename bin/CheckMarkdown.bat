@echo off
setlocal
cd /D "%~dp0"
cd ..
set RESULT=CheckResult
if exist %RESULT%.md del %RESULT%.md
markdown-checker.exe . -f check_broken_paths -o %RESULT%
dir %RESULT%.md
