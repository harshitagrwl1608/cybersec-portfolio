# UFW Firewall Rules Testing — Docker Lab

## Objective

Set up UFW on an Ubuntu Docker container and test how firewall policy changes observable network behavior from an authorized Kali Linux test host.

## Environment

- Victim: Ubuntu-based Docker container running UFW
- Attacker/test host: Kali Linux
- Network: Docker bridge
- Scope: isolated lab environment

## UFW configuration

See [setup/ufw-rules.sh](setup/ufw-rules.sh).

## Results

| Port | Service observed | Expected post-policy state |
|---:|---|---|
| 22 | SSH | Open/filtered depending on rule and source |
| 80 | HTTP | Open/filtered depending on rule |
| 3000 | Application service | Open/filtered depending on rule |
| 8080 | HTTP-proxy/banner | Open/filtered depending on rule |

See [before-firewall.md](attacks/before-firewall.md), [after-firewall.md](attacks/after-firewall.md), and [log-analysis.md](attacks/log-analysis.md) for the actual evidence.

## Detection angle

UFW/kernel log entries can provide useful source/destination addresses, ports, protocol and action information, depending on the generated event. Aggregating repeated connection attempts across many destination ports can support scan detection.

A practical detection idea is to count distinct destination ports touched by one source within a short time window and investigate sources exceeding an environment-specific threshold. This maps conceptually to **MITRE ATT&CK T1046 — Network Service Scanning**.

## Key takeaways

- Default-deny policy reduces exposure, but explicit allow rules still determine the effective attack surface.
- TCP ports commonly appear **closed** when the host returns a reset, while **filtered** indicates that filtering prevents a useful response from reaching the scanner.
- Firewall logging can provide detection telemetry in addition to enforcing access policy.
