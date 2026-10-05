# Mitigation Techniques
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 2.5 – Mitigation Techniques → Mitigation Techniques
**Coverage:** source pages 11–12

## 1. Patching
Patching is described as critically important because vulnerabilities need to be fixed regularly. Automatic updates are useful but should not be treated as the only control; emergency/out-of-band updates may be required for critical vulnerabilities.

## 2. Encryption
Encryption can prevent unauthorized access to application/data content. The notes identify:
- File-level encryption.
- Full-disk encryption (FDE).
- Application-data encryption.

## 3. Monitoring
Monitoring aggregates information from devices and sensors. Examples include:
- Intrusion-prevention/security telemetry.
- Firewall logs.
- Other log sources.
- Collectors feeding SIEMs/consoles.

## 4. Least privilege
Give a user/service the minimum rights and permissions required:
- No more than what is needed.
- Administrative access should not be the default.
- Use minimal privileges to reduce the blast radius of compromise.

## 5. Configuration enforcement
Perform a posture/configuration assessment whenever a device connects. The notes call for extensive checks such as OS version and EDR-related status. Systems outside compliance can be quarantined, for example into a restricted/private VLAN.

## 6. Decommissioning
Decommissioning should be a formal policy. Before discarding or recycling assets, data on storage devices must be handled securely. The notes explicitly call out secure disposal/recycling.
