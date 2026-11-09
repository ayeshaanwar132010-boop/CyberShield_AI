@echo off
setlocal
cd /d "%~dp0"
echo ==============================================
echo CyberShield AI - Local Model Setup
echo ==============================================
where ollama >nul 2>nul
if errorlevel 1 (
  echo Ollama is not installed or is not on PATH.
  echo Install Ollama from https://ollama.com/download/windows
  echo Then close and reopen this window and run this file again.
  pause
  exit /b 1
)
echo Checking Ollama service...
curl -fsS http://127.0.0.1:11434/api/tags >nul 2>nul
if errorlevel 1 (
  echo Starting Ollama service in a new window...
  start "Ollama Server" cmd /k "ollama serve"
  timeout /t 5 /nobreak >nul
)
curl -fsS http://127.0.0.1:11434/api/tags >nul 2>nul
if errorlevel 1 (
  echo Could not reach Ollama at http://127.0.0.1:11434.
  echo Open the Ollama app and run this setup file again.
  pause
  exit /b 1
)
echo Downloading default model qwen2.5:3b. This may take a while...
ollama pull qwen2.5:3b
if errorlevel 1 (
  echo Model download failed. Check your internet connection and disk space.
  pause
  exit /b 1
)
echo.
echo Model installed. Start START-AI-BACKEND-WINDOWS.bat and START-WEBSITE-WINDOWS.bat.
echo Then open http://127.0.0.1:8080/arena.html
echo Keep both terminal windows open while using the app.
pause
