# CyberShield AI desktop app (Windows)

## Requirements
- Node.js 18+ (https://nodejs.org) to run or build the app
- Ollama (https://ollama.com/download/windows) for the AI Co-Pilot; the app can download `qwen2.5:3b` for you

## Run (development)
Double-click `RUN-DESKTOP-DEV-WINDOWS.bat`. First run installs Electron (internet needed).

## Build the installer
Double-click `BUILD-DESKTOP-WINDOWS.bat`. Output in `dist/`: an NSIS installer and a portable `.exe`.
Three.js is bundled locally during the build, so the Arena works offline. The AI model is NOT bundled (multi-GB); Ollama holds it.

## What the app does
1. Starts a local server on 127.0.0.1:8787 (falls back to a free port) that serves the site and the AI API.
2. Opens the site in its own window; external links open in your browser.
3. On launch, checks Ollama and offers to download the model if none is installed (progress on the taskbar icon). Menu: AI > Download model.

## Troubleshooting
- "backend offline" in the Co-Pilot: Ollama is not running. Open the Ollama app, then press refresh.
- Empty model list: run `ollama pull qwen2.5:3b`.
- Blank Arena: GPU/WebGL disabled; update graphics drivers.
- Windows SmartScreen may warn about an unsigned app; code signing is not set up.

## New in 1.1
- Games page (5 games), XP, levels, daily streak and achievements, all saved on this PC. The Profile page can export/import progress.
- Alt+1 to Alt+8 switch pages. The site is also an installable web app (manifest + offline cache).
- No custom icon yet: add `build/icon.ico` (256x256) and set `build.win.icon` before shipping.


## Merged 2.0 features
This build combines the original AI/Desktop project with the v3 feature layer.

- Local AI Co-Pilot via Ollama (kept from the original project)
- Message + URL risk scanner with saved local history
- 3D cybersecurity Arena
- Security courses, field guide and quiz
- Phish or Legit, Link Detective, Signal Match and Password Forge games
- XP, levels, daily streaks and achievements
- Local player profile with progress export/import/reset
- **New Security Dashboard** with a five-part defense-readiness checklist
- **New scan-history export/clear controls** on the dashboard
- Futuristic bioluminescent UI, animated effects and offline/PWA support
- Desktop keyboard shortcuts: Alt+1 through Alt+8 for the main pages
- Windows NSIS installer and portable build targets

All progress, checklist data and scan history are stored locally in the browser/app profile unless a user explicitly sends a question to the local AI service.


## New in 2.1: Antivirus & PC Booster
Virus scanner, quarantine vault, Windows Defender bridge, junk cleaner, startup manager and PC health. See `README-ANTIVIRUS.md` for what is real, what is limited, and what still needs testing on Windows.


## Gmail Shield (v2.2.2)
See `README-GMAIL-SHIELD.md` for Google OAuth setup and limitations. Gmail Shield scans recent attachment metadata/content in memory and asks before moving a flagged email to Gmail Trash. A Google OAuth client ID and Gmail API enablement are required.
