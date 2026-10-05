# Protecting Data
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.3 – Protecting Data → Protecting Data
**Coverage:** source pages 56–58

## Geographic restrictions
Access can be constrained according to client location. The notes distinguish:
- GPS/mobile-device location as potentially precise.
- 802.11 wireless location as less accurate.
- IP/subnet geolocation as less precise than device-level location.
- Automatic geofencing to allow/restrict access, with a caution about inappropriate use near an office or similar boundary.

## Encryption
Encryption changes readable information into protected ciphertext. The notes compare plaintext and ciphertext and stress that decryption reverses encryption only with the appropriate key.

## Hashing
Hashing converts data into a short, fixed-length value. The notes emphasize that it is intended to be difficult to reverse and can support integrity checks, digital signatures, password verification, and other uses.

## Obfuscation
Obfuscation intentionally makes something harder to understand while keeping it usable. The notes give a programming example where readable code is transformed to make analysis more difficult. It is not a substitute for strong cryptography when confidentiality is required.

## Masking
Masking hides sensitive information from view, such as replacing characters with asterisks. It is a presentation/access-control technique.

## Tokenization
Tokenization replaces sensitive data with a non-sensitive token. The notes associate it with payment processing and one-time-use tokens. A token should not reveal the original sensitive value on its own.

## Segmentation
Keep data separated into distinct stores/segments with different security policies. A breach of one segment should not automatically expose every other segment.

## Permission restrictions
Access should be controlled by authorization, permissions, and security groups rather than only by username/password. Authentication proves identity; authorization determines what the identity may do.
