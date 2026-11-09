# Development Guide

## Setup

- Node.js 18 or newer
- Windows is required for validating the Windows-specific desktop integrations and building the Windows installer
- Python 3.10+ is needed only for the optional FastAPI backend
- Ollama and a model are needed only for local AI chat

```powershell
npm install
npm run check
npm test
npm start
```

## Working on the UI

- Keep shared navigation and visual tokens consistent across pages.
- Put feature-specific styling in a dedicated stylesheet when the feature has substantial layout or interaction complexity.
- Prefer semantic buttons and links, visible keyboard focus, useful empty/error states, and reduced-motion support.
- Do not use placeholder numbers as if they were live device or threat telemetry.

## Before submitting changes

1. Run `npm run check` and `npm test`.
2. Test the affected page at desktop and narrow viewport widths.
3. Check keyboard-only navigation and reduced-motion mode.
4. Verify both the browser experience and desktop integration if the change touches IPC or Windows functionality.
5. Update `README.md` and `ARCHITECTURE.md` if runtime behavior or system boundaries change.
