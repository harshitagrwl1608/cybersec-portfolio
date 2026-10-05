# Cryptography

## Symmetric vs asymmetric
| | Symmetric | Asymmetric |
|---|---|---|
| Keys | Shared secret | Public + private |
| Speed | Fast | Slower |
| Typical use | Bulk encryption | Key exchange, signatures |
| Examples | AES | RSA, ECC |

## Hashing
Hash = fixed-length digest.

Remember:
- one-way for cryptographic hashes
- collision resistance matters
- small input change → different digest

**Salt:** unique random value added to passwords before hashing; defeats simple precomputed-table reuse.

Use purpose-built password hashing/KDFs rather than fast general-purpose hashes.

## Digital signatures
**Hash message → sign with private key → verify with public key**

Provides:
- Integrity
- Authenticity
- Non-repudiation support

Does **not** provide confidentiality.

## PKI
CA signs certificates binding identities to public keys.

Validate: **chain → issuer → dates → SAN/hostname → signature → revocation**

## TLS
TLS provides secure transport for applications.

Typical HTTPS flow: **ClientHello → ServerHello/certificates → key establishment → encrypted application data**

## Crypto terms
Key stretching = deliberately costly password/key derivation.  
Perfect forward secrecy = past session keys remain protected after long-term key compromise when ephemeral keys are used.  
Key escrow = trusted third-party retention/recovery of keys.  
HSM = hardware designed to protect/manage cryptographic keys.