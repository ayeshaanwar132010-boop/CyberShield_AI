# CyberShield AI 2.2.7 — Navigation & UI refinement

Changes in this package:
- Promoted Cyber Robo Simulator and Cyber Defense Simulator to the first prominent navigation entries after Home.
- Added a dedicated Security Reports page (`reports.html`) linking to actual module histories and review workflows; it does not invent live metrics.
- Renamed “All tools” to “Other Tools” and restyled it as a foreground, vertically stacked, scrollable dropdown with a high stacking order.
- Removed the home-page sample metric strip and illustrative testimonial carousel to reduce clutter and avoid sample content looking like live customer evidence.
- Refined the brand mark presentation: transparent header treatment, larger contained logo, and subtle red glow.
- Unified navigation and dropdown styling across existing HTML pages.
- Added matching Electron Go-menu shortcuts for both simulators and Security Reports.
- Kept the existing simulator pages, scanner, AI, quarantine and other existing modules in place. IP Intelligence remains out of navigation.

Validation:
- `npm run check` passed.
- `npm test` passed: 27/27 tests.
- This is a source ZIP. Build the Windows installer/portable EXE on Windows using the project’s `npm run dist` command.
