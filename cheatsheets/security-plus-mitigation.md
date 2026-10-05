# Security+ Mitigation & Hardening

## Core hardening
**Patch → remove unnecessary services → change defaults → least privilege → secure configs → monitor → test.**

- Disable unused ports/services.
- Remove unsupported/legacy software.
- Use secure baselines and configuration management.
- Enforce MFA and strong authentication.
- Encrypt data at rest/in transit where appropriate.
- Back up critical data and test restores.

## Segmentation
Physical = physically separate.  
Logical = VLAN/subnet/policy separation.  
Virtual = separation in virtual/cloud environments.

**Goal:** limit lateral movement + blast radius + unnecessary access.

## Firewalls
| Type | Best cue |
|---|---|
| Packet filtering | Header/ACL filtering |
| Stateful | Tracks connection state |
| Proxy | Intermediary for traffic |
| NGFW | Application awareness + deep inspection |
| WAF | HTTP/HTTPS application protection |
| UTM | Multiple security functions in one appliance |

## Endpoint
Antivirus = malware prevention/detection.  
EDR = endpoint telemetry + detection + investigation + response.  
XDR = correlated detection across multiple security domains.

## NAC
**Identity/device posture → allow, quarantine, or deny network access.**

## Data protection
- Encryption = confidentiality.
- Hashing = integrity/verification.
- Masking = hide displayed values.
- Tokenization = replace sensitive value with token.
- Obfuscation = make content harder to understand; not a substitute for encryption.
- DLP = prevent/detect unauthorized data movement.

## Application control
Allow list = only approved applications run.  
Deny list = known-bad applications blocked.
