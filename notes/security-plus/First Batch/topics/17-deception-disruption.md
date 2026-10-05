# Deception & Disruption

## Overview
Deception and disruption change attacker behavior or waste attacker effort. Deception can provide early-warning signals while disruption can interrupt malicious activity or mislead the attacker.

## Core concepts
- Honeypots are systems intended to attract or observe unauthorized activity.
- Honeytokens are fake secrets or identifiers that should not be used legitimately; use of one can trigger an alert.
- Decoy accounts/files can reveal lateral movement or reconnaissance.
- Disinformation or controlled deception can influence an adversary's understanding of the environment.

## Practical examples
- A honeytoken credential placed where legitimate users never need it can alert when an attacker attempts to use it.

## Security / mitigation
- Keep deceptive assets isolated and monitored, and make sure legitimate users cannot accidentally depend on them.

## Detection / troubleshooting
- Any access to a well-controlled decoy resource is high-interest telemetry and should be correlated with the source host, account, time, and action.

## Detailed notes captured from the notebook
# Deception & Disruption

# Deception & Disruption
1. **Honeypots**
   - Attract attacker
   - Virtual machine to keep them busy
   - Monitor activity
2. **Honeynets**
   - Multiple honeypots
   - Large deception network
3. **Honeyfiles**
   - Fake info files
   - E.g. passwords.txt
4. **Honeytokens**
   - Track malicious actors
   - Add some traceable data
   - E.g. API credentials, fake email

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
