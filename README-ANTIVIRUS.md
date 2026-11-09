# CyberShield AI: Antivirus & PC Booster (v2.1)

Open the desktop app and click **Antivirus** (or press **Alt+9**).

## What each feature is (honest labels)

| Feature | Status | What it really does |
|---|---|---|
| Threat scanner (Quick / Full / Custom) | **REAL** + **HEURISTIC** | Hashes executables and files up to 4 MB (SHA-256) against the signature list, detects the EICAR test file, and applies rules: program disguised as a picture/document (MZ header), double extensions like `invoice.pdf.exe`, hidden right-to-left filename tricks, `autorun.inf`, packed/encrypted programs (high entropy), and dangerous script patterns (encoded PowerShell, download-and-run, shadow-copy deletion, turning off Defender). |
| Quarantine vault | **REAL** | Moves a file into the app's vault as an inactive `.quar` file. **Restore** puts it back; **Delete** removes it forever. Asks for confirmation each time. |
| Windows Defender bridge | **REAL ENGINE (Windows only)** | Shows Defender status, updates definitions, starts Defender quick/full scans through PowerShell (`Get-MpComputerStatus`, `Update-MpSignature`, `Start-MpScan`). Detection quality here is Microsoft's, not ours. |
| Junk cleaner | **REAL** | Deletes temp files (older than 24 h), crash dumps, and Chrome/Edge caches. Never touches Documents, Downloads, Desktop or Pictures. Files in use are skipped. |
| Startup programs | **REAL (Windows only)** | Lists Run-key entries. Current-user items can be disabled/re-enabled (a backup is kept). System-wide items are read-only. |
| PC health | **REAL** | CPU, RAM, disk free space, uptime. |
| Signature list | **LIMITED** | Only EICAR is built in. Import more SHA-256 hashes (one per line) with **Import hash list**. |

## Useful additions in 2.2.1
- **Broader signature coverage:** SHA-256 signature checks now include all files up to 4 MB, not just executables and very small files; larger files are hashed only when they look executable or when the scan mode explicitly requests it. This improves coverage while keeping routine scans bounded.
- **Exportable scan report:** export the latest scan's findings and caveats as a portable JSON report for troubleshooting or sharing with a technician. It includes local file paths, so review it before sharing.
- **Lower-overhead AI defaults:** the local Co-Pilot keeps Ollama warm for 10 minutes, limits output/context, and serializes generations so simultaneous prompts do not overwhelm a modest PC.
- **Safer decisions:** the report explicitly states that heuristic findings can be false positives and that a clean scan is not a guarantee.

## What it cannot do
- It is **not** a replacement for Microsoft Defender. Keep Defender on.
- It has no cloud lookup and no real-time (always-on) protection.
- Heuristic hits are *suspicious*, not proof. Quarantine is reversible for that reason.
- It cannot make hardware faster. Real gains come from freeing disk space and disabling unneeded startup programs, and from restarting.
- Windows system folders (`C:\Windows`, Program Files) are skipped by Quick/Full scans.

## Run it (Windows)
1. Install Node.js 18+.
2. Double-click `RUN-DESKTOP-DEV-WINDOWS.bat`, then open **Antivirus**.
3. Build the installer with `BUILD-DESKTOP-WINDOWS.bat` as before.
4. For junk in `C:\Windows\Temp`, start the app with "Run as administrator".

## Try it safely
Press **Create EICAR test file & scan it**. EICAR is the harmless industry-standard test file. Windows Defender may delete it instantly (that proves Defender works). The built-in scanner should then report it as `THREAT`.

## Security design
- The page never sends file paths to delete. Quarantine and cleaning work from IDs the app produced itself.
- Only the app's own local window may call these functions (origin check), and every destructive action shows a confirmation dialog.
- Windows commands run without a shell (argument arrays), so file names cannot inject commands.
- The EICAR string is assembled at runtime so no source file in this project is itself flagged.

## Tests
`npm test` runs 23 automated tests (engine, quarantine, cleaner, IPC safety).

**Verified here (Linux sandbox):** all 23 tests, plus a real-browser run of the page wired to the real engine (scan, quarantine, restore, junk clean, test file, web-mode banner, filename XSS check).

**NOT verified on a real Windows PC:** the Defender PowerShell bridge, startup registry changes, Task Manager button, Windows/Chrome/Edge cache paths, and the packaged installer. Please test these on your laptop; if one fails, send me the message shown.
