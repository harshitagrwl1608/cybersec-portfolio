# Security Tools

## Recon
| Tool | Use |
|---|---|
| whois / RDAP | Registration/ownership data |
| dig / nslookup | DNS queries |
| Shodan | Indexed exposed-service discovery |
| Nmap | Host/port/service enumeration |
| ffuf | Web content/parameter fuzzing |

## Traffic / analysis
Wireshark = packet analysis GUI.  
tcpdump = command-line capture/filtering.  
OpenSSL = TLS/certificate/crypto utilities.

## Detection / forensics
Snort = network IDS/IPS rules.  
Sigma = portable detection-rule format.  
CyberChef = decode/transform/extract data.  
Volatility = memory forensics.  
Autopsy = forensic analysis.  
FTK Imager = acquisition/preview.

## Credential auditing
John the Ripper = authorized password/hash auditing.  
hashid / hash-identifier = likely hash-type identification.

## Metasploit
`search` → `use` → `info` → `show options` → `set` → `show payloads` → `run`/`exploit` → `sessions`

Exploit = triggers vulnerability. Payload = code/action delivered after successful exploitation.

## CyberChef
Input → recipe → output.

Common: **From Base64 · URL Decode · From Hex · ROT13 · Extract IP/URL/Email · timestamp conversion**

Encoding/obfuscation ≠ encryption.

**Authorization:** use offensive/security-testing tools only on systems and data you are explicitly permitted to test.