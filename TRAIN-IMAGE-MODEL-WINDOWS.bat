@echo off
setlocal
cd /d "%~dp0"
if not exist .venv py -3 -m venv .venv
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r training\requirements.txt
echo.
echo Dataset folders required:
echo data\image-authenticity\train\ai
echo data\image-authenticity\train\real
echo data\image-authenticity\val\ai
echo data\image-authenticity\val\real
echo.
echo Add your licensed, labeled image dataset, then run:
echo python training\train_image_authenticity.py --epochs 8
pause
