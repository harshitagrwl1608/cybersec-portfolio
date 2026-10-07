# Public Key Infrastructure (PKI)

## Overview
Public Key Infrastructure (PKI) binds public keys to identities and provides a trust framework for certificates and digital signatures. The CA is the trusted authority that signs certificates; the relying party validates the certificate chain and relevant constraints.

## Core concepts
- Common components include root and intermediate CAs, end-entity certificates, registration/validation processes, repositories, and revocation information.
- X.509 v3 certificates contain fields such as subject, issuer, validity period, public key, serial number, signature algorithm, and extensions.
- A certification path is validated from the end-entity certificate through intermediates to a trusted root.

## Practical examples
- A website certificate can be validated by checking hostname/SAN, validity dates, issuer chain, signature, and trust anchor.

## Security / mitigation
- Protect CA private keys, separate root and issuing CA roles, use appropriate certificate lifetimes, and maintain revocation/renewal processes.

## Detection / troubleshooting
- Watch for certificate expiry, unexpected issuer changes, invalid chains, hostname mismatches, and revocation failures.

## Detailed notes captured from the notebook
# Public Key Infrastructure (PKI)

# Public Key Infrastructure (PKI)
- Policies, hardware, procedures, people
- Distribution, creation, managing, storage of records
- Data of planning
- Binding of public keys to people or devices
- Managing CA

## Symmetric encryption
- A single shared key for both encrypt & decrypt
- Secret key algo
- Diff part is sending the key
- Inaccessible if very fast to use

## Asymmetric encryption
- Public / private key
- Encrypt -> decrypt
- PGP / GPG or

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
