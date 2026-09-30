# DNS Attacks & URL Hijacking

## Overview
DNS attacks target the name-resolution system or the relationship between domains and destinations. Domain hijacking changes control of a registered domain; URL hijacking uses deceptive or look-alike URLs to redirect users.

## Core concepts
- DNS poisoning can cause clients to receive incorrect answers, redirecting them to an attacker-controlled destination.
- Domain hijacking occurs when an attacker gains control of domain registration or DNS-management credentials.
- URL hijacking includes typosquatting, brand impersonation, homograph attacks, and deceptive top-level domains.
- DNSSEC can provide cryptographic validation for DNS data when correctly deployed and validated.

## Practical examples
- A look-alike domain such as `micros0ft.example` can visually resemble a legitimate brand while pointing elsewhere.

## Security / mitigation
- Use strong registrar/DNS-account authentication, MFA, registrar lock features, DNSSEC where appropriate, protective monitoring, and user education.
- Validate domains carefully rather than relying only on page appearance.

## Detection / troubleshooting
- Monitor DNS record changes, registrar-account activity, new look-alike domains, unexpected redirects, and certificate/hostname changes.

## Detailed notes captured from the notebook
# DNS Attacks & URL Hijacking

# DNS Attacks
## DNS Poisoning
- Modify DNS server
- Modify client host file
- Send a fake response to a valid DNS request
  - results MITM attack
  - physical network alter[nate]
- Anyway redirect user to a malicious website

## Domain Hijacking
- Get access to domain registration & you control where traffic flows
- Many ways to get into account
  - brute force
  - social eng etc.
- E.g. Brazilian bank

## Domain hijacking example
- Brazilian bank
- Oct 22, 2016, 1PM
- hackers controlled 36 domains for 6 hours
  - [until] they? were the bank [wording unclear]

# URL hijacking
- Very similar looking URL
- E.g. microsoft -> micros0ft
- Redirect to a competitor / malicious website

### Types
i) Typosquatting / brandsquatting
ii) Homograph spoofing
iii) Typoing error
iv) Different phase
v) Different TLD (top-level-domain)

## Further reading (optional)
[RFC 1034 — Domain Name System](https://www.rfc-editor.org/rfc/rfc1034.html)
