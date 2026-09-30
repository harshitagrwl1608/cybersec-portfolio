# Encrypting Data

## Overview
Encryption at rest protects stored data; encryption in transit protects data moving across networks; encryption in use refers to protection while data is being processed, for example with trusted execution technologies in specialized environments.

## Core concepts
- At rest includes full-disk, file, database, and storage encryption.
- In transit commonly uses TLS, SSH, IPsec, or other authenticated encryption mechanisms.
- Encryption is different from tokenization and masking: encryption is reversible with the key, tokenization replaces data with a token, and masking obscures part of a value for presentation.

## Practical examples
- A laptop disk can be encrypted at rest while HTTPS protects the same user's data while it crosses the network.

## Security / mitigation
- Manage encryption keys separately from the protected data where practical, rotate keys according to policy, and protect recovery keys.

## Detection / troubleshooting
- Evidence includes encryption status, key-use logs, TLS negotiation failures, certificate changes, and access to key-management systems.

## Detailed notes captured from the notebook
# Encrypting Data

# Encrypting Data
## Encrypting stored data
- Protect data on storage devices
- Full disk & partition / volume encryption
- BitLocker, FileVault etc.
- File encryption -> EFS -> 3rd party

## Database Encryption
- Protecting stored data
- Transparent encryption
  - with a symmetric key
  - individual columns
  - separate keys for each column
  - leave out publicly available data
  - involves overhead

## Transport encryption
- Everything traversing data
- Encrypt in SQL and HTTPS
- Get a VPN

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
