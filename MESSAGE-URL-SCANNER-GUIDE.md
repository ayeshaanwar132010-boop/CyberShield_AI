# Message & URL Scanner

The `scanner.html` page and `assets/js/scanner.js` provide local heuristic analysis
for pasted messages and URLs. They look for suspicious wording and common URL
patterns, then explain matched indicators. No links are opened and no live domain
reputation service is queried. Scores are indicators, not probabilities or proof
that a message is malicious or safe. Users should verify unexpected requests
through a separate trusted channel. Never paste passwords, one-time codes or
private information.
