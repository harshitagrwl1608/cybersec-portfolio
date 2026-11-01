# Blue Team Internship Project: Web Application Detection and Response

**Student:** Harshit  
**University:** J.C. Bose University of Science and Technology, YMCA, Faridabad  
**Course:** B.Tech IT  
**Track:** Blue Team  
**Internship:** Cyber Security Intern, Hack Secure  
**Program detail from the provided letter:** three-week, educational and training-based program scheduled during 2026; letter dated 13 October 2026.

This repository documents the Blue Team assessment completed as a practical internship project. It covers the task, setup, test method, evidence, findings, SOC relevance, and lessons learned. The internship letter itself is not included because it is a private document; only its relevant details are recorded above.

## Project overview

The assignment was to examine an intentionally vulnerable web application and report on four defensive scenarios:

1. Brute-force indicators and directory enumeration.
2. Plaintext credential transmission during login.
3. SQL injection indicators and impact.
4. Cross-site scripting (XSS) in user input.

The original task host, `testphp.vulnweb.com`, did not accept connections during the assessment. The approved alternative, `testasp.vulnweb.com`, was used. Testing was limited to that training site. Only dummy login values were submitted. SQLMap was used to enumerate database names; no table contents or customer records were dumped.

## Key results

| Area | Result | Why a SOC analyst should care |
|---|---|---|
| Directory discovery | Gobuster identified responding paths. The manually checked `/admin/` and `/backup/` paths returned 404. No directory listing was demonstrated. | Distinguish a path being present from actual exposure; investigate bursts of requests and review the endpoints that respond. |
| Login transport | The `POST /Login.asp` request used HTTP. Wireshark shows dummy form fields in clear text. | Credentials sent without TLS can be read by someone observing the network. |
| SQL injection | SQLMap reported blind SQL injection on `showforum.asp?id=0`, identified Microsoft SQL Server, and listed six database names. No records were dumped. | A confirmed injection finding calls for urgent application and database review, plus correlation with web and database logs. |
| Reflected XSS | The search input executed in the browser and opened an alert. The evidence includes the alert screenshot. | Reflected script can run in a visitor's browser; analysts should correlate suspicious input with the response and affected users. |
| Login guessing | Three dummy failed logins were submitted. No obvious delay or lockout appeared, but this is too few attempts to assess sustained abuse. | Authentication monitoring needs thresholds and context; a few failures alone are not proof of a brute-force attack. |

The report and evidence are in [`evidence/`](evidence/). Detailed findings and caveats are in [`docs/FINDINGS.md`](docs/FINDINGS.md).

## Setup and review

The artifacts can be reviewed without rerunning tests. To inspect the packet capture, install Wireshark and open:

```text
evidence/capture/testasp_training_capture.pcapng
```

Use the display filter `http` to view the HTTP exchange, or `frame.number == 22` to isolate the login POST. Expand **Hypertext Transfer Protocol** and **HTML Form URL Encoded** to see the dummy fields. The supplied screenshot `evidence/screenshots/wireshark_login_expanded.png` shows this expanded view.

Tool installation and carefully scoped reproduction commands are in [`docs/SETUP_AND_REPRODUCTION.md`](docs/SETUP_AND_REPRODUCTION.md). Read the scope note there before running any command. Do not run the scans against systems you do not own or have explicit permission to test.

## SOC analyst significance

This exercise helped connect raw web activity to triage decisions. A SOC analyst should preserve request and response evidence, distinguish indicators from confirmed impact, correlate web logs with authentication and database logs, assign severity based on what was actually demonstrated, and record limitations. In this exercise there was no live SIEM, server-side log access, or confirmed unauthorized data access. The detection logic in [`docs/SOC_DETECTION.md`](docs/SOC_DETECTION.md) is proposed guidance, not an alert that fired.

## What I learned

I gained practical experience with HTTP traffic analysis in Wireshark, controlled directory discovery with Gobuster, SQL injection validation with SQLMap, browser-based XSS verification, and evidence-based security reporting. I also learned to state uncertainty clearly: a 404 is not proof that all directories are safe, a server error alone does not prove SQL injection, and three failed logins cannot establish whether rate limiting handles sustained abuse.

See [`docs/LEARNINGS_AND_INTERNSHIP.md`](docs/LEARNINGS_AND_INTERNSHIP.md) for a first-person reflection suitable for an internship submission.

## Repository map

```text
docs/
  FINDINGS.md
  LEARNINGS_AND_INTERNSHIP.md
  METHODOLOGY.md
  SETUP_AND_REPRODUCTION.md
  SOC_DETECTION.md
evidence/
  capture/testasp_training_capture.pcapng
  report/blue_team_assessment_report.pdf
  screenshots/             # original browser, Wireshark, Gobuster, and SQLMap screenshots
.gitignore
README.md
```

## Evidence notes

The 68-packet capture contains the browser-based login, manual path checks, and search probes. Gobuster and SQLMap activity is documented by the separate terminal screenshots and is not present in that packet capture. The username and password shown in the capture are deliberately invalid dummy values created for this exercise. No live SIEM alerts or server logs were collected.
