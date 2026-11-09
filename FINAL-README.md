# CyberShield AI — Final Command Center Source Package

This is a source package for the existing CyberShield AI desktop/web project. It is not a prebuilt Windows installer.

## New in this version
- **SENTRY Robotics (`sentry.html`)**: working grid-based robot simulation with manual controls, keyboard controls, obstacle blocking, live telemetry, route planning with breadth-first search, score, reset, and a simulated unsafe-command response.
- **Automation Center (`automation.html`)**: configurable local rules for incident creation, report-draft generation, and SENTRY safe-mode events; threshold setting; test events; local event log; JSON export.
- SENTRY simulated events are recorded in the same browser-local automation log shown in Automation Center.
- Added navigation and home-page links while preserving the existing antivirus, Gmail Shield, scanner, investigation dashboard, games, Cyber Runner, profile, learning pages, backend, and Electron shell.

## Honest capability labels
- SENTRY is a **simulation**, not a physical robot connection.
- Automation rules run on locally generated test events. They do not monitor the operating system or live network traffic by themselves.
- Risk indicators are educational and are not proof of malicious activity.
- Report drafts require human review. No official report is automatically submitted.
- No new paid APIs or API keys are required for the new features.

## Run on Windows
1. Extract the ZIP.
2. Install Node.js (LTS) if it is not already installed.
3. Open the extracted project folder in a terminal and run `npm install`.
4. Run `npm start` for the Electron desktop app, or `npm run serve` for the local web server.
5. For a Windows installer, run `npm run dist` after dependencies are installed.

The original scripts and package configuration are retained. The new `sentry.html` and `automation.html` pages can also be opened through the local web server.


## Final exhibition polish (26 Oct 2026)
- Updated the visual palette to midnight indigo with aqua/cyan accents, including clearer keyboard focus and mobile navigation closing behavior.
- Scanner now gives risk-based safe-handling guidance; high-risk pasted samples can be quarantined inside this browser and a local incident draft can be created.
- Added a privacy-first reporting checklist covering timestamps, redacted message evidence, suspicious URLs, relevant sender details, cropped screenshots, and what not to share.
- Safety limitation: this website cannot monitor other mobile apps or automatically delete incoming messages from SMS/WhatsApp/email. Actual system-wide filtering requires OS/provider permissions and platform-specific integration; this package does not claim that capability.
