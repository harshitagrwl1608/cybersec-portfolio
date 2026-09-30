# Hashing & Digital Signatures

## Overview
Hashing creates a fixed-length digest; digital signatures use asymmetric keys to provide integrity and signer authentication. Together they are foundational for software signing, certificate validation, and tamper detection.

## Core concepts
- A cryptographic hash should exhibit preimage, second-preimage, and collision resistance appropriate to its design.
- A digital signature is normally computed over a hash or structured message and verified using the signer's public key.
- Hashing does not provide confidentiality and does not, by itself, prove who produced the data.

## Practical examples
- A package repository can publish a hash for integrity and a digital signature for authenticity of the publisher.

## Security / mitigation
- Use modern approved hashes and signature algorithms, protect private signing keys, and validate trust chains.

## Detection / troubleshooting
- Signature validation failures, changed hashes, and unsigned or newly signed artifacts should be reviewed during software-supply-chain monitoring.

## Detailed notes captured from the notebook
# Hashing & Digital Signatures

# Hashing & Digital Signatures
- Represent data as a short string of text
- Can be used as digital signature
- Integrity only
- Minor input change -> major change in hash output

## Collisions
- Same output for diff input
- E.g. MD5 algo

## Passwords
- Verify fingerprint
- To check if file hasn't been tampered with
- Storing passwords + salt

## Digital signatures
- Integrity
- Confirm msg source
- Sign with private key -> verify with public key

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
