# Secure Enclave

## Overview
A secure enclave or trusted execution environment isolates sensitive operations and secrets from the general-purpose operating system. The goal is to make extraction of protected keys or computations harder even if the main OS is compromised.

## Core concepts
- Secure enclaves can store private keys, biometric templates, cryptographic operations, or attestation material.
- An enclave is not magic: software, firmware, supply-chain, side-channel, and implementation vulnerabilities can still matter.
- HSMs provide dedicated hardware-backed key protection for many server-side use cases.

## Practical examples
- A device may keep a private key inside hardware-backed secure storage so applications can request signing without receiving the raw key.

## Security / mitigation
- Use vendor-supported secure boot/attestation, patch enclave firmware, and restrict access to enclave APIs.

## Detection / troubleshooting
- Monitor attestation failures, repeated secure-storage access errors, unexpected key provisioning, and firmware integrity alerts.

## Detailed notes captured from the notebook
# Secure Enclave

# Secure Enclave
- A protected area for our secrets
  - Often implemented as a hardware processor
  - Isolated from main CPU
- Extensive features
  - Own boot ROM
  - Monitors system boot process
  - True random number generator
  - Real-time memory encryption
  - Root cryptographic keys
  - Performs AES encryption in hardware, AND MORE...

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
