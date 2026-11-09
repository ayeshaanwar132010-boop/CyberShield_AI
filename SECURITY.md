# Security Notes

## Scope and claims

CyberShield's browser scanner uses transparent heuristic rules. It is an educational indicator, not a replacement for Microsoft Defender or a commercial antivirus engine. A low score does not establish that a file, message or URL is safe. The desktop scanner's built-in signatures and file heuristics are limited; use current operating-system protection for real-world defense.

## Data handling

- The Cyber Runner game stores only a local high score in browser storage.
- The game does not transmit scores, identifiers or gameplay events.
- The local AI Co-Pilot sends prompts to the configured local Ollama instance through the local API.
- Never enter passwords, one-time codes, payment details or confidential material into a chat prompt.
- External contact-form services and optional threat-intelligence services have separate data handling and should be reviewed before use.

## Deployment boundary

Do not expose Ollama's default port (`11434`) directly to the internet. Do not deploy the sample AI backend publicly without authentication, origin restrictions, rate limiting, request limits, monitoring and a clear privacy policy. `127.0.0.1` refers to the machine running the service, not the visitor's computer when the frontend is hosted remotely.

## Desktop hardening

The Electron window uses context isolation, disabled Node integration and a sandboxed renderer. Keep operating-system actions behind narrowly scoped IPC methods and validate identifiers/arguments in the main process. Do not accept arbitrary file paths from renderer code for privileged operations.

## Reporting an issue

For a security issue, provide a minimal reproduction and the affected version to the project maintainer privately. Do not include real credentials, private files or personal data in bug reports.
