# CyberShield AI — local AI model setup

## Important: model weights are downloaded separately
This ZIP contains the app and its Ollama integration, not multi-gigabyte model weights. The setup script downloads the default `qwen2.5:3b` model into Ollama on your PC. Internet access and sufficient free disk space are required for the first download.

## Windows setup
1. Install Python 3.10+ and Ollama from https://ollama.com/download/windows.
2. Double-click `SETUP-AI-MODEL-WINDOWS.bat` and wait for `qwen2.5:3b` to finish downloading.
3. Double-click `START-AI-BACKEND-WINDOWS.bat` and leave that window open.
4. In a second window, double-click `START-WEBSITE-WINDOWS.bat` and leave it open.
5. Visit `http://127.0.0.1:8080/arena.html`.
6. In AI Co-Pilot, choose an installed model from **Local Model Library**. Ask a question to test it.

The 3D Arena uses Three.js from a CDN, so its first load requires internet access. The AI model runs locally through Ollama. The Arena's model selector only lists models Ollama reports as installed.

## Troubleshooting
- Check `http://127.0.0.1:8000/health` for backend status.
- Check `http://127.0.0.1:8000/api/models` for the installed model list.
- If Ollama is running but the model list is empty, run `ollama pull qwen2.5:3b` in PowerShell.
- If the site uses a different port, update `ALLOWED_ORIGINS` in `backend/.env` to match the site's origin and restart the backend.
- A model response can take longer on PCs with limited RAM/CPU. This is a local inference app, not a newly trained model.
