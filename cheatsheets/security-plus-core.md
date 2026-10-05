# Security+ Core

## CIA / AAA
| Concept | Remember |
|---|---|
| Confidentiality | Prevent unauthorized disclosure |
| Integrity | Prevent unauthorized modification |
| Availability | Keep systems/data accessible |
| Authentication | Who are you? |
| Authorization | What can you do? |
| Accounting | What did you do? |

**Non-repudiation:** evidence helps prevent a party from credibly denying an action.

## Security controls
**Categories:** Technical · Managerial · Operational · Physical

**Types:** Preventive · Deterrent · Detective · Corrective · Compensating · Directive

**Exam cue:** CCTV = detective/deterrent; firewall = preventive; backup restore = corrective.

## Zero Trust
**Never trust implicitly → verify explicitly → least privilege → continuous evaluation.**

PEP = enforcement gate.  
Policy Engine/Decision = evaluates access.  
Policy Administrator = communicates decision to enforcement.

## Cryptography
- **Symmetric:** one shared secret; fast; bulk data.
- **Asymmetric:** public/private keys; slower; signatures/key establishment.
- **Hash:** one-way digest; integrity/password verification; **not encryption**.
- **Digital signature:** signer private key → verifier public key.
- **AES:** symmetric encryption.
- **RSA/ECC:** asymmetric cryptography.
- **MD5/SHA-1:** avoid for new security designs.
- **AEAD:** AES-GCM, ChaCha20-Poly1305.

## PKI
**Root CA → Intermediate CA → End-entity certificate**

Check: issuer, validity, hostname/SAN, signature, chain, revocation.

OCSP = online certificate status.  
CRL = published revocation list.

## Deception
Honeypot = decoy host.  
Honeynet = decoy network.  
Honeytoken = decoy credential/data value.  
Honeyfile = decoy file.

## Architecture
Defense in depth = multiple independent layers.  
Segmentation/microsegmentation = reduce blast radius.  
DMZ = isolated zone for public-facing services.
