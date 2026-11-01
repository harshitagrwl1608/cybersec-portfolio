# Methodology

## 1. Scope and authorization

The task named testphp.vulnweb.com, which refused connections in the assessment environment. The approved alternative testasp.vulnweb.com was used for the exercise. Checks were limited to that host and the assigned scenarios.

Three invalid dummy login submissions were used. SQLMap was limited to the specified forum identifier and database-name enumeration (--dbs); no table dumps or record retrieval were performed. No production accounts or customer data were used.

## 2. Work performed

### Authentication and transport

- Opened the login page and submitted three invalid dummy logins.
- Captured browser traffic in Wireshark.
- Inspected frame 22, a form-encoded POST /Login.asp over HTTP port 80; frames 29 and 36 contain the second and third dummy submissions.
- Verified that the form values are visible in the packet payload. This establishes cleartext transport for the dummy test values, not exposure of real credentials.
- The packet capture contains 68 packets.

### Directory discovery

- Manually requested /admin/ and /backup/; the recorded responses were 404 (frames 4-12).
- Ran Gobuster v3.8.2 with the common dirb wordlist, five threads, and ASP/TXT/BAK extensions.
- The completed scan processed 18,452 entries. It found common files and paths, including several 301 directory redirects, 200 responses for common ASP pages, and a 403 response for /cgi-bin/.
- A discovered path was treated as an item to review, not as proof of directory listing or sensitive content exposure.
- Gobuster's scan output is preserved as screenshots; its request stream is not present in the 68-packet browser capture.

### SQL injection

- Used the task's forum URL: showforum.asp?id=0.
- SQLMap reported boolean-based blind and time-based blind injection indications on the id parameter.
- SQLMap identified Microsoft SQL Server and enumerated six database names: acuforum, acuserservice, master, model, msdb, and tempdb.
- Stopped at database-name enumeration. No tables or records were dumped.
- SQLMap terminal activity is represented by screenshots, not by the 68-packet browser capture.

### SQL-like search probe

- Submitted a SQL-like value to the search endpoint.
- The request appears in frames 43-44 and the server returned HTTP 500 in frame 45.
- The response is recorded as an error observation only. An HTTP 500 does not independently prove SQL injection.

### Reflected XSS

- Entered a simple SVG event-handler probe in the search field on the training site.
- Frame 57 records the request. The response body is carried across frames 58, 60, 62, and 64 and reflects the SVG input without context-aware output encoding.
- A browser alert screenshot records script execution in the test browser. The input was not saved to the site.
- No session theft, data exfiltration, or actions against another user were attempted.

## 3. Evidence handling

Evidence IDs EV-01 through EV-07 are defined in [EVIDENCE_REGISTER.md](EVIDENCE_REGISTER.md). The PCAP is EV-01. Wireshark login screenshots are EV-02; Gobuster and directory-check artifacts are EV-03; SQLMap terminal screenshots are EV-04; the separate SQL-like probe/error is EV-05; and XSS request/response and browser screenshots are EV-06.

The PCAP was inspected directly and contains 68 packets. The browser capture includes login submissions, manual path checks, search probes, and the reflected-XSS request/response. Gobuster and SQLMap activity is not contained in that capture.

The source-side address is a private address from the capture environment and is not repeated in the report. The destination address 44.238.29.244 is recorded only as a capture-time observation; it should not be reused as a durable IOC.

## 4. Limitations

There was no access to application server logs, database audit logs, WAF telemetry, or a live SIEM. Detection ideas are recommendations, not observed alerts. The login-rate-limit assessment used only three failed attempts. The directory scan identified paths, but did not demonstrate a directory index or prove that returned content was sensitive. SQLMap enumerated database names but did not establish that records were exposed. The XSS check demonstrated reflected script execution in the test browser only.
