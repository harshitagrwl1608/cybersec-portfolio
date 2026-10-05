# Monitoring Data, DLP, Endpoint Security and XDR
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 4.5 – Enterprise Security → Monitoring Data / DLP / Endpoint Security / XDR
**Coverage:** source pages 91–96

## File Integrity Monitoring (FIM)
Some application/system files are expected to change; others should not. FIM watches for changes and can use platform tools such as Windows System File Checker or Linux integrity tools. The notes recognize that some systems provide many hosted/third-party options.

## Data Loss Prevention (DLP)
DLP watches sensitive data flows and can stop/inspect them in real time. The notes divide locations into:
- **Computer:** data in use and endpoint DLP.
- **Network:** data in motion.
- **Server:** data at rest, including OS/server controls.

## USB blocking
The notes use a U.S. Department of Defense example where local DLP agents were deployed to block USB storage devices after all devices had to be updated. The control can help prevent removable-media exfiltration or unauthorized transfer.

## Cloud-based DLP
Cloud DLP can be positioned where users/data traverse network services and can block custom-defined data sharing, manage URLs/access, and help block malware/virus-related transfer paths.

## Email DLP
Email DLP can inspect inbound and outbound mail. The notes list controls for blocking suspicious keywords, spam links, and suspicious content; outbound controls can detect unusual wire transfers, W-2 transmission, and similar sensitive-data movement.

## Endpoint security
Endpoints provide users access to applications and data across many platforms, so layered defense is required.

### Edge vs access control
**Control at the edge** in the notes is associated with perimeter links, firewall rules, and controls that are comparatively static. **Access control** is based on who is asking for access and can be more dynamic, with rules that are easier to change/revoke.

## Posture assessment
Before a device connects, the environment can check:
- Is the device trusted?
- Is it running required updates?
- Is it following compliance policies?
- Is required software installed?
- Is disk encryption enabled?
- What device type/platform is it?

### Health-check approaches
- **Persistent agent:** software is installed and checks continuously/regularly for required updates.
- **Disposable agent:** temporarily runs a posture check during access assessment and then removes itself.
- **Agentless NAC:** integrates with directory/services and checks posture at login/logoff or at connection time.

## Failing assessment
If posture assessment fails because a device is too dangerous/non-compliant, the notes propose quarantining/isolating it, notifying the appropriate administrator, correcting the issue, and trying again.

## EDR
EDR scales endpoint detection across many endpoints. The notes associate EDR with:
- Signature and behavioral analysis.
- Machine learning/process monitoring.
- Endpoint/network/log context.
- Investigation and root-cause analysis.
- Response actions such as quarantine/rollback.
- API-driven automation.

## XDR
Extended Detection and Response correlates endpoint, network, and cloud data to improve detection rates and simplify security-event investigations. The notes say XDR can help reduce false positives and missed detections, but requires substantial monitoring and continuous updating.

## User Behavior Analytics
UBA extends anomaly detection to user and host behavior. It watches users/hosts/traffic repositories, establishes a normal baseline, and identifies unusual deviations. The notes emphasize that good UBA generally requires long-term data analysis.

## Key XDR point
Analyze large amounts of data, correlate it, and respond accordingly. Look for anything unusual; the change may happen quickly, but effective monitoring and tuning are continuous. Real-time detection improves how early a threat is caught.
