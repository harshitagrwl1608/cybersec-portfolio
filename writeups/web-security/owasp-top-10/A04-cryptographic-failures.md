# A04 — Cryptographic Failures
 
## Definition
Encryption used incorrectly, or not used at all. One of the most
widespread categories — relevant almost everywhere data is stored or
transmitted.
 
## Common Patterns
- Using weak algorithms (MD5, SHA-1, etc.)
- Hard-coded secrets/keys in source code
- Poor key rotation or key configuration practices
- Lack of encryption where it's actually needed
- Self-signed or invalid TLS certificates
- Using AI/ML systems without proper secret-handling practices for the
  credentials/keys those systems rely on
