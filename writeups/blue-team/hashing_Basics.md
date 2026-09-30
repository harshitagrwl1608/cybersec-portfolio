# Hashing Basics — TryHackMe

**Category:** Cryptography — Hashing & Integrity

## Objective
Understand what a hash actually is, why hashing is fundamentally
different from encryption, and how hashing is (and isn't) safely used for
password storage and integrity checking.

## Methodology

### Hash Value
A fixed-length output produced from input data of *any* size:
```
Input of arbitrary length → Hash function → Fixed-length hash
```
A cryptographic hash should make it computationally infeasible to recover
the original input from the digest alone.

### Hashing Is Not Encryption
Encryption is designed to be **reversible** with the right key. Hashing
is designed to be a **one-way transformation** — there is no key to
reverse it with.
```
Encryption: plaintext --key--> ciphertext --key--> plaintext
Hashing:    data --> hash            (no way back)
```
A small change in input should produce a significantly different output
— this is the **avalanche effect**, and it's a property good hash
functions are specifically designed to have.

### Common Hash Commands
```bash
md5sum file.txt
sha1sum file.txt
sha256sum file.txt
sha512sum file.txt
```
**Important:** MD5 and SHA-1 have known collision weaknesses and
shouldn't be chosen for new security-sensitive designs. Even SHA-256,
despite being cryptographically strong, is still the *wrong* choice for
password storage on its own — it's designed to be fast, and fast is
exactly what you don't want for passwords (see below).

### Hash Collisions
A collision is when two different inputs produce the *same* output hash:
```
Input A → Hash → X
Input B → Hash → X
```
With `n` output bits, there are only `2^n` possible outputs — since the
space of possible inputs is larger, collisions must exist mathematically.
A good cryptographic hash function just makes *finding* a useful
collision computationally impractical.

### Password Storage
Never store passwords in plaintext. Poor approaches, in order of
badness: plaintext, deprecated/weak encryption, fast general-purpose
hashing (MD5/SHA-256 with no salt). The correct design:
```
password + unique random salt → password-hashing/KDF → stored verifier
```
The salt doesn't need to be secret — it just needs to be unique per
password and stored alongside the resulting hash.

### Why Salts Matter
Without a salt, identical passwords produce identical hashes — an
attacker with a precomputed rainbow table can crack every matching
account at once. With a unique salt per user:
```
password + saltA → hash A
password + saltB → hash B   (same password, different stored hash)
```
This defeats precomputed lookup tables entirely, since the attacker would
need a separate table per salt. Good password-specific KDFs: **Argon2id**,
**scrypt**, **bcrypt**, **PBKDF2** — these are deliberately slow/memory-hard,
unlike general-purpose hashes.

### Recognizing Linux Password Hashes
```
/etc/passwd   — account info (world-readable)
/etc/shadow   — password verifiers (requires elevated privileges)
```
A shadow entry field looks like `$prefix$parameters$salt$hash`. Common
prefixes:
| Prefix | Scheme |
|--------|--------|
| `$y$` | yescrypt |
| `$6$` | SHA-512 crypt |
| `$5$` | SHA-256 crypt |
| `$2b$` | bcrypt |

Always confirm the exact format rather than assuming from the prefix
alone — implementations vary.

### Password Cracking Concepts
Common approaches: dictionary attacks, brute force, rule-based mutations,
mask attacks, wordlist combinations. GPUs dramatically accelerate fast
hash types; memory-hard KDFs (Argon2id, scrypt) specifically exist to
blunt that GPU advantage.

### Hashing for Integrity Checking
```bash
sha256sum file.iso
```
Compare the locally computed hash against a publisher's published value —
any bit-level modification (accidental corruption or tampering) should
produce a completely different digest. Caveat: this only works if you
trust the *source* of the expected hash — if an attacker controls both
the file and the published hash, the check is worthless.

### HMAC (Hash-based Message Authentication Code)
Combines a hash function with a **secret key** to provide message
authentication and integrity — something a plain hash can't do on its
own, since anyone can compute a plain hash with no key required.
```
HMAC(K, M) = H((K' XOR opad) || H((K' XOR ipad) || M))
```
Where `K` = secret key, `M` = message, `H` = hash function, `ipad`/`opad`
= fixed padding constants. Unlike an ordinary hash, forging a valid HMAC
requires knowing the secret key.

## Detection Angle
- **Weak hash algorithm usage** (MD5/SHA-1 for passwords or integrity) is
  literally OWASP A04 (Cryptographic Failures) — see the OWASP notes
  elsewhere in this repo.
- **Unsalted password hashes** found in a breach dump are a strong signal
  of poor application security practice — SOC/incident-response teams
  treat unsalted-hash leaks as higher severity than salted ones, since
  cracking is dramatically faster/cheaper at scale.
- File integrity monitoring (FIM) tools rely on exactly the hash-based
  integrity checking covered here — a changed hash on a critical system
  file (e.g. via Tripwire, auditd, or Windows FIM) is a core detection
  signal for unauthorized modification.

## Key Takeaway
Hashing and encryption solve fundamentally different problems and get
confused constantly — encryption protects confidentiality and is
reversible with a key; hashing protects integrity/verification and is
deliberately one-way. Password storage specifically needs a *slow,
salted* hash (a KDF), not just "any hash," because the threat model is an
attacker with unlimited guesses against a stolen database.
