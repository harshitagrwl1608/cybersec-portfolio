# Security Tools

## Recon
| Tool / source | Use |
|---|---|
| whois / RDAP | Registration/ownership data |
| dig / nslookup | DNS queries |
| Shodan / certificate transparency | Publicly indexed exposure / certificate data |
| Nmap | Host/port/service enumeration |
| ffuf | Authorized web content/parameter fuzzing |
| OSINT sources | Public information for threat and exposure analysis |

## Traffic / analysis
Wireshark = packet-analysis GUI.  
tcpdump = command-line capture/filtering.  
OpenSSL = TLS/certificate/crypto utilities.  
Splunk = search, correlation, alerting and investigation across ingested data.

## Detection / forensics
Snort = network IDS/IPS rules.  
Sigma = portable detection-rule format.  
**Sigma CLI + Splunk plugin** = convert compatible Sigma YAML into Splunk SPL; review generated field mappings.  
CyberChef = decode/transform/extract data.  
Volatility = memory forensics. Autopsy = forensic analysis. FTK Imager = acquisition/preview.

## Vulnerability testing
- **Scanner:** identifies likely known weaknesses; validate results.
- **SAST:** inspect source/code without running the app.
- **DAST:** test a running application.
- **Fuzzing:** send unexpected inputs to find crashes/edge cases.
- **Dependency/SCA monitoring:** identify vulnerable or risky packages.
- **Pen test:** authorized, scoped attempt to validate exploitability and impact.

See [Vulnerability Management & Testing](vulnerability-management.md) for prioritization, CVE/CVSS, remediation, and rules of engagement.

## Credential auditing
John the Ripper = authorized password/hash auditing.  
hashid / hash-identifier = likely hash-type identification.

## Metasploit
`search` → `use` → `info` → `show options` → `set` → `show payloads` → `run`/`exploit` → `sessions`

Exploit = triggers a vulnerability. Payload = code/action delivered after successful exploitation.

## CyberChef
Input → recipe → output.  
Common: **From Base64 · URL Decode · From Hex · ROT13 · Extract IP/URL/Email · timestamp conversion**.

Encoding/obfuscation ≠ encryption. Base64-encoded PowerShell is a reason to inspect context, not proof of malicious activity.

**Authorization:** use offensive/security-testing tools only on systems and data you are explicitly permitted to test.