# Setup and reproduction

## Review the supplied evidence

The packet capture is provided as a gzip-compressed, sanitized PCAPNG. Decompress it before opening in Wireshark:

```bash
gzip -dk evidence/capture/testasp_training_capture.pcapng.gz
wireshark evidence/capture/testasp_training_capture.pcapng
```

Useful Wireshark display filters:

```text
http
frame.number == 22
```

With frame 22 selected, expand **Hypertext Transfer Protocol** and then **HTML Form URL Encoded** to see the dummy login values. The session-cookie value has been replaced with a same-length placeholder in the public capture; TCP checksums were recalculated.

## Optional tool setup

On Debian/Ubuntu/Kali, package availability can vary by distribution. The following installs common versions of the tools used in the exercise:

```bash
sudo apt update
sudo apt install wireshark gobuster sqlmap dirb
```

The Gobuster command below assumes the `dirb` common wordlist exists at `/usr/share/wordlists/dirb/common.txt`.

## Reproduction commands - authorized training target only

These commands send requests to the deliberately vulnerable training host. Use them only if you have current authorization and the site is available. Do not substitute another host without permission.

### Gobuster directory enumeration

```bash
gobuster dir -u http://testasp.vulnweb.com/ \\
  -w /usr/share/wordlists/dirb/common.txt \\
  -t 5 -x asp,txt,bak
```

The captured run completed 18,452 entries. Review status codes and returned content before calling anything exposed; redirects and 200 responses alone do not prove a vulnerability.

### SQLMap database-name enumeration

```bash
sqlmap -u 'http://testasp.vulnweb.com/showforum.asp?id=0' \\
  --dbs --batch --threads=1
```

The SQLMap result summary in `evidence/sqlmap_results_redacted.md` preserves the observed result without publishing a server-issued session identifier. This was used to validate the assigned injection scenario and list database names. Do not add `--dump` for this project; record whether the site is available and stop if you do not have permission.

### Browser XSS check

The browser check used the training site's search field with a simple reflected test input. The screenshots show the real browser result and alert. This is a controlled lab demonstration, not a payload to use against arbitrary sites.

## Expected evidence

- `evidence/screenshots/gobuster_scan_progress.png` and `gobuster_scan_complete.png`: command, configuration, results, and completion.
- `evidence/sqlmap_results_redacted.md`: redacted summary of SQLMap validation and the six listed database names.
- `evidence/screenshots/wireshark_login_expanded.png`: frame 22 with the URL-encoded form fields expanded.
- `evidence/screenshots/xss_alert_popup.png`: browser alert while visible.
