@echo off
cd /d "%~dp0backend"
if not exist .env copy .env.example .env
if not exist .venv py -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install -r requirements.txt
echo If needed, run in another terminal: ollama pull qwen2.5:3b
uvicorn main:app --host 127.0.0.1 --port 8000
pause
