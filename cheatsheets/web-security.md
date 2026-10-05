# Web Security

## OWASP Top 10 essentials
A01 Broken Access Control  
A02 Security Misconfiguration  
A03 Software Supply Chain Failures  
A04 Cryptographic Failures  
A05 Injection  
A06 Insecure Design  
A07 Authentication Failures  
A08 Software/Data Integrity Failures  
A09 Logging & Monitoring Failures  
A10 Server-Side Request Forgery (SSRF)

## Attack differences
| Attack | Core idea |
|---|---|
| SQLi | Input alters SQL query |
| XSS | Script executes in victim browser |
| CSRF | Authenticated browser performs unwanted action |
| IDOR/BOLA | Object accessed without authorization |
| SSRF | Server is tricked into making attacker-chosen requests |
| Directory traversal | Escape intended path to access files |

## Defenses
- Parameterized queries / prepared statements → SQLi.
- Output encoding + CSP where appropriate → XSS.
- CSRF tokens + SameSite cookies + origin checks → CSRF.
- Server-side authorization on every object → IDOR/BOLA.
- Restrict outbound server access + allowlists → SSRF.
- Normalize/validate paths + enforce allowlisted roots → traversal.

**Never rely on client-side authorization.**