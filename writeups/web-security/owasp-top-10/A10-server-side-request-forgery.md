# A10 — Server-Side Request Forgery (SSRF)

Server-Side Request Forgery (SSRF) occurs when a web application fetches a
remote resource using a user-influenced URL or similar input without
adequately restricting where the server is allowed to connect.

## Core idea

The browser or client sends a request to the application:

```text
Client → Web application → Requested destination
```

With an SSRF flaw, an attacker can influence the destination so that the
**server**, rather than the attacker directly, makes the outbound request.

Potential targets include:

- Internal services that are not directly reachable from the attacker
- Local or loopback services
- Cloud instance metadata services
- Other network services reachable from the application's network segment

## Why SSRF matters

The server may have network access, credentials, or trust relationships
that the original client does not have. Depending on the environment, SSRF
can therefore be used for internal network discovery, access to sensitive
services, or retrieval of data that should not be exposed.

## Simple example

An application offers:

```text
GET /fetch?url=https://example.com/image.jpg
```

If the server accepts arbitrary destinations, an attacker may try to make
the application request an internal address instead of the intended public
resource.

The important vulnerability condition is **insufficient validation and
destination control**, not merely the existence of a server-side HTTP
request feature.

## Defenses

Prefer defense in depth:

1. Allowlist approved URL schemes, ports, and destination hosts where
   practical.
2. Validate and canonicalize user-controlled URLs before making requests.
3. Restrict outbound network access from the application to only what the
   feature actually needs.
4. Segment sensitive internal services from systems that perform
   user-controlled outbound requests.
5. Handle redirects carefully because they can bypass naive destination
   checks.
6. Log and monitor server-side outbound requests where appropriate.

Do not rely on a simple denylist as the only SSRF defense; URL parsing,
redirect behavior, DNS behavior, and alternate representations can make
denylist-only controls brittle.

## Security takeaway

SSRF is fundamentally an **unintended trust-boundary crossing**:
untrusted input influences where a privileged server makes a network
request. The strongest mitigation combines application-level destination
validation with network-level egress restrictions.

## Reference

OWASP Top 10:2021, A10 — Server-Side Request Forgery (SSRF).
