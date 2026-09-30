# Encryption Algorithms & Key Length

## Overview
Encryption algorithms define how data is transformed and what security properties depend on key size, algorithm design, mode of operation, and implementation. Modern systems generally favor well-studied algorithms and authenticated-encryption modes over obsolete designs.

## Core concepts
- Symmetric encryption uses the same secret key for encryption and decryption; AES is the common Security+ example.
- Asymmetric cryptography uses public/private key pairs; RSA and elliptic-curve systems are common examples.
- Key length is not directly comparable across algorithm families; security strength depends on the algorithm and parameter set.
- Hash functions such as SHA-256 are not encryption because they are designed as one-way digests.

## Practical examples
- AES-128 and AES-256 are common symmetric choices; RSA-2048 and elliptic-curve schemes are examples of asymmetric/key-establishment technologies.

## Security / mitigation
- Avoid deprecated algorithms and weak hashes such as MD5 and SHA-1 for new security designs.
- Use authenticated encryption where available, such as AES-GCM or ChaCha20-Poly1305.

## Detection / troubleshooting
- Monitor for use of weak protocols/ciphers, certificate signatures with deprecated algorithms, and configuration drift from approved cryptographic baselines.

## Detailed notes captured from the notebook
# Encryption Algorithms & Key Length

# Encryption Algorithms
- Agree on one/more algs
- Algorithm selected based on method of encryption

## Cryptographic Keys
- Publicly available methods
- Algo is a known entity
- Key [is] not
- Key determines the output
- Key -> private always

## Key length
- Length of key ∝ brute force attacks [force / space note]
- Numbers get bigger as processor gets powerful
- For every type of encryp[t]

# Key stretching
- This way length would keep increasing
- A weak key is a weak key
- Perform multiple processes
  - multiple hashes
  - multiple encryption
- Key stretching method

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
