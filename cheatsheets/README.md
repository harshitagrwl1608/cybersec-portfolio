# Cheatsheets

Fast-reference sheets distilled from the repository's **Security+ notes, Networking notes, Linux notes, and practical writeups**.

These are intentionally **short**: definitions, comparisons, ports, commands, attack indicators, and decision points. Use the full notes and writeups for explanations and practical walkthroughs.

## Index

| Area | Cheatsheet | Best for |
|---|---|---|
| Security+ | [Security+ Core](security-plus-core.md) | CIA, AAA, controls, Zero Trust, crypto basics |
| Security+ | [Security+ Threats & Attacks](security-plus-threats.md) | Actors, vectors, social engineering, malware, attack types |
| Security+ | [Security+ Vulnerabilities](security-plus-vulnerabilities.md) | Memory, OS, cloud, supply chain, mobile, zero-days |
| Security+ | [Security+ Mitigation & Hardening](security-plus-mitigation.md) | Hardening, segmentation, firewalls, endpoints, DLP |
| Security+ | [Security+ Architecture](security-plus-architecture.md) | Cloud, virtualization, IoT/OT, appliances, VPN/SASE, resilience |
| Security+ | [Security+ Governance](security-plus-governance.md) | Policies, gap analysis, change, baselines, privacy, risk |
| Security+ | [Security+ IAM](iam-access-control.md) | AAA, MFA, authorization, Kerberos, PAM |
| Security+ | [Incident Response](incident-response.md) | IR lifecycle, triage, evidence, containment, recovery |
| Security+ | [Risk, GRC & Resilience](risk-grc-resilience.md) | Risk, BIA, RTO/RPO, continuity, backups |
| Security+ | [Physical Security](security-plus-physical.md) | Physical controls, attacks, environmental protection |
| Networking | [Networking Fundamentals](networking-fundamentals.md) | OSI, devices, IP, subnetting, IPv6, routing, NAT, VLANs, STP |
| Networking | [Protocols & Ports](networking-ports.md) | Common services, ports, DNS records, DHCP |
| Networking | [Network Services](networking-services.md) | DNS/DHCP/NTP, VPN/IPsec, SNMP, Syslog, NetFlow, wireless |
| Networking | [Network Recon](network-recon.md) | Passive/active recon, Nmap, enumeration |
| Networking | [Network Attacks](network-attacks.md) | ARP, MAC flooding, VLAN hopping, DoS, MITM, wireless attacks |
| Networking | [Packet Analysis](packet-analysis.md) | Wireshark/tcpdump filters and triage |
| Networking | [Troubleshooting](network-troubleshooting.md) | Evidence-driven troubleshooting workflow |
| Tools | [Security Tools](security-tools.md) | Nmap, Snort, Sigma, CyberChef, John, Metasploit, forensics |
| Linux | [Linux Security Commands](linux-security.md) | Permissions, processes, files, logs, network |
| Linux | [Linux Shell & Git](linux-shell-git.md) | Shell operators, Bash, SetUID, cron, Git, encoding |
| Windows/AD | [Windows Security](windows-security.md) | CMD/PowerShell host triage |
| Windows/AD | [Windows & Active Directory](windows-ad.md) | AD, Kerberos, DNS, GPO, security events |
| Web | [Web Security](web-security.md) | OWASP, SQLi, XSS, CSRF, IDOR, SSRF |
| Human Layer | [Phishing & Social Engineering](phishing-social-engineering.md) | Phishing triage and social-engineering types |
| Blue Team | [SOC & Detection](soc-detection.md) | SIEM, logs, IDS/IPS, EDR/XDR, alert triage |
| Blue Team | [Digital Forensics](forensics.md) | Evidence, volatility, acquisition, analysis |
| Crypto | [Cryptography](cryptography.md) | Hashing, signatures, PKI, key management, TLS |

## Source coverage

**All 146 substantive topic notes were audited individually:**

| Note collection | Topic notes audited |
|---|---:|
| Security+ First Batch | 61 / 61 |
| Security+ Second Batch | 31 / 31 |
| Networking | 26 / 26 |
| Linux | 28 / 28 |
| **Total** | **146 / 146** |

Reference-only material such as source-image indexes, traceability pages, and coverage metadata was not treated as additional study topics.

See [NOTES-COVERAGE.md](NOTES-COVERAGE.md) for the mapping from each note collection/topic range to the relevant cheatsheet domain.

## Writeup coverage

The same cheatsheets also absorb the recurring practical material demonstrated in `writeups/`: recon, Nmap, DNS/DHCP, cleartext protocols, packet capture, ARP spoofing, MAC flooding, VLAN hopping, DoS/DDoS, firewalls, troubleshooting, CyberChef, John, Metasploit, Windows/AD, SIEM, Snort/Sigma, IoCs, phishing, IR, forensics, and web testing.

## Security+ priority

Current SY0-701 domain weights are **4.0 Security Operations (28%) → 2.0 Threats, Vulnerabilities & Mitigations (22%) → 5.0 Security Program Management & Oversight (20%) → 3.0 Security Architecture (18%) → 1.0 General Security Concepts (12%)**.

The repository contains the long-form study material; this folder is the fast-revision layer.