# Evidence register

This register assigns stable evidence IDs to the artifacts used by the findings. Paths are relative to the project directory.

## Evidence index

| ID | Artifact | What it supports | Important limitation |
|---|---|---|---|
| EV-01 | [testasp_training_capture.pcapng.gz](../evidence/capture/testasp_training_capture.pcapng.gz) | HTTP login, manual path checks, SQL-like search probe, reflected-XSS request/response | 68 packets; gzip-compressed; 12 repeated session-cookie values replaced with placeholders; no Gobuster or SQLMap terminal sessions |
| EV-02 | [wireshark_login_expanded.png](../evidence/screenshots/wireshark_login_expanded.png), [wireshark_login_frame.png](../evidence/screenshots/wireshark_login_frame.png), [login_http.jpg](../evidence/screenshots/login_http.jpg) | Cleartext form submission evidence | Contains only dummy test values; no cookie value is displayed |
| EV-03 | [gobuster_scan_progress.png](../evidence/screenshots/gobuster_scan_progress.png), [gobuster_scan_complete.png](../evidence/screenshots/gobuster_scan_complete.png), [wireshark_directory_frame.png](../evidence/screenshots/wireshark_directory_frame.png), [directory_404.jpg](../evidence/screenshots/directory_404.jpg) | Gobuster wordlist scan and manual 404 checks | Discovery does not prove sensitive content exposure |
| EV-04 | [sqlmap_results_redacted.md](../evidence/sqlmap_results_redacted.md) | Redacted summary of SQLMap injection validation, DBMS identification, and database-name enumeration | Original terminal screenshots were removed because they displayed server-issued session metadata; no table rows or records were dumped |
| EV-05 | [sql_error.jpg](../evidence/screenshots/sql_error.jpg) and EV-01 frames 43-47 | SQL-like search probe followed by HTTP 500 | HTTP 500 alone is not proof of SQL injection |
| EV-06 | [wireshark_xss_request.png](../evidence/screenshots/wireshark_xss_request.png), [wireshark_xss_response.png](../evidence/screenshots/wireshark_xss_response.png), [xss_alert_popup.png](../evidence/screenshots/xss_alert_popup.png), [xss_reflected.jpg](../evidence/screenshots/xss_reflected.jpg) | Reflected SVG input and browser alert in the test browser | Alert proves execution in the test context only; no session theft or victim impact was tested |

## Packet reference details for EV-01

The public PCAPNG was sanitized and inspected directly. It contains 68 packets. The server-issued ASPSESSIONID value present in 12 HTTP request headers was replaced with a same-length placeholder. TCP checksums were recalculated for the affected packets. Packet lengths, frame numbering, timestamps, and the tested HTTP content other than the session-cookie value were preserved.

| Frames | Observation | Finding |
|---|---|---|
| 4-12 | Manual GET checks for /admin/ and /backup/ and corresponding 404 responses | F-04 |
| 22, 29, 36 | Three form-encoded POST /Login.asp requests over HTTP port 80; dummy form values appear in the packet payload | F-01 and F-05 |
| 43-47 | SQL-like search query and HTTP 500 response | Supporting observation only; not proof of SQL injection |
| 50-55 | Search request with a basic HTML formatting probe and successful response | Context for input-reflection testing |
| 57-64 | SVG onload request and response; response body is segmented across frames 58, 60, 62, and 64 and reflects the input | F-03 |

## Evidence handling notes

- The PCAP includes browser traffic only. Gobuster activity is documented with separate terminal screenshots. SQLMap terminal results are summarized in EV-04 after session-bearing screenshots were removed.
- The local source address from the capture is intentionally not repeated in this report. The destination IP 44.238.29.244 is a capture-time observation, not a durable indicator of compromise.
- The username and passwords used in the login test were deliberately invalid dummy values.
- An artifact's presence is not proof of impact beyond what the artifact directly shows. See [FINDINGS.md](FINDINGS.md) for interpretation and limitations.
- The original report PDF is not included in the current public tree because its screenshots could contain the same session metadata. The Markdown documents are the current review record.
