# SOC detection and response notes

This exercise did not include a live SIEM or server logs. The logic below is a starter set for a SOC to adapt and validate against its own telemetry; these are not alerts that fired during this project.

## Suggested detection ideas

### Repeated login failures

- Count failed logins by source IP and account over a short time window.
- Alert on repeated failures or distributed attempts, while tuning for shared NATs, monitoring systems, and normal user error.
- Response: review related successful logins, MFA events, lockouts, and source reputation before blocking.

### Directory enumeration

- Detect a high number of distinct URI paths from one source in a short period, especially repeated 403/404 responses or requests for backup/configuration extensions.
- Response: preserve access logs, identify successful responses among the probe burst, and verify whether any returned content is sensitive.
- Do not alert solely because one path returns 404 or 301.

### Cleartext credential transport

- Identify authentication POSTs over HTTP or port 80 rather than HTTPS.
- Response: prioritize HTTPS enforcement and determine whether any real credentials crossed an untrusted network. The lab's form values were dummy credentials.

### SQL injection indicators

- Inspect normalized query parameters for SQL metacharacters or unusual boolean/time-delay patterns.
- Correlate with application 500s, database errors, unusual query volume, and unexpected result sizes.
- Response: preserve request and DB audit context, confirm code paths, and remediate using parameterized queries and least-privilege DB accounts. Avoid relying on a payload signature alone.

### XSS indicators

- Inspect decoded inputs for markup/event-handler patterns and correlate with response reflection or stored content.
- Response: identify the affected route and users, review output encoding and CSP, and assess session impact only if supported by evidence.

## MITRE ATT&CK use

Use the mappings in `FINDINGS.md` as tags for the observed test behaviors. Do not use technique mapping as proof of attribution or compromise. T1110.1 is a possible brute-force detection context; three failed test logins do not establish a brute-force incident.

## What a real investigation would need

- Web server access/error logs with request IDs and client addresses.
- Authentication logs and MFA/lockout events.
- Database audit logs and query traces around the SQLMap test window.
- WAF/reverse proxy telemetry and TLS configuration history.
- Endpoint or browser telemetry if a real user's browser may have executed untrusted script.
