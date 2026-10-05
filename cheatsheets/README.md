# Cheatsheets

Fast-reference sheets for the cybersecurity skills documented in this repository.

These are intentionally **short**: definitions, comparisons, ports, commands, attack indicators, and decision points. Use the full notes and writeups for explanations and practical walkthroughs.

## Index

| Area | Cheatsheet | Best for |
|---|---|---|
| Security+ | [Security+ Core](security-plus-core.md) | CIA, AAA, controls, Zero Trust, crypto |
| Security+ | [Threats & Attacks](security-plus-threats.md) | Actors, vectors, malware, attack distinctions |
| Security+ | [Mitigation & Hardening](security-plus-mitigation.md) | Hardening, segmentation, firewalls, endpoints |
| Security+ | [IAM & Access Control](iam-access-control.md) | AAA, MFA, authorization, Kerberos |
| Security+ | [Incident Response](incident-response.md) | IR lifecycle, triage, evidence, IoCs |
| Security+ | [Risk, GRC & Resilience](risk-grc-resilience.md) | Risk, governance, BIA, RTO/RPO, backups |
| Networking | [Protocols & Ports](networking-ports.md) | Common ports, protocols, secure alternatives |
| Networking | [Network Recon](network-recon.md) | Passive/active recon, Nmap, enumeration |
| Networking | [Network Attacks](network-attacks.md) | ARP spoofing, MAC flooding, VLAN hopping, DoS |
| Networking | [Packet Analysis](packet-analysis.md) | Wireshark/tcpdump filters and triage |
| Networking | [Troubleshooting](network-troubleshooting.md) | Evidence-driven troubleshooting workflow |
| Tools | [Security Tools](security-tools.md) | Nmap, Snort, Sigma, CyberChef, John, Metasploit |
| Linux | [Linux Security](linux-security.md) | Files, permissions, processes, network, logs |
| Windows | [Windows Security](windows-security.md) | CMD/PowerShell host triage |
| Windows/AD | [Windows & AD](windows-ad.md) | AD, Kerberos, DNS, GPO, security events |
| Web | [Web Security](web-security.md) | OWASP, SQLi, XSS, CSRF, IDOR, SSRF |
| Human Layer | [Phishing & Social Engineering](phishing-social-engineering.md) | Practical phishing triage and attack types |
| Blue Team | [SOC & Detection](soc-detection.md) | SIEM, IDS/IPS, EDR/XDR, alert triage |
| Blue Team | [Digital Forensics](forensics.md) | Evidence, volatility, forensic tools |
| Crypto | [Cryptography](cryptography.md) | Hashing, signatures, PKI, TLS |

## Built from this portfolio

These sheets intentionally absorb the recurring high-value material demonstrated in the repository's **writeups**, not only the Security+ note batches.

- **Networking writeups:** passive/active reconnaissance, Nmap, DNS/DHCP, cleartext protocols, tcpdump/Wireshark, ARP poisoning, MAC flooding, VLAN hopping, DoS/DDoS, firewalls and troubleshooting.
- **Tool writeups:** Nmap, netcat, CyberChef, John the Ripper, Metasploit, OpenSSL, Linux shell, Windows CMD and PowerShell.
- **Blue-team writeups:** Windows/AD, Kerberos, SIEM, logs, IDS/Snort, Sigma, IoCs, phishing, incident response, digital forensics and SOC operations.
- **Web writeups:** OWASP categories, authentication failures, injection, SSRF, IDOR, business-logic flaws, certificates and SQL injection.

## Security+ priority

Current SY0-701 domain weights: **4.0 Security Operations (28%) → 2.0 Threats, Vulnerabilities & Mitigations (22%) → 5.0 Security Program Management & Oversight (20%) → 3.0 Security Architecture (18%) → 1.0 General Security Concepts (12%)**.

The repository contains the long-form study material; this folder is the fast-revision layer.