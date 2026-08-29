# UFW Firewall Rules Testing — Docker Lab

## Objective
Set up UFW on a Docker container and test rule effectiveness by attacking
it from an external host (laptop), observing what gets blocked/allowed
before vs after firewall rules are applied.

## Environment
- Victim: Docker container (Ubuntu base) running UFW
- Attacker: Kali Linux
- Network: bridge

## UFW Configuration
check [ufw_rules](./setup/ufw-rules.sh)

## Results Summary
| Port/Service | Before Firewall | After Firewall |
|--------------|------------------|-----------------|
| 22                 | ssh                 | Open/Filtered
| 80                 | http                | Open/Filtered
| 3000               | ppp                 | Open/Filtered
| 8080               | http-proxy          | Open/Filtered

See `attacks/before-firewall.md` and `attacks/after-firewall.md` for full scan logs.

## Detection Angle
If UFW blocks something it writes to /var/log/ufw.log (rolls into syslog) — you get src ip, dst port, protocol, and the fact it was a SYN with no reply. That's basically the whole story for a port scan. Feed that into a SIEM and the alert is just: one src ip touching a bunch of different dst ports in a short window = port scan, not normal traffic. Could build a Sigma rule off exactly that (count distinct ports per src ip per minute, alert over some threshold) — maps to T1046 in ATT&CK. 

## Key Takeaways
Default-deny only protects you as much as your allow rules let it — block everything, then poke exactly the holes you need, and the more specific each hole is (like scoping SSH to one IP instead of "any") the better. Also noticed UFW being stateful is why the SYN scan gave different results for filtered vs closed ports — no reply at all means dropped/filtered, a RST means closed, that distinction only exists because of state tracking.

The logging matters more than the blocking itself — a rule that silently drops packets with no log is useless from a detection standpoint, the point of this lab was seeing the attempt, not just stopping it.
