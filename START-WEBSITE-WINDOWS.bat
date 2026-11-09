@echo off
cd /d "%~dp0"
echo Website: http://127.0.0.1:8080
py -m http.server 8080
pause
