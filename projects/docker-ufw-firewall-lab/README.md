# UFW Firewall Rules Testing — Docker Lab

## Objective
Set up UFW on a Docker container and test rule effectiveness by attacking
it from an external host (laptop), observing what gets blocked/allowed
before vs after firewall rules are applied.

## Environment
- Victim: Docker container (Ubuntu base) running UFW
- Attacker: Kali Linux (Dell Vostro 15)
- Network: [bridge/host mode - specify which and why]

## UFW Configuration
[List exact rules - allow/deny, ports, protocols]

## Results Summary
| Port/Service | Before Firewall | After Firewall |
|--------------|------------------|-----------------|
|              |                  |                 |

See `attacks/before-firewall.md` and `attacks/after-firewall.md` for full scan logs.

## Detection Angle
- What logs would this generate? (ufw.log, syslog)
- What would a SIEM alert look like for the blocked attempts?
- Sigma rule opportunity: repeated connection attempts to closed ports = recon behavior

## Key Takeaways
[Stateful vs stateless filtering, default-deny, Docker/iptables interaction, etc.]
