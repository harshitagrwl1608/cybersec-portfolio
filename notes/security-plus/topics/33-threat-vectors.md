# Threat Vectors

## Overview
Threat vectors are the paths or mechanisms by which an attacker reaches a target. Understanding vectors helps map preventive controls before focusing on a particular exploit.

## Core concepts
- Common vectors include phishing, malicious attachments, drive-by downloads, exposed services, stolen credentials, removable media, supply-chain compromise, physical access, wireless attacks, and web applications.
- A threat vector describes the path; an exploit describes the technique used to abuse a weakness along that path.
- Defense-in-depth assumes one vector can bypass another control.

## Practical examples
- A phishing email may deliver a credential-theft link, while an exposed SSH service may be attacked directly without email involvement.

## Security / mitigation
- Reduce exposed services, enforce MFA, patch internet-facing software, filter email/web traffic, and segment networks.

## Detection / troubleshooting
- Monitor ingress points, authentication events, endpoint execution, exposed ports, malicious URLs, and unexpected inbound connections.

## Detailed notes captured from the notebook
# Threat Vectors

# Threat Vectors
## Message-based vectors
- One of the biggest and most successful paths because most people have at least one messaging channel.
- **Email**
  - Malicious links
- **SMS**
  - Links
  - Chain/message information
- **Phishing attacks**
  - People are encouraged to click links or open messages
  - May include malicious attachments or links
- **Social engineering attacks**

## Image-based vectors
- Very difficult to identify.
- Some image formats can be abused as an attack vector [handwritten wording partly unclear].
- Significant security concerns include: 
  - HTML injection
  - XSS attacks
- Browsers must provide appropriate input validation and safe processing.

## File-based vectors
- More than just executables; malicious content can be hidden inside otherwise ordinary file containers.
- **Adobe PDF**
  - File format with a long history of security-sensitive features/exploits.
- **ZIP/RAR archives**
  - Can contain multiple file types and nested content.
- **Microsoft Office documents**
  - Can contain active or malicious content depending on the format and security settings.

## Voice call vectors
- Vishing -> phishing over phone
- Spam over IP
- War dialing
  - unpublished phone no. that may get them system access
- Call tampering -> disrupting voice calls

## Removable device vectors
- Get around any defense / firewall
- Malicious software on USB
  - a single air-gapped network?
- USB drives act as keyboard
  - tracker on a chip
  - type command
- Data exfiltration -> USB
- E.g. insert USB in parking lot and hope someone plugs in

# Vulnerable software vectors
## Client based
- Internet
- Infected executable
- Malicious vuln. or unknown
- Require constant updates

## Agentless
- no installed etc.
- compromised software on device
- infect all users

# Unsupported systems vector
- Systems / tools not supported
  - e.g. outdated OS
- A single [system] could be an entry
  - Sometimes there is no check
- Requires a constant regular scanning of all devices & software

# Insecure network vectors
- Network connects everything
  - easy path
- E.g. wireless is outdated security protocols
  - open / rogue wireless networks
  - Wi-Fi / Bluetooth / etc.

# Short network service ports
- Short network-based services connect over TCP/UDP
  - simply an open port
- Every port is a vuln
  - more service -> more ports
- Firewall rules & auth.

# Default credentials
- Most devices has default username, password
  - switches, etc.
- CHANGE DEFAULTS ALWAYS

# Supply-chain vectors
- Tampering with the underlying infra
  - while manufacturing
  - after manufacturing
- MSPs (Managed System Providers)
  - access customers network
  - form starting point
- E.g. Target's breach data breach
- counterfeit hardware
  - 2020 -> fake USB switches

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
