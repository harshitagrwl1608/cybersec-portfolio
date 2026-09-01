# OWASP Top 10 — Study Notes
 
Notes on core OWASP Top 10 vulnerability categories, covering both the
classic web application risks and how each one is starting to show up in
AI/LLM-integrated systems.
 
## Contents
- [Fundamentals — IAAA](00-fundamentals-iaaa.md)
- [A01 — Broken Access Control](A01-broken-access-control.md) (includes Cookie Tampering, Privilege Escalation)
- [IDOR — Insecure Direct Object Reference](idor.md) (includes encoded/hashed IDs, unpredictable UUIDs)
- [Business Logic Flaws](business-logic-flaws.md)
- [A02 — Security Misconfiguration](A02-security-misconfiguration.md)
- [A03 — Software Supply Chain Failures](A03-software-supply-chain-failures.md)
- [A04 — Cryptographic Failures](A04-cryptographic-failures.md)
- [A05 — Injection](A05-injection.md) (includes AI Prompt Injection)
- [A06 — Insecure Design](A06-insecure-design.md)
- [A07 — Authentication Failures](A07-authentication-failures.md) (includes username enumeration, ffuf brute-forcing)
- [A08 — Software or Data Integrity Failures](A08-software-data-integrity-failures.md)
- [A09 — Logging & Alerting Failures](A09-logging-alerting-failures.md)
 
## Note on transparency
Some of the practical exercises tied to these notes involved writing small
Python automation scripts (for exploit chaining / repeated testing). I
don't have strong Python scripting skills yet, so I used AI assistance to
write those specific scripts while focusing my own effort on understanding
the underlying vulnerability logic and OWASP concepts being demonstrated —
noting this here for transparency rather than presenting the scripts as
fully my own work.
 
A10 (SSRF) is not from my own notes — I hadn't covered that category yet,
so that file was generated for completeness and should be replaced with my
own notes once I actually study it.
