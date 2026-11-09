## 2.3.0 — PKCERT assisted reporting
- Added local incident report builder and official PKCERT form link in Automation Center.
- No automatic external submission; user reviews and submits manually.

# Changelog

## 2.2.0 — Engineering cleanup and Cyber Runner

- Added Cyber Runner 2077, a self-contained Canvas endless runner with keyboard, touch and on-screen controls.
- Added a dedicated game stylesheet and controller instead of adding game behavior to a shared catch-all script.
- Linked the game from the Games page, shared navigation and Electron's Go menu.
- Extracted profile rendering and import/export behavior from inline JavaScript into a dedicated module.
- Rendered imported profile fields with DOM text nodes rather than interpolating imported values into HTML.
- Added bounded profile import validation, local-only game score storage and project integration tests.
- Added architecture, security and contribution documentation, plus a `.gitignore`.
- Standardized navigation across HTML routes and repaired malformed markup in the Games and Profile pages.
- Updated the service-worker cache version so existing installs do not keep serving the old asset cache.


## 2.2.1 — focused quality and performance update
- Added JSON export for the latest antivirus scan report, including findings, timestamps, risk scores, and clear limitations.
- Tuned local Ollama generation for shorter, faster answers with bounded context/output and a warm model window.
- Serialized local AI generations to reduce resource contention on lower-memory PCs.
- Preserved the existing 3D Arena, Cyber Runner, and game pages.

## 2.2.2 — Gmail Shield
- Added optional Gmail attachment risk review with Google OAuth.
- Added explainable risky-extension/MIME/EICAR checks and explicit confirmation before moving email to Trash.
- Kept existing 3D Arena and games intact.
- Added Google OAuth setup and limitation documentation.

## 2.2.6 — SENTRY Robotics AI Companion
- Added a SENTRY AI companion to the robotics simulation, using the configured local Ollama-backed `/health`, `/api/models`, and `/api/chat` endpoints.
- Added one-click prompts for telemetry explanation, safe route strategy, and beginner robotics learning.
- Added a clearly labeled simulated sensor lab with recalibration and a safe-patrol explainer.
- AI suggestions are advisory only and never directly control robot movement; the page clearly states no physical robot is connected.
