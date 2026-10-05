# Security Tools

## Passive recon
| Tool | Use |
|---|---|
| whois / RDAP | Registration/ownership data |
| dig / nslookup | DNS queries |
| Shodan | Search indexed exposed services |
| DNSDumpster | Passive DNS/subdomain mapping |

## Active recon
| Tool | Use |
|---|---|
| ping | ICMP reachability |
| traceroute / tracert | Path/hop discovery |
| telnet | Simple banner/service interaction |
| netcat (nc) | TCP/UDP connectivity + banner checks |
| Nmap | Host/port/service enumeration |
| ffuf | Web content/parameter fuzzing |

## Traffic / analysis
Wireshark = packet analysis GUI.  
tcpdump = command-line capture/filtering.  
**Workflow:** capture → filter → inspect → correlate.

## Defensive / SOC tools
Snort = network IDS/IPS rule engine.  
Sigma = portable detection-rule format.  
CyberChef = decode/transform/extract data.  
Volatility = memory forensics.  
Autopsy = digital forensics platform.  
FTK Imager = evidence acquisition/preview.

## Credential / crypto audit
John the Ripper = authorized password/hash auditing.  
hashid / hash-identifier = likely hash-type identification.  
OpenSSL = TLS/certificate/crypto utilities.

## Exploitation framework
Metasploit: `search` → `use` → `info` → `show options` → `set`/`unset` → `show payloads` → `run`/`exploit` → `sessions`.

**Exploit ≠ payload:** exploit triggers the vulnerability; payload is what runs after successful exploitation.

## CyberChef
Input → operation/recipe → output.

Common operations: **From Base64 · URL Decode · From Hex · ROT13 · Extract IP/URL/Email · timestamp conversion**

Encoding/obfuscation ≠ encryption.

## Windows
CMD: `ipconfig /all`, `netstat -ano`, `tasklist`, `systeminfo`  
PowerShell: `Get-Process`, `Get-Service`, `Get-NetTCPConnection`, `Get-WinEvent`, `Get-FileHash`

## Linux
`ip a`, `ip route`, `ss -tulpn`, `find`, `grep`, `journalctl`, `chmod`, `ssh`, `scp`

**Authorization:** use offensive/security-testing tools only on systems and data you are explicitly allowed to test.