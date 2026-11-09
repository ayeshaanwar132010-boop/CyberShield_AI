# Gmail Shield — CyberShield AI 2.2.8 (Windows desktop)

Gmail Shield now supports a native Windows desktop connection using Gmail IMAP over TLS and an SMTP authentication check. It does not use browser OAuth in the desktop app. Google may still require OAuth for accounts where App Passwords are unavailable; IMAP/SMTP does not bypass Google's authentication or security controls.

## First-time setup

1. In Gmail settings, enable IMAP if the setting is available for your account.
2. In your Google Account security settings, enable 2-Step Verification if required and create an App Password if Google offers that option for your account. Use the 16-character App Password, not your normal Google password. Some Workspace-managed accounts, Advanced Protection accounts, and other account configurations may not support App Passwords. In those cases, use an approved OAuth integration instead.
3. Open CyberShield AI → Gmail Shield, enter your `@gmail.com` address and App Password, and choose whether to save the connection on this PC.
4. CyberShield verifies IMAP and SMTP over TLS. It does not send email.

## Credential storage and reconnect

When “Save securely” is enabled, the email address and App Password are encrypted with Electron `safeStorage` and stored in the current Windows user's CyberShield application data folder. The password is not stored in browser local storage or source code. On app startup, CyberShield attempts to reconnect automatically. Disconnect removes the saved encrypted credential file. If Windows secure storage is unavailable, saving is refused.

## Inspection behavior

- Reads up to 30 latest messages from the INBOX using IMAP.
- Checks message text for common phishing indicators and attachment names/types.
- Attachment contents up to 15 MB are read into memory for the existing lightweight EICAR/test-signature and metadata checks; larger attachments are skipped. Files are not executed or uploaded to a third-party scanner.
- The optional inbox monitor polls about once per minute while the desktop app is open.
- Moving a message to Gmail Trash requires an explicit confirmation, unless the user deliberately enables the optional auto-quarantine rule.

## Important limitations

This is a heuristic review tool, not a full antivirus engine, malware reputation service, or pre-delivery mail filter. A low-risk result is not proof that a message or attachment is safe. Keep Gmail's protections and Microsoft Defender enabled. SMTP is verified to confirm account credentials but is not used to send messages.

This connection is for the Windows desktop application. The hosted/browser-only version does not expose IMAP credentials to page JavaScript and continues to require an appropriate Google-approved OAuth flow if Gmail integration is needed there.
