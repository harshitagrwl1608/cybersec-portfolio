# Cryptographic Attacks
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 2.4 – Indicators of Malicious Activity → Cryptographic Attacks
**Coverage:** source pages 1–2

## Core idea
Cryptography protects information by transforming it so that an unauthorized party cannot use it directly. The notes emphasize a key point: an attacker may not have the key, so attacks often target the cryptographic construction, implementation, protocol use, or human/system choices around it rather than simply “breaking the key.” Cryptographic technology is public; security should not depend on keeping the algorithm secret.

## Birthday attacks
A birthday attack exploits the probability of hash collisions. A collision occurs when two different inputs produce the same hash output. The notes use the familiar birthday-probability example. The standard probability is approximately **50% at 23 people** and approximately **70% at 30 people**. The lesson for hashing is that finding *any* collision can become much easier than finding a specific preimage.

The same idea applies to hashes: instead of searching for one exact preimage, an attacker can search for any two inputs that collide. In practical cryptography, larger hash outputs reduce collision-search feasibility.

## Downgrade attacks
A downgrade attack forces a system to use a weaker security option even when a stronger one is available. The notes use **SSL stripping** as the example:

```mermaid
flowchart LR
    V[Website visitor] -->|HTTPS request| A[Attacker on path]
    A -->|Downgraded HTTP request| S[Web server]
    S -->|HTTP response| A
    A -->|HTTP content / altered link| V
    V -->|May send data over HTTP| A
```

The security problem is that the victim may believe the website is using encryption while the attacker has forced the connection to a weaker/plaintext mode. The notes specifically describe changing `https://` behavior toward `http://` and using the fact that users may not notice the downgrade.

## Security takeaways
- Use strong, modern cryptographic algorithms and protocols.
- Prefer large enough hash outputs for the security goal.
- Prevent insecure protocol fallback and deprecated protocol versions.
- Validate the negotiated protocol/security level instead of assuming the strongest option was selected.
