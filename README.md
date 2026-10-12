# Cybersecurity Portfolio — SOC / Blue-Team Track

B.Tech IT student at **J.C. Bose University of Science and Technology, YMCA, Faridabad**, building practical cybersecurity skills through networking, Linux, security fundamentals, TryHackMe labs, detection engineering, incident response and small security projects.

This repository is organized as a portfolio and learning record. Notes are intended to stand on their own; source images are retained separately for reference.

## Learning path

**Networking → Linux → TryHackMe → Security+ → SOC / Detection Engineering**

## Repository structure

| Folder | Purpose |
|---|---|
| `notes/` | Standalone learning notes for networking, Linux and Security+ |
| `writeups/` | Hands-on labs, TryHackMe writeups and focused technical exercises |
| `projects/` | Reproducible security labs and small builds |
| `detections/` | Detection content, separated by detection technology |
| `incident-reports/` | Incident-response reports and templates |
| `cheatsheets/` | Concise command and protocol references |
| `images/` | Screenshots/evidence retained for writeups and reference |

## Highlights

- Nmap host discovery, port scanning, service enumeration and OS detection
- Network troubleshooting and protocol fundamentals
- Linux command-line and filesystem/security concepts
- Windows and Active Directory fundamentals
- SIEM, log analysis, IDS and incident-response concepts
- OWASP web-security study notes and practical exercises
- UFW/Docker firewall testing lab
- Detection-rule development and MITRE ATT&CK mapping

## Featured Windows detections

### Windows brute-force detection

A Windows failed-logon building-block rule (Event ID 4625), with a walkthrough showing how to correlate **5+ failed logons for the same user and source IP within two minutes**.

- [Sigma rule](detections/sigma/Rule_1/windows_brute_force_detected.yml)
- [Manual detection write-up](detections/sigma/Rule_1/windows_brute_force_detection_writeup_manual.md)
- [Splunk walkthrough](detections/sigma/Rule_1/windows_brute_force_detection_writeup_with_splunk.md)

### Encoded PowerShell command execution

A process-creation detection for PowerShell or `pwsh` launched with `-EncodedCommand` or an abbreviation, using command-line telemetry.

- [Sigma rule](detections/sigma/Rule_2/Suspicious_Powershell_Command_Execution.yml)
- [Manual detection write-up](detections/sigma/Rule_2/suspicious_powershell_detection_writeup_manual.md)
- [Splunk walkthrough](detections/sigma/Rule_2/suspicious_powershell_detection_writeup_with_splunk.md)

**Validation status:** Both detections are experimental. The Sigma rules were parsed/linted with `sigma-cli`, and their converted Splunk queries were inspected; neither rule has been run against real telemetry. See the linked write-ups for the workflow and limitations.

## Documentation principles

- **Evidence over claims:** practical results are distinguished from conceptual examples.
- **Authorized testing only:** offensive-security material is intended for labs, CTFs and systems where testing is explicitly permitted.
- **Standalone notes:** a topic file should contain enough explanation to understand the topic without repeatedly consulting source screenshots.
- **Traceability:** original notebook/source images are retained separately when useful for verification.
- **No secrets:** public writeups use sanitized/redacted addresses, credentials, flags and personal data.

## Roadmap

See [ROADMAP.md](ROADMAP.md).

