# Replay Attacks & Session Hijacking

## Overview
Replay attacks reuse previously captured valid data or tokens to impersonate a party. Session hijacking similarly abuses a valid session identifier or authentication state so the attacker acts as the victim.

## Core concepts
- Replay does not necessarily require an on-path attacker at the moment of reuse; the attacker may capture data and replay it later.
- Session cookies and session IDs are valuable because possession may be enough to act as the authenticated user.
- Nonces, timestamps, sequence numbers, short-lived tokens, and channel binding can reduce replay risk.

## Practical examples
- A captured session token reused from another location can become a session-hijacking event if the application does not detect or prevent the reuse.

## Security / mitigation
- Use TLS, secure/HttpOnly/SameSite cookies as appropriate, short session lifetimes, token rotation, MFA, and anomaly detection.
- Invalidate sessions after credential reset or suspected compromise.

## Detection / troubleshooting
- Monitor token reuse, simultaneous sessions from distant locations, unusual user agents, and repeated authentication from new devices.

## Detailed notes captured from the notebook
# Replay Attacks & Session Hijacking

# Replay Attacks
- Usually info transmitted over internet
  - crafty bad actor will take advantage of this
- Need access to your network data
- Gathered info may help attacker
  - replay data to pose as someone else
  - like talking to a server, auth etc.
- NOT an on-path attack
  - replay attack does not need MITM

## i) Pass the hash
- Physically tapping network & gaining username and password
  - using same to auth to server
- use salting & encryption

## ii) Browser cookies & session IDs
- cookies info stored in your comp.
- lots of info of interest to attacker
- used for tracking, personalization, non-acc[e]ss [as written]

- Session IDs are lost
  - user show access to session
  - no need to username or password

## iii) Header Manipulation
- Still gathering
  - user/website, whoisnet, bisnet etc. [unclear]
- Exploit XSS
- Modify headers
  - Tamper, Fire?keep, proxy [as written]
- Modify cookies

### How to prevent hijacking
- Encrypt end to end
  - no capturing of data info.
  - HTTPS only
- Avoid capture on local
  - Encrypt end-to-end some?
  - E.g. Personal VPN

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
