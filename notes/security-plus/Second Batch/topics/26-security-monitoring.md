# Security Monitoring
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 4.4 – Security Monitoring → Security Monitoring
**Coverage:** source pages 69–71

## Continuous monitoring
The notes describe security monitoring as a 24/7 activity. Monitoring should look for abnormal behavior, security events, and changes in the environment rather than only waiting for a major incident.

## Monitoring computing resources
### Systems
Gather information about:
- Storage.
- Servers.
- Monitoring/backup activity.

### Applications
Monitor:
- Availability and uptime.
- Response time.
- Data-transfer increases.
- Security/misconfiguration issues.

### Infrastructure
Monitor remote-access systems, firewall/IPS reports, increased attack activity, and related infrastructure signals.

## Log aggregation
Collect logs from different sources and formats into a central analysis system. The notes mention SIEM as a security-information/event-management destination and the usefulness of consolidating authentication logs, activity, access zones, and data-transfer events.

## Scanning
Perform periodic/continuous scans for vulnerabilities, especially across changing environments such as mobile devices. Record OS versions, drivers, installed applications, anomalies, and other useful system information.

## Reporting
Analyze collected data and generate reports such as:
- Incident/security reports.
- Status reports showing compliant/non-compliant devices.
- New-vulnerability summaries.
- Other information summaries.

## Archiving
Keep information for an appropriate period because incident investigations may take months and historical data can be critical.

## Alerting and remediation
Alerts should notify appropriate people quickly through mechanisms such as SMS, text, or email. Alert-response programs require tuning to reduce false positives and false negatives; the notes say that tuning improves with time.
