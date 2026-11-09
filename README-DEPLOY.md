# CyberShield AI updated package

## Local run
1. Install Python 3.10+ and Ollama from https://ollama.com/.
2. Run `ollama pull qwen2.5:3b` in PowerShell. This downloads the local model; it is not bundled in the ZIP. You can install other Ollama models and choose them from the Arena's Model Library.
3. Double-click `START-AI-BACKEND-WINDOWS.bat` and leave it running.
4. Double-click `START-WEBSITE-WINDOWS.bat` in a second window.
5. Visit http://127.0.0.1:8080 and open 3D Arena. Keep both terminal windows running. If the 3D scene is blank, check that your browser allows WebGL and that the Three.js CDN can load. Health: http://127.0.0.1:8000/health. API docs: http://127.0.0.1:8000/docs.

## Netlify

The static site includes the browser-based Cyber Runner game and security-learning mini-games. Windows antivirus integrations and local Ollama remain desktop/local-backend features and are not provided by Netlify.

Upload the extracted folder containing `index.html`, `netlify.toml`, and `assets` to Netlify Drop. Remove the placeholder local API URL in `assets/js/deploy-config.js` and set it to your deployed HTTPS backend URL for online AI. Configure backend `ALLOWED_ORIGINS` with your exact Netlify site origin.

## Important cloud note
Netlify only hosts the static website; it does not run Ollama. A remote backend needs a real, reachable Ollama server. `127.0.0.1` in a cloud server points to that server itself, not your home PC. Do not expose Ollama port 11434 publicly. Add authentication/rate limiting before making the API public.

The scanner is a small educational heuristic, not trained ML or live threat intelligence. Low risk scores do not guarantee safety.

## Model library and network restore mission
- The Arena's Model Library lists models installed in Ollama (`ollama list`). Select one before asking the AI Co-Pilot.
- To restore the simulated network, collect all five green data cores, then return to the central console and press E. WASD/arrow keys move; Space jumps. Touch controls are also available on mobile.
- The AI model runs locally through Ollama and FastAPI. The website itself does not contain model weights.
