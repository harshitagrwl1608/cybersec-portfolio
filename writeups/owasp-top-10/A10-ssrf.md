# A10 — Server-Side Request Forgery (SSRF)
 
> **Note:** unlike the other files in this folder, this one isn't from my
> own handwritten notes — I didn't have material on A10 yet. Adding it
> here for completeness of the Top 10 set, generated with AI assistance
> rather than from a room/course I've actually done. Treating this as a
> placeholder to replace with my own notes once I actually study this
> category properly.
 
## Definition
Occurs when an application fetches a remote resource (e.g. a URL supplied
by the user) without validating that destination first — allowing an
attacker to make the *server* send requests to a destination of the
attacker's choosing, rather than the intended one.
 
## Why It's Dangerous
The request comes from the **server's** network position, not the
attacker's — meaning it can reach:
- Internal-only services not exposed to the public internet
- Cloud metadata endpoints (e.g. `169.254.169.254` on AWS/GCP/Azure),
  which can leak credentials/tokens the server itself has access to
- Other internal hosts behind a firewall, effectively using the
  vulnerable server as a proxy into the internal network
 
## Common Patterns
- A feature that fetches a URL on the user's behalf (e.g. "import from
  URL," webhook configuration, image/file fetching by URL, PDF generators
  that load remote resources)
- Insufficient allow-listing of destination domains/IPs
- Blocklists that can be bypassed with alternate IP formats, redirects, or
  DNS rebinding
 
## Mitigation Themes
- Allow-list only the specific destinations a feature actually needs
- Block requests to internal/private IP ranges and cloud metadata
  endpoints by default
- Disable unnecessary URL schemes and redirect-following where not needed
