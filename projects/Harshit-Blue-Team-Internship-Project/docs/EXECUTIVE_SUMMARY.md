# Executive summary

## Objective

Assess an intentionally vulnerable training web application against the assigned Blue Team scenarios: authentication abuse indicators, directory discovery, plaintext credential transport, SQL injection, and reflected cross-site scripting. The original task host was unavailable during the assessment, so the approved alternative training host was used.

## Overall result

The assessment demonstrated three material web-security weaknesses in the training application: a login form submitted over unencrypted HTTP, blind SQL injection reported by SQLMap, and reflected XSS that executed in the test browser. Directory discovery identified responding paths but did not demonstrate sensitive content exposure. Three failed login submissions were insufficient to judge rate limiting or lockout effectiveness.

## Priority findings

| Priority | Finding | Rating | What was demonstrated |
|---|---|---|---|
| 1 | SQL injection | High | SQLMap reported blind injection and enumerated six database names; no records were dumped. |
| 1 | Login over HTTP | High | Three login POST requests were visible in the PCAP; dummy form values were readable in clear text. |
| 2 | Reflected XSS | Medium | The SVG event-handler input was reflected without encoding and a browser alert was observed in the test context. |
| 3 | Directory discovery | Informational | Gobuster identified responding paths; two manually checked paths returned 404 and no directory listing was demonstrated. |
| Validate | Login rate limiting | Inconclusive | Only three invalid dummy submissions were tested. |

## Recommended actions

1. Replace vulnerable database query construction with parameterized queries and least-privilege database access.
2. Enforce HTTPS before any authentication data is accepted; configure secure session cookies and HSTS.
3. Apply context-aware output encoding and safe DOM handling to prevent reflected XSS.
4. Review discovered paths and remove or restrict unnecessary public resources.
5. Validate authentication rate limits, MFA, and monitoring using a bounded authorized test.

## Scope and confidence

The browser PCAP contains 68 packets. It directly supports the HTTP login, manual path checks, search probes, and reflected-XSS request/response. SQLMap and Gobuster terminal results are preserved separately as screenshots and are not part of that PCAP. The exercise used dummy login values, did not dump database records, and did not access application/server logs, database audit logs, WAF telemetry, endpoint telemetry from other users, or a live SIEM. No production compromise or data exposure is claimed.

Severity labels are qualitative project triage, not CVSS scores. Full evidence references, confidence grades, limitations, ATT&CK context, and retest criteria are in [FINDINGS.md](FINDINGS.md), [EVIDENCE_REGISTER.md](EVIDENCE_REGISTER.md), [SEVERITY_AND_RISK.md](SEVERITY_AND_RISK.md), and [REMEDIATION.md](REMEDIATION.md).
