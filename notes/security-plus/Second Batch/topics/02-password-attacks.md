# Password Attacks
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 2.4 – Indicators of Malicious Activity → Password Attacks
**Coverage:** source pages 3–4

## Plaintext and hashing
The notes are emphatic: **do not store passwords in plaintext**.

A password hash transforms variable-length input into a fixed-length output. Desired properties include:
- A small input change should produce a substantially different hash output.
- The original password should not be practically recoverable from the stored verifier.
- Password files can differ by operating system and by hashing scheme.

Modern password storage should use an appropriate password-hashing scheme with a unique salt and a work factor. NIST guidance requires password verifiers to store passwords in a form resistant to offline attacks; it specifies salted hashing with a suitable password-hashing scheme and a cost factor. 

## Password spraying
Password spraying tries a small number of commonly used passwords across many accounts rather than trying many passwords against one account. The notes emphasize:
- Try common passwords.
- Avoid triggering account lockout repeatedly.
- Remember the number of attempts and the corresponding authentication data.

## Brute force
A brute-force attack systematically tries password candidates until a valid one is found. The notes highlight that brute force becomes expensive with time and computing resources.

### Online vs. offline
- **Online brute force:** directly targets a login service; it is usually slower and can trigger security responses such as lockouts/rate limits.
- **Offline brute force:** works against a stolen password-hash database; the attacker can test guesses locally and at much higher volume.

## Defenses
Use strong unique passwords, appropriate password hashing, rate limiting, lockout/throttling policies, MFA, monitoring of authentication failures, and secure password-file handling. NIST's current digital-identity guidance also emphasizes salted password hashing and increasing the cost factor as computing capability grows.
