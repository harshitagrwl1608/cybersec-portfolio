# Incident Response and Incident Planning
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 4.8 – Incident Response → Incident Response / Incident Planning
**Coverage:** source pages 80–83

## Security incidents
Examples in the notes include a user clicking an email attachment that executes malware, denial-of-service events, and data breaches.

## NIST incident-response lifecycle
The notebook references NIST SP 800-61 and describes:
1. Preparation.
2. Detection and analysis.
3. Containment, eradication, and recovery.
4. Post-incident activity.

NIST's current publication is SP 800-61 Rev. 3, published in 2025; the notebook retains the older shorthand reference to “SP 800-61.”

## Preparation
Prepare:
- Communication methods and the right people.
- Incident-handling hardware/software.
- Network diagrams/baselines.
- Incident-mitigation software.
- Backups and clean OS images.
- Policies.

## Detection challenge
Detection can require many sources and produce large volumes of data. Attackers may operate continuously, legitimate activity may resemble attacks, and incidents can be complex.

## Analysis
Analysis asks:
- What happened?
- What systems/users were involved?
- What evidence supports the hypothesis?
- What logs, endpoints, network data, or cloud data correlate with the event?

An attacker's behavior can be discovered through antivirus detection, host-based monitoring, configuration changes, network-traffic anomalies, or other signals.

## Isolation / containment
The notes emphasize: **stop it, isolate it — do not just watch it.** Isolation can be necessary to prevent additional damage while preserving enough evidence for investigation.

## Sandboxing
The notes describe an isolated operating system/environment that can be used to run and analyze malware safely. A sample can be executed in the sandbox and then the environment can be reset/deleted after examination.

## Recovery
The notes summarize recovery as:
- Get things back to normal.
- Eradicate malicious code/exploits.
- Correct the vulnerability.
- Restore from backups.
- Re-check and clean everything.

## Lessons learned
After the incident, ask:
- What happened?
- Why did it happen?
- How quickly was it addressed?
- What should change for the future?

## Training / exercises
The notes list incident exercises such as:
- Tabletop exercises.
- Fail-over tests.
- Simulations.
- Root-cause analysis.
- Threat hunting.

Incident planning should occur before an incident, and exercises should test rules of engagement, evaluation, remediation, and communication.
