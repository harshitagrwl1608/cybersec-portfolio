# A01 — Broken Access Control

Broken access control occurs when an application does not correctly enforce who is allowed to access a resource or perform an action.

## IDOR example

Changing an object identifier such as `?id=7` to `?id=8` is only a vulnerability when the server fails to verify that the authenticated user is authorized to access object 8.

See [IDOR](idor.md) for a detailed breakdown.

## Privilege escalation

### Horizontal

Accessing another user's data or functionality at the same privilege level.

### Vertical

Obtaining functionality or permissions associated with a higher-privileged role.

## Cookie tampering

Client-controlled cookie values must not be trusted for authorization decisions unless their integrity and authenticity are protected and the server still performs appropriate authorization checks.

For example, an application that directly trusts an unsigned client-controlled `role=admin` value could be vulnerable to privilege escalation. Simply changing a cookie is not itself proof of a vulnerability.
