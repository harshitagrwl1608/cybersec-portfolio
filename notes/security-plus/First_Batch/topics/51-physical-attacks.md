# Physical Attacks

## Overview
Physical attacks target facilities, equipment, or people rather than only software. Examples include forced entry, RFID/badge cloning, cable tampering, environmental disruption, and theft.

## Core concepts
- Physical attackers can bypass many software controls if they gain direct access to hardware.
- RFID badges can be cloned when weak technologies or poor physical controls are used.
- Environmental attacks may target power, cooling, fire protection, water, or other supporting systems.

## Practical examples
- A stolen laptop may be attacked offline even if its network account is protected by MFA; disk encryption is therefore important.

## Security / mitigation
- Use layered access control, device encryption, tamper detection, asset tracking, secure disposal, UPS/power protection, and environmental monitoring.

## Detection / troubleshooting
- Access-control logs, camera alerts, asset inventory discrepancies, unexpected reboots, and environmental sensor alarms are useful signals.

## Detailed notes captured from the notebook
- Old school trick
- gaining physical input
  - not interested in kernel, OS etc.
  - attacker may try any way

## i) Brake force
- Push through obstruction
- Check your physical security

## ii) RFID cloning
- RFID is everywhere (badge etc)
- Duplicates available easily on Amazon
  - takes seconds (brush up)
- MFA

## iii) Env. Attack
- attack everything supp technology
- power monitoring
- HVAC (Heating, Ventilation, Air coding)
- fire suppression
- take system down

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
