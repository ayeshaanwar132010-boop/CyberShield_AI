# Architecture Overview

## System boundaries

CyberShield AI is a local-first desktop application with a static web interface. It has three execution contexts that must not be conflated:

1. **Renderer / web UI** — HTML, CSS and browser JavaScript. It presents pages, educational rule-based checks, the 3D arena and games. It must not access Node APIs directly.
2. **Electron main process** — owns the application window, local HTTP server, operating-system integrations and antivirus IPC handlers. It exposes only explicit operations through the preload bridge.
3. **Local AI service** — the Python FastAPI service or desktop Node service forwards Co-Pilot requests to Ollama on the same machine. Model weights are installed separately and are not shipped in this archive.

## Request flow

```text
Browser UI
   ├── static pages / Canvas games / educational scanner
   ├── desktop-only calls → contextBridge → validated IPC → Windows helpers
   └── Co-Pilot requests → local API → Ollama on 127.0.0.1
```

Netlify hosts the static frontend only. It does not run the desktop antivirus engine, Windows integrations, or a local Ollama model. A remotely hosted API is a separate deployment and must have authentication, strict origin controls, rate limits, and a deliberate data-retention policy before public exposure.

## Key directories

- `assets/css/` — shared tokens and component styling; feature-specific styles are isolated by page.
- `assets/js/` — browser features; each page loads only the modules it needs.
- `electron/` — desktop lifecycle, preload bridge, local server and Windows security integrations.
- `backend/` — optional FastAPI-to-Ollama service.
- `test/` — Node test suite for scanning, IPC safety and project integration checks.

## Engineering conventions

- Prefer small feature modules over expanding a single all-purpose script.
- Treat browser input as untrusted; validate again at the process/API boundary.
- Keep security findings explainable and distinguish heuristic indicators from confirmed detections.
- Do not report a destructive action as complete until the backend confirms it.
- Keep data local by default and make any external lookup or upload explicit.
- Respect reduced-motion preferences, keyboard access and narrow viewports.
- Update the service-worker cache version when shipping changed static assets.

## Local verification

```bash
npm install
npm run check
npm test
```

The desktop build itself should be run on Windows for final packaging and Windows-specific verification.
