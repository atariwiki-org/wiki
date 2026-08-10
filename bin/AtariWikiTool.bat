@echo off
setlocal
cd /D "%~dp0"
cd ..

java -jar bin/AtariWikiTool.jar --check --fix .
