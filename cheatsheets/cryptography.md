# Cryptography

## Symmetric vs asymmetric
| | Symmetric | Asymmetric |
|---|---|---|
| Keys | Shared secret | Public + private |
| Speed | Fast | Slower |
| Typical use | Bulk encryption | Key establishment/signatures |
| Examples | AES | RSA, ECC |

## Hybrid encryption
Use asymmetric cryptography to establish/protect a session key, then symmetric crypto for bulk data.

## Key exchange
DH/ECDH derive a shared secret without directly sending that secret. Ephemeral keys can provide forward secrecy when authenticated correctly.

## Hashing
Fixed-length digest; one-way for cryptographic hashes. Used for integrity, password verification, and signing workflows.

Collision = two inputs produce the same digest. Password storage needs a salt + purpose-built password KDF.

## Crypto attacks
**Birthday attack:** targets collision probability.  
**Downgrade attack:** forces weaker protocol/cipher choices.
**Defend:** modern algorithms, sufficient hash length, disable obsolete protocols, validate negotiated security.

## Digital signatures
**Hash → sign with private key → verify with public key.** Provides integrity + authenticity + non-repudiation support; not confidentiality.

## PKI / certificates
CA signs certificates binding identity to public key.

Validate: **chain → issuer → dates → SAN/hostname → signature → revocation**.

CSR = request for a certificate; applicant proves possession of its private key.

## Revocation
CRL = signed list of revoked certificate serials.  
OCSP = query certificate status.  
OCSP stapling = server supplies signed status during TLS.

Wildcard certificate = certificate covering matching names under a domain pattern.

## Key management
Lifecycle: **generate → distribute → activate → rotate → backup/archive → revoke → destroy**.

KMS = centralized key management.  
HSM = dedicated hardware-backed key protection.  
Key escrow = authorized third-party recovery storage.

## Hardware-backed trust
TPM = platform hardware for protected keys, measured/secure operations, and attestation.  
Secure enclave = isolated protected execution/key-storage environment on supported devices.

## Data protection
At rest = disk/database/files/backups.  
In transit = TLS/SSH/IPsec.  
In use = actively processed.

Encryption ≠ hashing ≠ masking ≠ tokenization ≠ obfuscation.

## Blockchain
Distributed ledger where records are linked cryptographically and maintained under a consensus/trust model.

Security concerns: private-key protection, validator/node security, smart-contract flaws, unauthorized contract/key changes.
