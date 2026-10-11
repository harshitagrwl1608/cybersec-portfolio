# Web Security

## Current OWASP note
The repository writeups use a mixture of OWASP naming from different editions. The current **[OWASP Top 10:2025](https://top10.owasp.org/2025/en/)** keeps A01 Broken Access Control and rolls SSRF into A01; current A10 is **Mishandling of Exceptional Conditions**.

Keep the existing writeups intact for learning history, but do not label their SSRF material as current OWASP A10.

## OWASP Top 10:2025
A01 Broken Access Control  
A02 Security Misconfiguration  
A03 Software Supply Chain Failures  
A04 Cryptographic Failures  
A05 Injection  
A06 Insecure Design  
A07 Authentication Failures  
A08 Software or Data Integrity Failures  
A09 Security Logging & Alerting Failures  
A10 Mishandling of Exceptional Conditions

## High-value attack differences
| Attack | Core idea |
|---|---|
| SQLi | Input changes SQL behavior |
| XSS | Script executes in victim browser |
| CSRF | Victim browser performs unwanted state-changing action |
| IDOR/BOLA | Object access lacks server-side authorization |
| SSRF | Server makes attacker-influenced outbound request |
| Directory traversal | Input reaches unintended filesystem path |

## Application security quick checks
- **Validate + normalize** input server-side; allowlist expected formats where practical. Validation does not replace parameterized queries or output encoding.
- **SQLi:** parameterized queries/prepared statements.
- **XSS:** context-aware output encoding; CSP is a defense layer, not a substitute.
- **Session cookies:** `Secure` (HTTPS only), `HttpOnly` (not readable by ordinary page JavaScript), `SameSite` (limits cross-site sending); use unpredictable session IDs and invalidate/regenerate them appropriately.
- **SAST:** analyzes code without executing the application. **DAST:** tests a running application. **Fuzzing:** sends unusual inputs to discover crashes and edge cases.
- **Dependency/SCA checks:** identify vulnerable or risky packages; keep dependency inventory and updates under control.
- **Code signing:** helps validate signer/integrity, but a valid signature does not prove software is benign.
- **Sandboxing:** limits app access/impact; it is not an absolute security boundary.

## Practical testing cues
**ffuf:** fuzz paths, parameters, or form inputs; interpret response status/size/content carefully.  
**Burp Suite:** inspect/replay HTTP requests; useful for authorization and request-manipulation testing.  
**Browser DevTools:** Network tab exposes API/background requests and request parameters.

## Defenses
- CSRF tokens + SameSite cookies + origin checks → CSRF.
- Server-side authorization on every object → IDOR/BOLA.
- Restrict outbound server access + validate/canonicalize destinations → SSRF.
- Normalize/validate paths + enforce an allowed root → traversal.
- Add secure design, peer review, tests, logging and runtime monitoring throughout the SDLC.

**Never rely on client-side authorization.**