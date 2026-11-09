# CyberShield AI — Command Center Redesign

This package is a redesign of the existing CyberShield AI Desktop App 2.2.2 source.

## What changed
- Reorganized navigation into five primary areas: Home, Security Center, Investigation Lab, SENTRY Robotics, and Learn & Tools.
- Added a reusable premium command-center visual layer with restrained emerald/cyan accents, cleaner cards, better spacing, responsive navigation, and purposeful hover/transition states.
- Added quick-access command panels to the main Security Center, Investigation Lab, Learn & Tools, and SENTRY Robotics routes.
- Preserved the existing application pages, scripts, backend, Electron shell, Antivirus implementation, Gmail Shield, scanner, games, Cyber Runner, profile, and other tools.
- Kept the existing local-first / honest-result messaging; no new paid APIs or fake live security feeds were introduced.

## Verification performed
- Node syntax checks passed for the Electron and JavaScript source files covered by the existing `check` script.
- Existing automated test suite: **27 passed, 0 failed**.
- Internal script/stylesheet reference test passed as part of the suite.

## Important limitation
The Windows Electron build was not produced in this environment because the dependency installation required for `electron-builder` was not available here. The source package preserves the original Windows build scripts and package configuration. The 27 automated tests passed.

## Run on Windows
Use the original project instructions and scripts, for example:

- `npm install`
- `npm start`
- or `RUN-DESKTOP-DEV-WINDOWS.bat`

For a distributable Windows package, use the existing `BUILD-DESKTOP-WINDOWS.bat` / `npm run dist` workflow after dependencies are installed.
