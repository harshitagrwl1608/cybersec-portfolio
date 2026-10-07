# Security Tools, SCAP, SIEM, DLP, SNMP, NetFlow and Log Data
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 4.4 / 4.9 – Security Monitoring / Security Data Sources → Security Tools / Security Data Sources
**Coverage:** source pages 72–79

## SCAP — Security Content Automation Protocol
The notes describe SCAP as a standard for bringing security tools together using a common identity of configuration/check criteria. It can validate security configuration, help identify security gaps, and support remediation/automation of non-compliant systems.

NIST's current SCAP release is **SCAP 1.4 / SP 800-126 Rev. 4 (June 2026)**, which standardizes how software flaws and security-configuration information are communicated and processed.

## Agent vs. agentless tools
**Agent-based:** install software on the device; agents can provide richer telemetry and real-time notification but must be maintained.

**Agentless:** no permanent agent installation; assessment/visibility may occur through remote checks. The notes emphasize differences in installation, real-time visibility, and operational overhead.

## SIEM
A SIEM aggregates security events/logs, applies correlation, and supports investigation. The notes describe staging/collecting events, log collection, reports, correlation, user-login activity, and forensic analysis.

## Antivirus / anti-malware
The notes describe anti-malware software as a way to detect/remove malicious software from devices.

## Data Loss Prevention (DLP)
DLP asks where sensitive data exists and watches/control flows involving it. The notes mention:
- Endpoint DLP.
- Network/cloud-based DLP.
- Email and collaboration channels.
- Blocking or controlling sensitive-data leakage.

## SNMP
Simple Network Management Protocol allows management systems to query network devices. The notes describe a database/MIB containing object identifiers, polling devices at intervals, and building performance graphs from collected data.

## SNMP traps
Most SNMP monitoring expects polling, but traps can be configured on devices to send threshold-based notifications. The notes give the example of a device sending an alarm after CPU usage exceeds a configured threshold.

## NetFlow
NetFlow/flow telemetry provides traffic-flow statistics. A probe/collector architecture can record flows without necessarily inspecting complete packet payloads. The notes describe collecting traffic information from switches/routers or mirrored hardware and using a separate reporting application.

## Vulnerability scanners
Typically minimally invasive. They identify systems, versions, and vulnerabilities and can gather information for comparison/checking.

## Log data
The notes list:
1. Firewall logs — deep packet inspection/URL filtering/anomalies.
2. Application logs — application-specific information sent to SIEM.
3. Endpoint logs — authentication, process, system events, and related telemetry.
4. OS security logs — security events such as failed logins, file changes, authentication details.
5. IDS/IPS logs — common attack data, source/destination, IPs, ports, attack types.
6. Network logs — router/switch infrastructure changes, routing updates, connectivity/security issues.
7. Metadata — information about other data: headers, sending servers, phase/type, OS/browser/IP/file details.
8. Vulnerability-scan results — missing controls, misconfigurations, and vulnerabilities.
9. Automated reports — generated periodically and may require human review/interpretation.
10. Dashboards — real-time status, structured summaries, graphs, performance views, customizable displays.
11. Packet capture — fundamental for analyzing protocol/application problems and detailed traffic; Wireshark is given as an example.
