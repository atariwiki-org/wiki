@echo off
setlocal
cd /D "%~dp0"
cd ..
if not exist results mkdir results
set RESULT=results\CheckResult
if exist %RESULT%.md del %RESULT%.md
markdown-checker.exe . -f check_broken_paths -o %RESULT% 2>%RESULT%.log

if exist  %RESULT%.md dir %RESULT%.md
