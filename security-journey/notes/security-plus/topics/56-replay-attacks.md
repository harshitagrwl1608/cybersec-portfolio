# Replay Attacks & Session Hijacking

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 108
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

### Page 109
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
