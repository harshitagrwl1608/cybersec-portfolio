# Cryptography Basics — TryHackMe

**Category:** Cryptography Fundamentals

## Objective
Cover the core vocabulary and mechanics of cryptography — plaintext vs
ciphertext, symmetric vs asymmetric encryption, and the two building-block
operations (XOR, modulo) that show up throughout most crypto algorithms.

## Methodology

### Why cryptography?
Cryptography protects information by providing:
- **Confidentiality** — prevent unauthorized reading
- **Integrity** — detect unwanted modification
- **Authentication** — verify who created/sent something
- **Non-repudiation** — evidence of origin, in appropriate digital-signature systems

### Plaintext → Ciphertext
```
Plaintext → (+key) → Encryption algorithm → Ciphertext
Ciphertext → (+key) → Decryption algorithm → Plaintext
```
- **Plaintext** — original readable data
- **Ciphertext** — scrambled/unreadable output after encryption
- **Cipher** — the algorithm/method used for encryption and decryption
- **Key** — secret material used by the algorithm

### Caesar Cipher
A simple substitution cipher — shifts alphabetic characters by a fixed
amount (e.g. shift of 3: A→D, B→E ... Z→C). Useful for understanding the
basic idea of a cipher, but **not secure for modern use** — trivially
broken by frequency analysis or brute-forcing all 25 shifts.

### Symmetric Encryption
Uses the **same secret key** for encryption and decryption.
```
shared secret key
Plaintext → Encryption → Ciphertext → Decryption → Plaintext
```
The core challenge: both parties need a secure way to share that key in
the first place. Examples: DES (obsolete), 3DES (deprecated), AES (modern
standard).

### Asymmetric Encryption
Uses a **key pair** — a public key (shareable) and a private key (must
stay secret).
```
Alice: Bob's public key → Encrypt message → Ciphertext
Bob:   Bob's private key → Decrypt → Plaintext
```
Examples: RSA, Diffie-Hellman, Elliptic Curve Cryptography (ECC).

### XOR (Exclusive OR)
| A | B | A XOR B |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

Key properties: `A XOR A = 0`, `A XOR 0 = A`. This reversibility is what
makes XOR encryption work:
```
C = P XOR K   (encryption)
P = C XOR K   (decryption using the same key)
```

### Modulo
Returns the remainder of a division — e.g. `25 % 4 = 1`. For a positive
integer `n`, `a % n` always falls in the range `0 ... n-1`. Modulo
arithmetic underpins most public-key algorithms (RSA, Diffie-Hellman —
see the Public Key Cryptography writeup).

## Detection Angle
Not directly applicable at this level — this room is foundational
vocabulary/math rather than an attack or defense technique. The relevant
takeaway for detection engineering is recognizing when something is
*actually* encrypted (high entropy, no readable structure) versus just
encoded (Base64, hex — reversible without a key), since these get
conflated in security discussions and matter for triage.

## Key Takeaway
The distinction between symmetric (same key, faster, key-distribution
problem) and asymmetric (key pair, solves distribution, slower) crypto is
the foundation everything else builds on — TLS, SSH, and PGP all combine
both approaches rather than picking one exclusively.
