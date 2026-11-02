# Severity and risk assessment

## Purpose and rating model

This is a qualitative triage model for this educational assessment. It is not a CVSS calculation, penetration-test certification, or claim that a production system was compromised. Ratings describe the potential risk if the same weakness existed in a real application; the test itself used a deliberately vulnerable training site and dummy values.

Severity and evidence confidence are recorded separately:

- **Severity** estimates the plausible security impact and ease of exploitation in a real deployment.
- **Evidence confidence** describes how directly the available artifacts support the observation.
- **Demonstrated impact** records what this assessment actually did and did not prove.

## Severity definitions

| Rating | Use when |
|---|---|
| Critical | A broadly exploitable issue provides direct control of critical systems or highly sensitive data with severe impact. Not assigned in this assessment. |
| High | A remotely reachable weakness can expose credentials or enable substantial unauthorized database/application access, with limited prerequisites. |
| Medium | Exploitation is feasible but depends on a victim action, constrained context, or impact not shown to be broad or severe. |
| Low | The issue has limited demonstrated impact or requires substantial prerequisites. |
| Informational | An observation or attack-surface detail is present, but no vulnerability or sensitive exposure has been demonstrated. |
| Inconclusive / Not rated | The test scope or evidence is insufficient to determine whether a weakness exists. |

## Evidence-confidence definitions

| Grade | Meaning |
|---|---|
| High | Direct packet, response, or browser evidence clearly demonstrates the behavior described. |
| Medium-high | A relevant tool's output is preserved in screenshots, but the tool session is not independently present in the PCAP or server-side telemetry. |
| Medium | The evidence suggests the behavior, but an important part of the claim needs corroboration. |
| Limited | The sample is too small or the telemetry is insufficient for a reliable conclusion. |

## Applied ratings

| Finding | Severity | Confidence | Rationale |
|---|---|---|---|
| F-01 - Login form over HTTP | High | High | The packet capture directly shows form-encoded login POST requests on HTTP and readable dummy form fields. Real credentials were not used; the risk is conditional on real users submitting credentials over the route. |
| F-02 - Blind SQL injection | High | Medium-high | SQLMap screenshots report blind injection and database-name enumeration. No records were dumped, and the tool run is separate from the PCAP. |
| F-03 - Reflected XSS | Medium | High | The PCAP response reflects the SVG event-handler input without encoding and the browser screenshot shows an alert. No session or victim impact was tested. |
| F-04 - Directory discovery | Informational | High for the observed scan/checks | Paths were discovered and two manual paths returned 404. No sensitive content, directory listing, or access-control bypass was demonstrated. |
| F-05 - Login rate limiting | Inconclusive / Not rated | Limited | Three manually entered failures cannot establish the presence or absence of sustained or distributed rate limiting. |

## Why ratings are not CVSS scores

No CVSS vector is assigned because this repository does not establish all required environmental and impact details for a reliable score. For example, the SQL injection test enumerated database names but did not dump records; the XSS test demonstrated an alert but not session compromise; and the cleartext-login test used dummy credentials. The qualitative labels are intended to prioritize remediation, not to exaggerate measured impact.

## Retest conditions

- **F-01:** Verify that HTTP requests redirect before any authentication data is sent, all login/session routes use HTTPS, and cookies are marked Secure.
- **F-02:** Retest the same parameter with an approved safe test after parameterized queries are implemented; confirm SQLMap no longer detects injection and inspect database permissions.
- **F-03:** Repeat the harmless reflected-XSS test and verify the input is rendered as text or safely encoded and no alert executes.
- **F-04:** Verify directory listing is disabled and sensitive/backup/configuration paths are inaccessible; document only actual response content and access controls.
- **F-05:** Perform an explicitly authorized, controlled rate-limit test with a larger bounded sample and verify both per-account and per-source controls, without causing account lockout or service disruption.

See [REMEDIATION.md](REMEDIATION.md) for the corrective action plan.
