# Three Places My Data Is Encrypted at Rest

**Path:** CompTIA Security+ (SY0-701) / Cryptography / Data Protection
**Date:** 2026-09-10
**Category:** Encryption at Rest

## Objective
List three real locations where personal data can be protected with encryption at rest.

## Tools used
- Laptop disk encryption
- Smartphone storage encryption
- Browser password/credential vault

## Methodology
1. **Laptop — BitLocker:** Full-disk encryption protects stored data if the drive is removed or the device is accessed without the authorized unlock mechanism.
2. **Phone:** Modern smartphone storage is encrypted so data stored on the device is protected when the phone is locked.
3. **Browser vault:** Saved passwords and other stored credentials may be protected by the browser's encrypted local credential storage.

These are examples of protecting stored data rather than data while it is actively traversing a network.


## Detection angle (SOC-relevant)
Relevant evidence includes device-encryption status, recovery-key events, vault access events, and authentication activity around protected stores. Security monitoring should distinguish encryption at rest from transport encryption.

## Key takeaway
Encryption at rest protects stored information; it is one layer of protection and does not replace authentication or endpoint security.
