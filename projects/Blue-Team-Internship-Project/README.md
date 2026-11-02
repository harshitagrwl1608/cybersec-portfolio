# Blue Team Internship Project: Web Application Security Assessment

**Student:** Harshit  
**University:** J.C. Bose University of Science and Technology, YMCA, Faridabad  
**Course:** B.Tech IT  
**Track:** Blue Team  
**Internship:** Cyber Security Intern, Hack Secure  
**Program detail from the provided letter:** three-week, educational and training-based program scheduled during 2026; letter dated 13 October 2026.

## Executive summary

This project assessed an intentionally vulnerable training web application against authentication, directory-discovery, SQL-injection, and reflected-XSS scenarios. The task originally named testphp.vulnweb.com; that host did not accept connections during the assessment, so the approved alternative testasp.vulnweb.com was used. Testing was limited to that training host. Only dummy login values were submitted, and SQLMap was stopped after database-name enumeration.

The strongest demonstrated issues were an HTTP login POST that exposed dummy form values in clear text, SQLMap-validated blind SQL injection on the forum identifier, and reflected XSS that executed in the test browser. Directory discovery found responding paths but did not demonstrate a directory listing or sensitive-file exposure. Three failed login submissions were not enough to determine whether sustained password guessing would be rate-limited.

| Observation | Assessment | Evidence |
|---|---|---|
| Login form submitted over HTTP; dummy fields visible in the capture | High risk if real credentials use this route | EV-01, EV-02 |
| Blind SQL injection reported by SQLMap; six database names listed, no records dumped | High | EV-04 |
| Reflected SVG event-handler input returned unencoded and browser alert observed | Medium; no session theft or victim impact tested | EV-01, EV-06 |
| Gobuster identified paths; manually checked /admin/ and /backup/ returned 404 | Informational; no exposure demonstrated | EV-01, EV-03 |
| Three dummy failed logins; no obvious delay or lockout | Inconclusive; not a confirmed brute-force weakness | EV-01, EV-02 |

Ratings are qualitative project triage, not CVSS scores. Severity and evidence confidence are explained in [SEVERITY_AND_RISK.md](docs/SEVERITY_AND_RISK.md). Evidence IDs and exact artifact paths are in [EVIDENCE_REGISTER.md](docs/EVIDENCE_REGISTER.md).

## Scope and safety

The assignment covered four defensive scenarios: brute-force indicators and directory enumeration, plaintext credential transmission, SQL injection, and cross-site scripting. The task's original host did not accept connections during the assessment; the approved alternative was used instead. Only dummy login values were submitted. SQLMap was used to enumerate database names; no table contents or customer records were dumped.

The internship letter itself is not included because it is a private document. This repository records only relevant program details and does not present this project as a certificate of completion or proof of employment.

## Key technical results

- **Cleartext login:** the sanitized capture contains three POST requests to /Login.asp over HTTP port 80 (frames 22, 29, and 36). The form body is visible and contains deliberately invalid dummy values. The repeated server-issued ASPSESSIONID value was replaced in the public capture.
- **SQL injection:** SQLMap reported boolean-based blind and time-based blind indications on showforum.asp?id=0, identified Microsoft SQL Server, and listed six database names. No table or record extraction was performed. The redacted terminal result summary is in [evidence/sqlmap_results_redacted.md](evidence/sqlmap_results_redacted.md); original terminal screenshots containing session data are not published.
- **Reflected XSS:** the request in frame 57 supplied an SVG onload probe; the response body in frames 58-64 reflected the input without output encoding. The browser alert screenshot documents execution in the test browser.
- **Directory discovery:** Gobuster's output is supplied as terminal screenshots. The packet capture separately records manual checks of /admin/ and /backup/, both of which returned 404. No directory listing was demonstrated.
- **Login guessing:** three dummy failed login attempts were made. This is insufficient to assess lockout or rate limiting under sustained attempts.

## SOC analyst significance

The exercise connects web requests and tool output to triage decisions. A SOC analyst should preserve request and response evidence, distinguish indicators from confirmed impact, correlate web activity with authentication and database telemetry, assign severity based on what the evidence demonstrates, and record limitations. There was no live SIEM, server-side log access, database audit-log access, or confirmed unauthorized data access. The guidance in [SOC_DETECTION.md](docs/SOC_DETECTION.md) is proposed detection logic, not an alert that fired.

## Remediation priorities

1. Remove the SQL injection condition using parameterized database access and least-privilege database permissions.
2. Enforce HTTPS for all authentication and session-bearing routes.
3. Apply context-aware output encoding to the search results and validate the reflected-XSS fix.
4. Review discovered paths and remove or restrict unnecessary public content.
5. Implement and test rate limits, MFA, and meaningful authentication telemetry.

The detailed, finding-specific plan is in [REMEDIATION.md](docs/REMEDIATION.md).

## Project documentation

| Document | Purpose |
|---|---|
| [Executive summary](docs/EXECUTIVE_SUMMARY.md) | Concise management-ready overview |
| [Findings and impact](docs/FINDINGS.md) | Technical observations, ratings, evidence IDs, and limits |
| [Evidence register](docs/EVIDENCE_REGISTER.md) | Evidence IDs, artifact links, and frame references |
| [Severity and risk method](docs/SEVERITY_AND_RISK.md) | Qualitative rating definitions and confidence |
| [Remediation plan](docs/REMEDIATION.md) | Practical corrective actions and retest criteria |
| [Methodology](docs/METHODOLOGY.md) | Scope, test approach, and evidence handling |
| [SOC detection notes](docs/SOC_DETECTION.md) | Proposed monitoring, triage, and false-positive guidance |
| [Setup and reproduction](docs/SETUP_AND_REPRODUCTION.md) | Tool setup and scoped reproduction notes |
| [Learning reflection](docs/LEARNINGS_AND_INTERNSHIP.md) | Internship context and first-person reflection |

## Repository map

```
docs/
  EVIDENCE_REGISTER.md
  EXECUTIVE_SUMMARY.md
  FINDINGS.md
  LEARNINGS_AND_INTERNSHIP.md
  METHODOLOGY.md
  REMEDIATION.md
  SEVERITY_AND_RISK.md
  SETUP_AND_REPRODUCTION.md
  SOC_DETECTION.md
evidence/
  capture/testasp_training_capture.pcapng.gz   # sanitized PCAPNG, gzip-compressed
  report/README.md                             # report publication note
  screenshots/
  sqlmap_results_redacted.md
.gitignore
README.md
```

## Evidence and publication safety

The sanitized 68-packet capture is gzip-compressed. Its 12 occurrences of the server-issued ASPSESSIONID value have been replaced with an equal-length placeholder, and the affected TCP checksums have been recalculated. This preserves packet count and the other HTTP evidence while preventing reuse of the captured session token.

The SQLMap terminal screenshots and original PDF have been removed from the current public tree because they may expose server-issued session metadata. A text summary of the SQLMap results is provided instead. The detailed Markdown documents are the current project record; the removed PDF should only be reintroduced after a clean rebuild that excludes session identifiers.

The current tree is sanitized, but earlier commits may still contain the original artifacts. Removing files in a new commit does not erase them from Git history. A history rewrite and force-push would be required to purge those earlier versions completely.
