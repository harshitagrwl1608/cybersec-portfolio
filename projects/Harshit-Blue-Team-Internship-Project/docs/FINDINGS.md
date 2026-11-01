# Findings and impact

## Summary table

| Finding | Evidence | Assessment | SOC significance |
|---|---|---|---|
| Plaintext login over HTTP | Wireshark frame 22 and expanded form fields | Confirmed. Dummy username/password were sent in an HTTP POST. | High priority because credentials can be observed on the network; detect login submissions over cleartext and prioritize TLS. |
| SQL injection on forum identifier | SQLMap terminal screenshots | Confirmed by SQLMap on `showforum.asp?id=0`; boolean-based blind and time-based blind indications. Microsoft SQL Server identified; six database names enumerated. | High priority. Correlate web requests with database audit/error logs; review query parameterization and database privileges. No records were dumped in this test. |
| Reflected XSS in search | Browser alert screenshot; Wireshark frames 57 and 64 | Confirmed in the test browser; the alert appeared. | High priority because a crafted link/input may execute script in a visitor's browser. Review output encoding, affected routes, and possible user exposure. |
| Directory and path discovery | Gobuster terminal screenshots; manual `/admin/` and `/backup/` checks | Scan completed 18,452 entries. Several paths responded; manually tested `/admin/` and `/backup/` returned 404. No directory listing was demonstrated. | Treat discovery as attack-surface inventory. Review unexpected public files and watch for rapid requests to many distinct paths. |
| Repeated failed logins | Three dummy login attempts | Three failures were observed; no obvious delay or lockout appeared. Sample too small to conclude rate-limiting is absent. | Correlate failures by source and account; tune thresholds using normal login behavior. |

## Indicators from this assessment

These are training-test indicators for correlation, not confirmed attacker IoCs:

- Host: `testasp.vulnweb.com` (captured destination IP: `44.238.29.244`).
- Paths: `/Login.asp`, `/admin/`, `/backup/`, `/Search.asp`, and `/showforum.asp?id=0`.
- Gobuster found common paths such as `/vti_cnf/`, `/aspnet_client/`, `/avatars/`, `/cgi-bin/`, `/images/`, `/jscripts/`, and `/templates/`.
- Wireshark frames: 22, 29, 36 (login); 4 and 9 (manual path checks); 43 and 47 (search probe and HTTP 500); 57 and 64 (XSS request and response).
- Dummy login fields in frame 22: `tfUName=blue_team_lab_user`, `tfUPass=invalid_test_only_1`.
- XSS test input: `<svg onload=alert(1)>` (URL encoded in the HTTP request).
- SQLMap-listed databases: `acuforum`, `acuserservice`, `master`, `model`, `msdb`, `tempdb`.

## MITRE ATT&CK context

- **T1595 - Active Scanning:** relevant to the Gobuster directory enumeration performed in this assessment.
- **T1190 - Exploit Public-Facing Application:** relevant to the SQL injection validation and reflected XSS demonstration against the training application.
- **T1110.1 - Password Guessing:** relevant as a detection context for repeated login guesses. The three invalid submissions here were test actions, not evidence of an external brute-force actor.

These mappings describe the test behaviors and possible detection context. They do not attribute the activity to an adversary.

## Severity and limits

The SQL injection, cleartext credential transport, and XSS findings should be addressed first. Directory discovery is not itself proof of data exposure. No table rows, customer records, production credentials, or SIEM alerts were obtained. The exercise did not include server-side logs, so further incident confirmation would require application, authentication, and database telemetry.
