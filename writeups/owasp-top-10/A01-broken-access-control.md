# A01 — Broken Access Control
 
**Key thing to always do:** inspect every request the browser makes.
 
## Definition
Occurs when the server does not properly enforce **who can access what**
on every single request.
 
**Example — IDOR (Insecure Direct Object Reference):** changing an ID in
a request (e.g. `?id=7` → `?id=8`) lets you see someone else's profile or
data, because the server never re-checked whether *you* were allowed to
access object `8`.
 
See [idor.md](idor.md) for a full breakdown of IDOR mechanics.
 
---
 
## Privilege Escalation
 
### Horizontal Privilege Escalation
Gaining access to **another account at the same permission level** —
someone else's data/role, not a higher one (e.g. viewing another regular
user's order history).
 
### Vertical Privilege Escalation
**Jumping up to admin-level control** — going from a regular user role to
an administrative one.
 
---
 
## Cookie Tampering
Just tamper with a session cookie — e.g. change a user ID value, or an
`admin` flag/privilege field, to escalate access without needing valid
credentials for the target account.
