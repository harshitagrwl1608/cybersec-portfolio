# Encryption Technologies

## Overview
Encryption technologies are implementations that apply cryptography to particular use cases. Security design should distinguish data protection, key exchange, authentication, and integrity functions rather than assuming one technology does everything.

## Core concepts
- TLS protects application traffic in transit and authenticates endpoints with certificates.
- IPsec can protect IP-layer traffic and is common in VPNs.
- SSH provides authenticated secure remote administration and tunneling.
- Disk/database encryption protects stored data; PKI and digital signatures support identity and integrity.

## Practical examples
- An administrator may use SSH for management, TLS for a web application, and full-disk encryption for endpoint storage at the same time.

## Security / mitigation
- Choose technologies according to the layer and threat model, keep them patched, and disable obsolete protocol versions/ciphers.

## Detection / troubleshooting
- Monitor handshake failures, VPN tunnel changes, unusual remote-management sessions, and crypto-policy violations.

## Detailed notes captured from the notebook
# Encryption Technologies

# Encryption Technologies
## Trusted Platform Module (TPM)
- A specification for cryptographic function
  - Crypto hardware on a device
- Cryptography processor -> completely random
- Persistent memory

## Hardware Security Module (HSM)
- Used in large env
- High-end cryptographic hardware
  - custom & redundant power
  - securely store thousands of hardware keys
  - prevent unauthorized access
  - cryptographic accelerators

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
