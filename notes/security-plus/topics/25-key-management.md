# Key Management Systems & Privacy

## Overview
A Key Management System (KMS) centralizes lifecycle operations for cryptographic keys, while privacy controls limit unnecessary collection, exposure, and misuse of personal information.

## Core concepts
- A key lifecycle can include generation, distribution, activation, rotation, backup, revocation, archival, and destruction.
- Centralization improves consistency and auditability but makes the KMS a high-value asset.
- Privacy engineering focuses on minimizing collection, limiting use, retaining data only as needed, and controlling access.

## Practical examples
- A KMS can rotate encryption keys automatically and record which service requested each key operation.

## Security / mitigation
- Protect KMS administrators with strong MFA, dual control where appropriate, backups, HSM-backed key protection, and detailed audit logging.

## Detection / troubleshooting
- Alert on unusual key-generation/unwrap/decrypt operations, mass key access, or access from unexpected principals.

## Detailed notes captured from the notebook
# Key Management Systems & Privacy

# Key Management Systems
- Services are everywhere
  - switch key for each
- Manage all keys from a centralized management
- Separate keys from data
- One console
  - Create keys for specific providers
  - Associate with users
  - Rotate keys
  - Why? key use is important

## Keeping data private
- Our data is located in many places
- Attackers always find new tech
- Our data is changing constantly

**How do we protect it?**

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
