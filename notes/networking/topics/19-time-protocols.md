# Time Protocols: NTP, NTS and PTP

## Detailed concepts, examples, and edge cases

NTP synchronizes clocks for logs/authentication/outage details. NTP server listens/responds on UDP 123; client requests updates. NTS protects NTP using TLS-based key establishment and cryptographic protection.

Precision Time Protocol: more precise timing/granularity than ordinary NTP, often using specialized hardware/timestamping to reduce software/OS delays.

## NTP
Network Time Protocol synchronizes clocks over packet networks. Accurate time is important for authentication, logging, event correlation, certificate checks, distributed applications and troubleshooting.

NTP commonly uses UDP port 123.

## Client/server roles

- **NTP server:** receives time requests and provides time information.
- **NTP client:** periodically requests or exchanges time information and adjusts its local clock.

An environment can contain multiple upstream time sources and stratum levels. Lower stratum numbers generally represent sources closer to the reference clock.

## Why time matters

```text
Accurate time
   ↓
Consistent logs ──> SIEM/event correlation
   ↓
Authentication protocols
   ↓
Certificate/token validity
   ↓
Reliable distributed systems
```

Large clock differences can make logs appear out of order and can break time-sensitive authentication or security mechanisms.

## Network Time Security (NTS)
Traditional NTP traffic does not inherently provide modern cryptographic protection against an on-path attacker. NTS adds authentication and cryptographic protection to NTP using TLS-based bootstrapping and cookies/session state.

A simplified concept is:

```text
Client ---- secure association/setup ----> NTS-KE server
Client <--- NTP packets with NTS protection ---> NTP server
```

NTS commonly uses TCP 4460 for NTS-KE while the subsequent NTP traffic remains on UDP 123.

## Precision Time Protocol (PTP)
IEEE 1588 Precision Time Protocol is designed for more precise synchronization than ordinary NTP in environments that need very tight timing. PTP can use hardware timestamping and dedicated network support to reduce software and scheduling uncertainty.

PTP is common in industrial, telecom, finance, measurement and other environments where sub-microsecond or similarly strict synchronization may matter.

## NTP vs PTP

| Feature | NTP | PTP |
|---|---|---|
| Typical goal | General network time | Very high precision |
| Common transport | UDP 123 | IEEE 1588 messaging; transport/profile dependent |
| Hardware timestamping | Optional/limited | Common in precision deployments |
| Complexity | Lower | Higher |
| Typical use | Enterprise systems, logs, authentication | Industrial/telecom/high-precision systems |

## Time synchronization hierarchy
```text
Reference clock / upstream source
              ↓
          NTP/PTP server
              ↓
        Networked clients
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
