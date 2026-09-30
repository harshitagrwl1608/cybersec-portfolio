# Security Controls

## Overview
Security controls are safeguards that reduce risk. Security+ commonly groups them by implementation category—managerial, operational, technical, and physical—and also describes them by function such as preventive, deterrent, detective, corrective, compensating, and directive.

## Core concepts
- Managerial controls are governance decisions: policies, standards, risk processes, and oversight.
- Operational controls are procedures performed by people: training, reviews, incident response, and change processes.
- Technical controls are implemented through technology: firewalls, MFA, encryption, EDR, and access-control systems.
- Physical controls protect facilities and hardware: locks, guards, cameras, barriers, and environmental controls.
- A single objective can use multiple categories—for example, preventing unauthorized entry may use a policy, badge reader, guard, and logging.

## Practical examples
- A password policy is managerial; a password-reset procedure is operational; MFA is technical; a locked server room is physical.

## Security / mitigation
- Map controls to identified risks and verify that the control actually operates as designed.
- Use compensating controls when the preferred control is not feasible.
- Review controls after architecture or threat changes.

## Detection / troubleshooting
- Control failures show up as policy violations, failed authentication, unauthorized configuration changes, physical-access alerts, and audit findings.

## Detailed notes captured from the notebook
# Security Controls

# Security controls
- Protect any asset
- Prevent security events
- Minimize impact/damage

## Control categories
1. **Technical controls**
   - Controls implemented using system
   - OS controls
   - Firewall, AV
2. **Managerial controls**
   - Admin control associated with security object implementation
   - Security policies
   - Operational procedures
3. **Operational controls**
   - Controls implemented by people
   - E.g. security guards, awareness program

## Physical controls
- Limit physical access

### 1) Preventive control types
- Block access to a resource
- E.g. firewall rules, security policy, guard, door lock

### 2) Deterrent control types
- Discourage an intrusion attempt
- Make think again
- E.g. splash screens, demolition threat, warning signs

### 3) Detective control types
- Identify / log an intrusion attempt
- Find the issue
- E.g. system log, patrols, detectors

### 4) Corrective control types
- Apply control after detection
- Reverse impact / minimize impact
- E.g. backup restoration in case of ransomware

### 5) Compensating control types
- Control used when existing controls aren't sufficient
- May be temp[orary]
- E.g. firewall for a VLAN until it is fixed; backup power sources

### 6) Directive control types
- Direct a subject towards security compliance
- Do this please!
- E.g. adhere to / follow / comply with policy

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
