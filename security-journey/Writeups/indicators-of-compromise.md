# Sep 18 — Indicators of Compromise From Memory

**Path:** CompTIA Security+ (SY0-701) / Indicators of Compromise  
**Date:** 2026-09-18  
**Category:** Detection / Indicators of Compromise

## Objective
Write five IoCs from memory.

## Tools used
- Security+ study material
- Personal notes

## Methodology

### Five IoCs from memory

1. **Impossible travel** — a user appears to authenticate from geographically incompatible locations in a timeframe that is not physically plausible.
2. **Account lockouts** — repeated failed authentication activity causes an account to become locked or repeatedly trigger lockout controls.
3. **Odd resource use** — unusual CPU, memory, storage, or cloud-resource consumption compared with the normal baseline.
4. **Unusual outbound traffic** — unexpected external connections, destinations, volumes, or protocols from a system or account.
5. **Configuration changes** — unexpected changes to security settings, accounts, services, firewall rules, or other system configuration.


## Detection angle (SOC-relevant)
These indicators can appear across identity, endpoint, network, and cloud telemetry. A SOC would normally correlate them with timestamps, user/device context, baseline behavior, source/destination information, and related alerts rather than treating one signal as proof of compromise by itself.

## Key takeaway
An IoC is a clue that may indicate compromise; the useful skill is recognizing abnormal behavior and combining evidence from multiple sources.
