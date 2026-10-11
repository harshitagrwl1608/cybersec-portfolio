# Notes → Cheatsheet Coverage

**Coverage status: 176 / 176 substantive topic notes mapped.**

This file documents the coverage design behind `cheatsheets/`. Topic numbers refer to the indexes in each of the five collections. Source-image indexes and page-level traceability files are references, not additional study topics.

Source indexes: [Security+ Batch 1](../notes/security-plus/First_Batch/INDEX.md) · [Security+ Batch 2](../notes/security-plus/Second_Batch/INDEX.md) · [Security+ Batch 3](../notes/security-plus/Third_Batch/INDEX.md) · [Networking](../notes/networking/QUICK-INDEX.md) · [Linux](../notes/linux/README.md).

## Security+ — First Batch (61 topics)

| Note range | Main coverage |
|---|---|
| 01–09 | Network fundamentals, troubleshooting, routing/IP, performance, network tools → `networking-fundamentals.md`, `networking-services.md`, `network-recon.md`, `network-troubleshooting.md`, `security-tools.md` |
| 10–18 | Controls, non-repudiation, AAA, authentication/authorization, gap analysis, Zero Trust, physical security, deception, change management → `security-plus-core.md`, `iam-access-control.md`, `security-plus-governance.md`, `security-plus-physical.md` |
| 19–31 | PKI, escrow, encryption, key exchange, TPM/HSM, secure enclave, tokenization/masking, hashing, blockchain, certificates, revocation/OCSP → `cryptography.md` |
| 32–34 | Threat actors, vectors, social engineering → `security-plus-threats.md`, `phishing-social-engineering.md` |
| 35–46 | Memory injection, buffer overflow, race conditions, malicious updates, OS/cloud/hardware/mobile/zero-day vulnerabilities → `security-plus-vulnerabilities.md`, `vulnerability-management.md` |
| 47–50 | Malware, viruses/worms, spyware/bloatware, keyloggers/rootkits/logic bombs → `security-plus-threats.md`, `security-plus-vulnerabilities.md` |
| 51–56 | Physical attacks, DoS, DNS attacks, wireless attacks, on-path, replay/session attacks → `security-plus-physical.md`, `network-attacks.md`, `security-plus-threats.md` |
| 57–61 | Malicious code, application attacks, privilege escalation, CSRF, directory traversal → `security-plus-threats.md`, `web-security.md`, `security-plus-vulnerabilities.md` |

## Security+ — Second Batch (31 topics)

| Note range | Main coverage |
|---|---|
| 01–03 | Cryptographic attacks, password attacks, IoCs → `cryptography.md`, `security-plus-threats.md`, `soc-detection.md` |
| 04–06 | Segmentation/access control, mitigation, hardening → `security-plus-mitigation.md`, `iam-access-control.md` |
| 07–17 | Cloud, microservices/APIs, network infrastructure, virtualization, IoT/SCADA/RTOS, secure infrastructure, appliances, 802.1X, firewalls, VPN/IPsec, SD-WAN/SASE → `security-plus-architecture.md`, `networking-services.md`, `security-plus-mitigation.md` |
| 18–20 | Data types/classification, data states/sovereignty/geolocation, protecting data → `security-plus-governance.md`, `cryptography.md` |
| 21–24 | HA, recovery testing, backups, power resiliency → `risk-grc-resilience.md`, `security-plus-architecture.md` |
| 25–27 | Secure baselines, monitoring, SIEM/DLP/SNMP/NetFlow/log data → `security-plus-governance.md`, `soc-detection.md`, `networking-services.md` |
| 28–29 | Incident response/planning, digital forensics/e-discovery → `incident-response.md`, `forensics.md` |
| 30–31 | Firewalls/web filtering, DLP/endpoint/XDR/posture → `security-plus-mitigation.md`, `soc-detection.md` |

## Security+ — Third Batch (30 topics)

| Note range | Main coverage |
|---|---|
| 01–03 | Wireless/mobile security, application security, Sigma rules → `security-plus-architecture.md`, `security-plus-mitigation.md`, `web-security.md`, `soc-detection.md`, `splunk-sigma.md` |
| 04–09 | Asset lifecycle, vulnerability scanning, threat intelligence, penetration testing, vulnerability analysis and remediation → `security-plus-governance.md`, `vulnerability-management.md`, `security-tools.md`, `soc-detection.md` |
| 10–14 | OS security, secure protocols, email security, IAM, scripting and automation → `windows-ad.md`, `linux-security.md`, `networking-services.md`, `networking-ports.md`, `phishing-social-engineering.md`, `iam-access-control.md`, `linux-shell-git.md` |
| 15–20 | Security policies, continuity, incident response/SDLC/change, standards/procedures, regulatory considerations, data roles → `security-plus-governance.md`, `incident-response.md`, `risk-grc-resilience.md`, `iam-access-control.md`, `web-security.md` |
| 21–25 | Risk analysis, BIA, third-party assessments, agreements, compliance → `risk-grc-resilience.md`, `security-plus-governance.md`, `vulnerability-management.md` |
| 26–30 | Privacy, data inventory/retention, audits, penetration testing/recon, awareness and training → `security-plus-governance.md`, `risk-grc-resilience.md`, `network-recon.md`, `vulnerability-management.md`, `phishing-social-engineering.md` |

## Networking — 26 topics

| Note range | Main coverage |
|---|---|
| 01–05 | OSI, devices, IP/ARP/DHCP, cloud/VPC, common protocols/ports → `networking-fundamentals.md`, `networking-ports.md` |
| 06–07 | IPsec/VPN, addressing, routing, NAT/PAT → `networking-services.md`, `networking-fundamentals.md` |
| 08–10 | Wireless/cellular, cabling/transceivers, topologies/architecture → `networking-fundamentals.md`, `networking-services.md` |
| 11–15 | IPv4/subnetting, IPv6/NDP/SLAAC, routing/FHRP, NAT/VLAN/trunking, STP/L2 security → `networking-fundamentals.md`, `network-attacks.md` |
| 16–19 | Wireless security, DHCP/DHCPv6, DNS, NTP/NTS/PTP → `networking-services.md`, `network-attacks.md` |
| 20–21 | Network management/SNMP/logging/SIEM/NetFlow, VPN/remote access → `networking-services.md`, `soc-detection.md` |
| 22–24 | Zero Trust/access, PKI/IAM/AAA, segmentation/IoT/OT → `security-plus-core.md`, `iam-access-control.md`, `security-plus-architecture.md` |
| 25–26 | Network attacks/L2/social engineering/malware, device security/ACLs/filtering/zones → `network-attacks.md`, `security-plus-mitigation.md`, `phishing-social-engineering.md` |

## Linux — 28 topics

| Note range | Main coverage |
|---|---|
| 01–04 | Terminal, files, find, grep, pipes, redirection → `linux-shell-git.md`, `linux-security.md` |
| 05–09 | SSH/SCP, permissions, filesystem, DIRB → `linux-security.md`, `linux-shell-git.md`, `security-tools.md` |
| 10–15 | sort/uniq/strings, Base64/ROT13/hexdump, magic bytes/tar, SSH keys, netcat, OpenSSL → `linux-shell-git.md`, `security-tools.md`, `cryptography.md` |
| 16–22 | chmod, file comparison, SetUID, cron, globbing, loops, shell escapes → `linux-security.md`, `linux-shell-git.md` |
| 23–26 | Git basics, history/recovery, objects, object inspection/push → `linux-shell-git.md` |
| 27–28 | Bash special parameters, environment variables/PATH → `linux-shell-git.md`, `linux-security.md`

## Additional practical detection artifacts

These are mapped in addition to the topic-note count above:

- **Windows failed-logon correlation:** Event ID 4625, grouped by username and source IP, threshold 5+ within 2 minutes → `soc-detection.md`, `splunk-sigma.md`.
- **Encoded PowerShell command:** process creation plus an encoded-command switch → `windows-security.md`, `soc-detection.md`, `splunk-sigma.md`.
- **Sigma-to-SPL workflow:** install Sigma CLI/backend, convert the YAML, inspect field mapping, and test positive and negative fixtures → `splunk-sigma.md`, `security-tools.md`.

These newer detections are experimental. Synthetic-fixture checks and syntax/conversion checks must not be presented as proof that the rules work against real endpoint telemetry.