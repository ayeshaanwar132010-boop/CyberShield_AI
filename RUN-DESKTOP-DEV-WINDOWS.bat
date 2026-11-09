@echo off
cd /d "%~dp0"
where node >nul 2>nul || (echo Install Node.js 18+ from https://nodejs.org then run this again. & pause & exit /b 1)
call npm install
call npm start
pause
