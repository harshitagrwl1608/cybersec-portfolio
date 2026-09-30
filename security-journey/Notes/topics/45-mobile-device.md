# Mobile Device Vulnerabilities

## Overview
Mobile devices concentrate identity, communications, applications, credentials, and personal data in portable hardware. Their mobility, limited administrative oversight, and third-party apps create a distinctive attack surface.

## Core concepts
- Rooting/jailbreaking removes or weakens built-in platform restrictions.
- Sideloading installs applications outside the normal managed app distribution path and can bypass some platform controls.
- MDM/UEM can enforce policies, encryption, screen lock, approved apps, and remote wipe where supported.

## Practical examples
- A sideloaded application with excessive permissions can access data that would have been protected by the normal app-store trust model.

## Security / mitigation
- Use supported OS versions, device encryption, screen locks, MDM where appropriate, app allow-listing, and least-privilege permissions.

## Detection / troubleshooting
- Look for new device enrollments, unknown applications, root/jailbreak indicators, unusual data use, and repeated authentication failures.

## Detailed notes captured from the notebook
# Mobile Device Vulnerabilities

# Mobile Device Vulnerability
## Mobile device security
- Challenging to secure
  - systems needs admin systems & policies
- Relatively small
- Always in motion
- Packed with sensitive data
- Constantly connected to Internet

## Jailbreaking / Rooting
- Have purpose-built systems
  - don't have access to OS
- Gaining access
  - Android -> Root
  - iOS -> Jailbreaking
- Installing custom firmware
- Uncontrolled access
- No MDM / security

# Sideloading
- Malicious apps can be a concern
  - Trojan horse
- Manage installation sources
- Sideloading circumvents security
  - Installing apps manually
  - without using app store
  - MDM becomes useless

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
