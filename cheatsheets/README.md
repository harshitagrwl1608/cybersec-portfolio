# Cheatsheets

Fast-reference sheets distilled from the repository's **Security+ notes, Networking notes, Linux notes, practical writeups, and detection-rule work**.

These are intentionally **short**: definitions, comparisons, ports, commands, attack indicators, and decision points. Use the full notes and writeups for explanations and practical walkthroughs.

## Index

| Area | Cheatsheet | Best for |
|---|---|---|
| Security+ | [Security+ Core](security-plus-core.md) | CIA, AAA, controls, Zero Trust, crypto basics |
| Security+ | [Security+ Threats & Attacks](security-plus-threats.md) | Actors, vectors, social engineering, malware, attack types |
| Security+ | [Security+ Vulnerabilities](security-plus-vulnerabilities.md) | Memory, OS, cloud, supply chain, mobile, zero-days |
| Security+ | [Vulnerability Management & Testing](vulnerability-management.md) | Scanning, SAST/DAST, CVE/CVSS, prioritization, remediation, test scope |
| Security+ | [Security+ Mitigation & Hardening](security-plus-mitigation.md) | Hardening, segmentation, firewalls, endpoints, DLP |
| Security+ | [Security+ Architecture](security-plus-architecture.md) | Cloud, virtualization, IoT/OT, wireless/mobile, VPN/SASE, resilience |
| Security+ | [Security+ Governance](security-plus-governance.md) | Policies, assets, data roles, compliance, agreements, audits |
| Security+ | [Security+ IAM](iam-access-control.md) | Identity lifecycle, MFA, authorization, Kerberos, federation, PAM |
| Security+ | [Incident Response](incident-response.md) | IR lifecycle, roles, triage, evidence, playbooks, recovery |
| Security+ | [Risk, GRC & Resilience](risk-grc-resilience.md) | Risk analysis, BIA, RTO/RPO, continuity, backups |
| Security+ | [Physical Security](security-plus-physical.md) | Physical controls, attacks, environmental protection |
| Networking | [Networking Fundamentals](networking-fundamentals.md) | OSI, devices, IP, subnetting, IPv6, routing, NAT, VLANs, STP |
| Networking | [Protocols & Ports](networking-ports.md) | Common services, ports, DNS records, DHCP |
| Networking | [Network Services](networking-services.md) | DNS/DHCP/NTP, VPN/IPsec, SNMP, Syslog, NetFlow, wireless |
| Networking | [Network Recon](network-recon.md) | Passive/active recon, Nmap, enumeration, authorized test scope |
| Networking | [Network Attacks](network-attacks.md) | ARP, MAC flooding, VLAN hopping, DoS, MITM, wireless attacks |
| Networking | [Packet Analysis](packet-analysis.md) | Wireshark/tcpdump filters and triage |
| Networking | [Troubleshooting](network-troubleshooting.md) | Evidence-driven troubleshooting workflow |
| Tools | [Security Tools](security-tools.md) | Recon, threat intelligence, Sigma CLI, Splunk, CyberChef, John, Metasploit |
| Blue Team | [Splunk & Sigma](splunk-sigma.md) | YAML-to-SPL conversion, detection logic, testing limits |
| Linux | [Linux Security Commands](linux-security.md) | Permissions, processes, files, logs, network, SELinux |
| Linux | [Linux Shell & Git](linux-shell-git.md) | Shell operators, Bash, SetUID, cron, Git, encoding |
| Windows/AD | [Windows Security](windows-security.md) | CMD/PowerShell host triage, process and logon events |
| Windows/AD | [Windows & Active Directory](windows-ad.md) | AD, Kerberos, DNS, GPO, security events |
| Web | [Web Security](web-security.md) | OWASP, input handling, sessions, SAST/DAST, SQLi, XSS, CSRF |
| Human Layer | [Phishing & Social Engineering](phishing-social-engineering.md) | Phishing triage, email authentication, awareness |
| Blue Team | [SOC & Detection](soc-detection.md) | SIEM, logs, IDS/IPS, EDR/XDR, alert triage |
| Blue Team | [Digital Forensics](forensics.md) | Evidence, volatility, acquisition, analysis |
| Crypto | [Cryptography](cryptography.md) | Hashing, signatures, PKI, key management, TLS |

## Source coverage

The current index accounts for **176 substantive topic notes** across all four note collections:

| Note collection | Topic notes mapped |
|---|---:|
| Security+ First Batch | 61 / 61 |
| Security+ Second Batch | 31 / 31 |
| Security+ Third Batch | 30 / 30 |
| Networking | 26 / 26 |
| Linux | 28 / 28 |
| **Total** | **176 / 176** |

Reference-only material such as source-image indexes, page-coverage metadata, and traceability files was not counted as additional study topics.

See [NOTES-COVERAGE.md](NOTES-COVERAGE.md) for the topic-range mapping to cheatsheet domains.

## Writeup and detection coverage

The sheets include practical material from `writeups/` and `detections/`: reconnaissance, Nmap, DNS/DHCP, packet capture, network attacks, CyberChef, John, Metasploit, Windows/AD, SIEM, threat intelligence, incident response, forensics, web testing, Sigma rule structure, YAML-to-SPL conversion, Windows failed-logon correlation, and encoded-PowerShell detection.

The two newer Windows detections are marked **experimental**. Their writeups distinguish synthetic-fixture tests and converter checks from validation against real Windows telemetry. See [Splunk & Sigma](splunk-sigma.md).

## Security+ priority

Current SY0-701 domain weights are **4.0 Security Operations (28%) → 2.0 Threats, Vulnerabilities & Mitigations (22%) → 5.0 Security Program Management & Oversight (20%) → 3.0 Security Architecture (18%) → 1.0 General Security Concepts (12%)**.

The repository contains the long-form study material; this folder is the fast-revision layer.