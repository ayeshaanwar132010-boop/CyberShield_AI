# CyberShield AI · Desktop & Web Edition

CyberShield AI is a local-first cybersecurity learning and utility application. It combines an educational rule-based scanner, a Windows desktop integration layer, an optional local AI Co-Pilot, a 3D learning arena, security mini-games and **Cyber Runner 2077**, an original neon endless-runner arcade game.

## Run the project

### Windows desktop app

1. Install Node.js 18 or newer.
2. Extract the ZIP to a normal writable folder.
3. Double-click `RUN-DESKTOP-DEV-WINDOWS.bat`, or run `npm install` followed by `npm start` in PowerShell.
4. The desktop app opens a local-only server and loads the UI.

For a distributable Windows installer and portable build, run `BUILD-DESKTOP-WINDOWS.bat`. Build and test the installer on Windows.

### Static website

You can deploy the static pages to Netlify. Upload the extracted project folder containing `index.html`, `netlify.toml` and `assets/`. The hosted static site does **not** gain access to Windows antivirus APIs or your local Ollama installation.

### Optional local AI Co-Pilot

Install Ollama, then run `ollama pull qwen2.5:3b`. Follow `README-AI-MODEL.md` and `README-DESKTOP.md` for the local AI options. If Ollama is stopped or the model is unavailable, the AI feature reports that it is offline rather than pretending to answer.

## Main areas

- **Dashboard:** overview and navigation to security tools.
- **Scanner:** educational heuristic indicators for text and URLs.
- **Antivirus:** desktop-only scan, quarantine and supported Windows security integrations.
- **AI Co-Pilot:** local Ollama-backed security-awareness assistant when configured.
- **3D Arena:** interactive learning environment.
- **Games:** phishing, URL and signal-recognition exercises.
- **Cyber Runner 2077:** standalone Canvas-based endless runner with lane changes, jumps, slides, collectible data shards, pause/resume, touch controls and a locally saved best score.
- **Courses and profile:** learning material and local progress. The Courses page includes curated video-reference searches, a five-question knowledge check, and a printable/downloadable educational certificate when the learner scores at least 80%. Certificate progress is stored locally in the browser; the certificate is non-accredited and is not a professional qualification.

## Engineering quality gates

Run these before changing or packaging the project:

```bash
npm install
npm run check
npm test
```

See [ARCHITECTURE.md](ARCHITECTURE.md), [SECURITY.md](SECURITY.md) and [CONTRIBUTING.md](CONTRIBUTING.md) for system boundaries, safety assumptions and development workflow.

## Honest feature status

- The browser scanner uses transparent heuristic rules. It is not an ML classifier or live threat-intelligence service.
- Windows antivirus features are available only in the desktop build and only for operations supported by the current OS and permissions.
- The AI Co-Pilot depends on a reachable configured backend and a locally installed model.
- The Cyber Runner game is a self-contained local browser game and does not send gameplay telemetry.
- Any demo/illustrative content should not be represented as live security telemetry.

## Troubleshooting

- **AI offline:** start Ollama and confirm the selected model is installed.
- **3D Arena blank:** check WebGL support and whether the local Three.js asset is available.
- **Windows security action unavailable:** run on a supported Windows version and review permissions; unsupported operations should fail clearly.
- **Website works but antivirus does not:** expected on static hosting; Windows integrations require the desktop main process.
