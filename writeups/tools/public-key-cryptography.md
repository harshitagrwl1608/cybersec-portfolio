# Public Key Cryptography Basics — TryHackMe

**Category:** Cryptography — Asymmetric Systems

## Objective
Understand how asymmetric cryptography is actually used in practice —
RSA math, Diffie-Hellman key exchange, and where these show up in
everyday tools (SSH, TLS, PGP/GPG).

## Methodology

### Common Use of Asymmetric Cryptography
If Bob wants Alice to send him a confidential message: Bob publishes his
**public key**. Alice encrypts using Bob's public key. Bob decrypts with
his **private key** — the only key that can reverse it. Anyone can know
Bob's public key; only Bob should ever hold his private key.

### RSA
Security is based on the difficulty of factoring a large composite
integer.

**Key generation (simplified):**
1. Choose two primes `p, q`
2. Calculate `n = p × q`
3. Calculate Euler's totient: `φ(n) = (p-1)(q-1)`
4. Choose `e` such that `gcd(e, φ(n)) = 1`
5. Calculate `d` such that `e × d ≡ 1 (mod φ(n))`
6. Public key = `(n, e)`, Private key = `(n, d)`

**Worked example** (from the room, `p=157, q=199`):
```
n = 157 × 199 = 31243
φ(n) = 156 × 198 = 30888
e = 163   (gcd(163, 30888) = 1)
d = 379   (modular inverse of e)

Public key  = (31243, 163)
Private key = (31243, 379)

Encryption: y = x^e mod n
Decryption: x = y^d mod n

x = 13 → y = 13^163 mod 31243 = 16341
16341 decrypted with d recovers x = 13
```
**Note:** real RSA uses carefully specified padding schemes and far
larger keys (2048+ bits) — this arithmetic is a learning example, not a
secure implementation on its own.

### Diffie-Hellman Key Exchange
Lets two parties establish a shared secret over a channel an observer can
see in full.

```
Public parameters: p (large prime), g (generator)
Alice picks private a; Bob picks private b
A = g^a mod p        B = g^b mod p
(A and B are exchanged openly)

Alice computes: S = B^a mod p
Bob computes:   S = A^b mod p
Both arrive at the same shared secret: g^(ab) mod p
```
The private values `a` and `b` are never transmitted — only the derived
public values `A` and `B` are. This is what makes DH secure even over an
observed channel.

**Worked example** (`p=29, g=3, a=13, b=15`):
```
A = 3^13 mod 29 = 19
B = 3^15 mod 29 = 26

Alice: S = 26^13 mod 29 = 10
Bob:   S = 19^15 mod 29 = 10   ← same result
```

### SSH
Provides secure remote administration. Key generation:
```bash
ssh-keygen -t ed25519
```
Modern preferred key types: Ed25519, ECDSA, RSA (in roughly that order of
preference today). Private keys need restrictive permissions so other
local users can't read them:
```bash
chmod 600 ~/.ssh/id_ed25519
```

### TLS Certificates
Let a client authenticate a server's identity. Simplified trust chain:
```
Root CA → Intermediate CA → Server certificate → Website
```
Operating systems and browsers ship with a trusted CA store; a
certificate is only trusted if it chains back to one of those roots.
Certificates establish server identity, associate a public key with that
identity, and enable the TLS handshake to proceed securely.

### PGP / GPG
**PGP** (Pretty Good Privacy) is a family of standards for encryption and
digital signatures; **GPG (GnuPG)** is the widely used open-source
implementation.
```bash
gpg --list-keys
gpg --list-secret-keys
gpg --import keyfile
gpg --decrypt message.gpg
```
GPG provides confidentiality (encryption) and integrity/authentication
(signatures) — often both at once for signed-and-encrypted messages.

## Detection Angle
- **SSH key permission checks** are a real, common finding — overly
  permissive private key files (`644` instead of `600`) are flagged by
  hardening audits and CIS benchmarks.
- **TLS certificate chain validation failures** (self-signed, expired,
  untrusted CA) are exactly the misconfiguration pattern covered in
  OWASP A02 (Security Misconfiguration) and A04 (Cryptographic Failures)
  — see the OWASP Top 10 notes elsewhere in this repo.
- Weak/short RSA key sizes or reused DH parameters are a real historical
  vulnerability class (e.g. the Logjam and FREAK attacks against
  downgraded TLS handshakes).

## Key Takeaway
RSA and Diffie-Hellman solve two different problems that both matter for
the same goal — RSA gives you encryption/signing with a key pair, DH
gives you a way to agree on a *shared* secret without ever transmitting
it. Real protocols like TLS combine both rather than relying on just one.

