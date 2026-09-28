# Threat Vectors

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 55
# Threat Vectors
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

### Page 56
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

### Page 57
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
