# Findings and impact

## Summary

| ID | Finding | Severity | Evidence confidence | Evidence |
|---|---|---|---|---|
| F-01 | Login form submits credentials over HTTP | High | High | EV-01, EV-02 |
| F-02 | Blind SQL injection on forum identifier | High | Medium-high | EV-04 |
| F-03 | Reflected XSS in search input | Medium | High | EV-01, EV-06 |
| F-04 | Directory/path discovery | Informational | High for observed responses; no exposure shown | EV-01, EV-03 |
| F-05 | Login rate-limiting/lockout behavior | Inconclusive; no severity assigned | Limited | EV-01, EV-02 |

Severity is a qualitative assessment for prioritization, not a CVSS score. The definitions and rationale are in [SEVERITY_AND_RISK.md](SEVERITY_AND_RISK.md). Evidence IDs resolve to exact files and packet references in [EVIDENCE_REGISTER.md](EVIDENCE_REGISTER.md).

## F-01 - Login form submits credentials over HTTP

**Severity:** High  
**Evidence confidence:** High  
**Evidence:** EV-01 frames 22, 29, and 36; EV-02 screenshots.

The capture shows three form-encoded POST requests to /Login.asp over HTTP on port 80. Frame 22 includes a request body with the dummy username and password fields; frames 29 and 36 show subsequent dummy submissions. The body is readable in the capture because the request was not protected by TLS.

**Impact:** If real users submit credentials through this route, a party able to observe the network path could read them. The test used intentionally invalid dummy values, so this exercise does not establish that real user credentials were exposed.

**Limitations:** No real credentials were used, and no real-world interception or account compromise was attempted.

## F-02 - Blind SQL injection on forum identifier

**Severity:** High  
**Evidence confidence:** Medium-high  
**Evidence:** EV-04 SQLMap terminal screenshots.

SQLMap reported boolean-based blind and time-based blind SQL injection indications for the id parameter on showforum.asp?id=0. It identified Microsoft SQL Server and enumerated six database names: acuforum, acuserservice, master, model, msdb, and tempdb. The test stopped after database-name enumeration; no tables or records were dumped.

**Impact:** SQL injection can allow an attacker to alter application queries and, depending on database permissions and the vulnerable query, access or modify data. The demonstrated database-name enumeration establishes meaningful database-level exposure, but does not prove that table contents or customer records were accessed.

**Limitations:** The SQLMap run is evidenced by terminal screenshots, not by the 68-packet browser capture. A separate manual search probe in EV-05 returned HTTP 500; that error by itself is not proof of SQL injection and is not the basis for this finding.

## F-03 - Reflected XSS in search input

**Severity:** Medium  
**Evidence confidence:** High  
**Evidence:** EV-01 frames 57-64; EV-06 screenshots.

Frame 57 contains a search request with an SVG onload event-handler probe. The response is segmented across frames 58, 60, 62, and 64; the reflected page content includes the input without context-appropriate output encoding. The browser alert screenshot in EV-06 records script execution in the test browser.

**Impact:** A crafted link could cause a visitor's browser to execute attacker-controlled script in the context of the vulnerable site. The practical impact depends on the application's session model, page context, and victim interaction.

**Limitations:** The test demonstrated a JavaScript alert only. It did not test session theft, data exfiltration, account actions, persistence, or impact on another user's browser.

## F-04 - Directory and path discovery

**Severity:** Informational  
**Evidence confidence:** High for the listed scan results and manual responses; no sensitive exposure demonstrated  
**Evidence:** EV-01 frames 4-12; EV-03 Gobuster and Wireshark screenshots.

Gobuster completed 18,452 entries and identified responding paths. The manual requests for /admin/ and /backup/ returned 404. A discovered path or a 200/301/403 response is an item to inspect, not proof that a directory listing or sensitive content is exposed.

**Impact:** Path discovery can help an attacker inventory an application's attack surface. This exercise did not demonstrate directory listing, access to a backup, or disclosure of sensitive data.

**Limitations:** No broad content review of every discovered path was performed. Gobuster's full request stream is not contained in the packet capture; its results are preserved in terminal screenshots.

## F-05 - Login guessing and rate limiting

**Severity:** Inconclusive; no vulnerability rating assigned  
**Evidence confidence:** Limited  
**Evidence:** EV-01 frames 22, 29, and 36; EV-02.

Three invalid dummy login submissions were observed. No obvious delay or lockout appeared in this small sample. Three attempts cannot determine whether rate limits, progressive delays, MFA policies, or lockout controls handle sustained or distributed abuse.

**Impact:** No missing rate-limit control has been established. A larger authorized test and server-side authentication telemetry would be needed.

## Other observed activity - SQL-like search probe

Frames 43-47 show a SQL-like search value followed by an HTTP 500 response. This is a useful investigation lead, but a server error alone does not demonstrate injection. It is documented separately as EV-05 and is not used as independent proof for F-02.

## Indicators and observables

These values describe the controlled assessment activity and should not be treated as threat-intelligence indicators or attributed to an attacker:

- Hostname: testasp.vulnweb.com.
- Destination address observed during capture: 44.238.29.244. This is a capture-time network observation, not a durable IOC.
- Relevant paths: /Login.asp, /Search.asp, /admin/, /backup/, and showforum.asp?id=0.
- Login frames: 22, 29, and 36.
- SQL-like search probe and server error: frames 43-47.
- Reflected-XSS probe: frame 57; response body spans frames 58-64.
- Gobuster and SQLMap results are documented by separate terminal screenshots and are not part of the PCAP.

## MITRE ATT&CK context

ATT&CK is used here to describe behavior analogies, not to claim an intrusion or identify an adversary.

| Observed test behavior | ATT&CK reference | How to interpret it |
|---|---|---|
| Gobuster wordlist-based path discovery | [T1595.003 - Wordlist Scanning](https://attack.mitre.org/techniques/T1595/003/) | Closest match for the directory-discovery behavior. In this project it was an authorized assessment action, not adversary reconnaissance. |
| SQLMap exploitation validation against a public training endpoint | [T1190 - Exploit Public-Facing Application](https://attack.mitre.org/techniques/T1190/) | Relevant only as a behavior analogue for exploiting a public-facing application. The exercise did not establish adversary initial access or compromise. |
| Three manually submitted invalid login values | [T1110.001 - Password Guessing](https://attack.mitre.org/techniques/T1110/001/) | Not mapped as a confirmed technique: three manual test submissions do not establish systematic adversary password guessing. |

No separate ATT&CK technique is assigned to the reflected-XSS demonstration. The captured browser alert establishes script execution in the test context, but there is no evidence of a victim-targeting campaign, drive-by compromise, or post-exploitation behavior. The XSS finding is better described directly as a web application vulnerability than forced into an imprecise ATT&CK mapping.

## Overall limitations

There was no access to application server logs, database audit logs, WAF telemetry, endpoint/browser telemetry from other users, or a live SIEM. No production accounts or customer data were used. No table records were dumped. The report therefore distinguishes demonstrated technical behavior from untested impact and proposed SOC detections.
