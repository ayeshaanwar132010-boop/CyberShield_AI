@echo off
setlocal
cd /d "%~dp0"
py -3 -m venv .venv-message-url
if errorlevel 1 goto error
call .venv-message-url\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r training\message_url_requirements.txt
python training\train_message_url.py
if errorlevel 1 goto error
echo.
echo Training complete. Models and metrics are in models\message-url.
echo NOTE: Bundled data is synthetic demonstration data, not a real-world dataset.
pause
exit /b 0
:error
echo Training could not complete. Check Python installation and error messages above.
pause
exit /b 1
