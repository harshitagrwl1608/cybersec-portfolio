# SOC detection and response notes

This exercise did not include a live SIEM, server logs, database audit logs, or WAF telemetry. The logic below is a starter set for a SOC to adapt and validate against its own telemetry; these are not alerts that fired during this project.

## Evidence-to-detection mapping

| Evidence | Detection opportunity | Required telemetry |
|---|---|---|
| EV-01 / EV-02 | Authentication POST traffic sent over HTTP | Network sensor, reverse-proxy scheme/protocol logs, or application route telemetry |
| EV-01 / EV-03 | High-rate requests to many distinct paths | Web access logs with timestamp, source, URI, status, user-agent |
| EV-04 | SQL injection attempts and database-side anomalies | WAF/web logs, decoded query parameters, application errors, DB audit/query logs |
| EV-01 / EV-06 | Reflected markup/event-handler payloads | Decoded request parameters plus response/reflection evidence |
| EV-01 / EV-02 | Repeated authentication failures | Authentication logs with account, source, outcome, and timestamps |

## Suggested detection ideas

### Repeated login failures

- Count failed logins by source IP and account over a short time window.
- Detect repeated failures, distributed attempts, or a failure burst followed by a success.
- Tune against shared NATs, normal user error, synthetic monitoring, and password-manager mistakes.
- Response: review related successful logins, MFA events, lockouts, geolocation, and source context before blocking.
- The three failures in this project are test submissions and are not enough to validate a threshold.

### Directory enumeration

- Detect a high number of distinct URI paths from one source in a short period, especially repeated 403/404 responses or requests for backup/configuration extensions.
- Establish a baseline before selecting alert thresholds; legitimate crawlers, content scanners, and vulnerability management can look similar.
- Response: preserve access logs, identify successful responses among the request burst, and verify whether returned content is sensitive.
- Do not alert solely because one path returns 404 or 301.

### Cleartext credential transport

- Identify authentication POSTs over HTTP or port 80 rather than HTTPS.
- Where TLS terminates at a reverse proxy, use the trusted proxy's original-scheme metadata rather than guessing from the backend connection.
- Response: prioritize HTTPS enforcement and determine whether real credentials crossed an untrusted network. The values in this lab were dummy credentials.

### SQL injection indicators

- Inspect normalized and decoded query parameters for SQL metacharacters, boolean-manipulation patterns, comment syntax, or unusual time-delay patterns.
- Correlate suspicious requests with application 500s, database errors, unusual query volume, and unexpected result sizes.
- Avoid relying on a payload signature or HTTP 500 alone; both can produce false positives.
- Response: preserve request and database audit context, confirm the code path, and remediate using parameterized queries and least-privilege database accounts.

### XSS indicators

- Inspect decoded inputs for markup/event-handler patterns and correlate with response reflection or stored content.
- Confirm whether the response applies context-appropriate encoding. A suspicious request alone does not prove successful execution.
- Response: identify the affected route and users, review output encoding and Content Security Policy, and assess session impact only if supported by evidence.

## MITRE ATT&CK use

The mappings and limitations are documented in [FINDINGS.md](FINDINGS.md). T1595.003 is the closest mapping for wordlist-based path discovery. T1190 is a possible behavior analogue for exploiting a public-facing application, but the lab did not establish adversary initial access. T1110.001 is not claimed as an observed adversary technique because three manual dummy submissions do not establish systematic password guessing.

## What a real investigation would need

- Web server access/error logs with request IDs, client addresses, URI, status, and trusted proxy metadata.
- Authentication logs and MFA/lockout events.
- Database audit logs and query traces around the SQLMap test window.
- WAF/reverse-proxy telemetry and TLS configuration history.
- Endpoint or browser telemetry if a real user's browser may have executed untrusted script.
- A validated time window and correlation across web, identity, database, and endpoint sources.

## Detection validation checklist

Before deploying any rule, test it against representative benign and malicious/synthetic events, confirm field normalization, document its time window and grouping logic, record expected false positives, and verify the response playbook. The current repository documents detection ideas only; it does not claim that a deployed alert or SIEM rule exists.
