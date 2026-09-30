# Privilege Escalation

## Overview
Privilege escalation occurs when an attacker or user gains permissions beyond what the current account should have. Vertical escalation moves to a higher privilege level; horizontal escalation accesses another user's resources without necessarily gaining higher system privilege.

## Core concepts
- Local privilege escalation may target OS or application weaknesses after initial access.
- Remote privilege escalation occurs through services or applications exposed over the network.
- Mitigations include timely patching, least privilege, secure configuration, DEP/NX, ASLR, application isolation, and access reviews.

## Practical examples
- A normal user exploiting a vulnerable service to gain administrator/root permissions is vertical escalation.

## Security / mitigation
- Remove unnecessary admin rights, patch known vulnerabilities, protect credentials, and use application controls.

## Detection / troubleshooting
- Monitor privilege-group changes, new admin sessions, suspicious child processes, token/credential abuse, and unusual access to protected resources.

## Detailed notes captured from the notebook
- Gain high level access
  - exploit any vuln
- Check access capabilities
- High-priority vul not patched
- Horizontal privilege escalation
  - lower vs same-level-user & access??

## Prevention
- Quick patch
- AVD
- Data Execution Prevention
  - only data is exec area on RAM
- Address space layout randomization
  - E.g. prevent attacker guessing at a known memory addr

Example: **CVE: 2023-29336**
- Windows elevation of privilege
- reach highest level access (highest)

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
