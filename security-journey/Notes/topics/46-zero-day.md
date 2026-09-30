# Zero-Day Vulnerabilities

## Overview
A zero-day vulnerability is a vulnerability that is unknown to the party responsible for fixing it or lacks an available patch when exploitation begins. Defenders therefore have less warning and may need compensating controls.

## Core concepts
- Zero-day refers to the defender/vendor's remediation window, not simply the age of the vulnerability.
- Mitigations can include segmentation, application control, attack-surface reduction, virtual patching, and behavioral detection.
- Once a patch is available, normal vulnerability-management processes become important, but unpatched exposure may persist for some time.

## Practical examples
- A newly exploited browser vulnerability may require temporary controls such as disabling a feature or isolating the affected application until a vendor fix is available.

## Security / mitigation
- Use defense in depth, rapid threat intelligence, exploit mitigations, and temporary compensating controls.

## Detection / troubleshooting
- Behavioral anomalies, exploitation alerts, suspicious child processes, and unusual network activity may reveal active exploitation even before a patch exists.

## Detailed notes captured from the notebook
# Zero-Day Vulnerabilities

# Zero-Day Vulnerabilities
## Vulnerabilities
- There are always vulnerabilities
  - not found yet
- Someone is always searching
  - either researcher / hacker
  - with diff agenda

## Zero-Day Attacks
- Attackers search for unknown vuln
  - can create exploits
- Vendor has no idea it exists
  - no fix / patch
- Zero-day attacks
  - may attack without a patch
  - race to exploit vuln. vs creating a patch
  - diff. to defend against unknown
- CVE’s

## Examples
1. **April 2023**
   - Chrome zero-day
   - memory corruption, sandbox escape
2. **May 2023 Apple iOS, iPadOS zero-day**
   - three zero-days
   - sandbox escape, disclosure of sensitive info, arbitrary code execution
   - Active exploit

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
