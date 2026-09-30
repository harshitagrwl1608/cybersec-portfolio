# Certificate Revocation & OCSP

## Overview
Certificate revocation invalidates a certificate before its natural expiration. Common mechanisms include certificate revocation lists (CRLs) and Online Certificate Status Protocol (OCSP). Modern deployments may also use stapled status information.

## Core concepts
- CRLs are signed lists of revoked serial numbers published by the CA.
- OCSP lets a relying party query a responder about a certificate's status.
- OCSP stapling lets a server provide signed status information during TLS rather than requiring every client to contact the CA directly.
- Revocation checking has operational trade-offs including privacy, availability, latency, and fail-open/fail-closed behavior.

## Practical examples
- A compromised private key may cause the corresponding certificate to be revoked immediately rather than waiting for expiration.

## Security / mitigation
- Maintain reachable revocation infrastructure, rotate compromised keys, and monitor certificate lifecycle events.

## Detection / troubleshooting
- Look for revoked certificates in active use, OCSP failures, unexpected revocation requests, and large changes in certificate inventory.

## Detailed notes captured from the notebook
# Certificate Revocation & OCSP

# Wildcard Certificates
- Lists / adds identification info
- Allows a cert to support many different domains
- Wildcard domain -> certificate based on name of the server
- Wildcard domain will apply to all server names in domain
- E.g. `*.bingt2dev.live` [as written]

# Key Revocation
- Certificate Revocation List (CRL)
- Replacing all compromised cert.
- April 2014 - CVE-2014-0160
  - Heartbleed
  - OpenSSL flaw

## OCSP stapling
- Online Certificate Status Protocol
  - Provides security for OCSP checks
- Checking each cert manually to whether or not it is in revocation list of CA is not scalable (efficient)
- Instead have the cert holder verify their own status instead on centralized server
- Stapler is still standard, it can be [wording unclear]

Example commands from notes:
`nmap -p 443 --script ssl-enum-ciphers <domain>`
`openssl s_client -connect <domain>:443 -servername <domain>`
`# only cert`

# Getting revocation details into the browser
- Browser itself can handle all check with OCSP stapling
- msgs usually sent to OCSP responder via HTTP
  - more efficient than downloading CRL
- Many browsers don't support OCSP same way / don't implement it properly
  - worth checking

## Further reading (optional)
[RFC 5280 — Revocation / OCSP](https://www.rfc-editor.org/rfc/rfc5280.html)
