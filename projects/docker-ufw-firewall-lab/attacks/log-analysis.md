# Log Analysis — UFW Block Events

## Purpose
Capture and analyze the actual UFW log output generated while the Nmap scans
were running, to confirm blocked connection attempts are visible and to show
what a detection query against this data would look like.

## Setup
```bash
# Inside the container - make sure UFW logging is on
ufw logging on

# Tail the log while running the attack scans from the attacker machine
touch /var/log/ufw.log
tail -f /var/log/ufw.log
```

## Raw Log Output

## Pulling Just the Block Events
```bash
grep "UFW BLOCK" /var/log/ufw.log
```
[paste filtered output here]

## Observations
- [How many distinct destination ports did the attacker IP hit?]
- [How close together are the timestamps? Sub-second/rapid = automated scan]
- [Which ports show up as BLOCK vs which don't appear at all — 
  ports that never appear in the log may be allowed, or may be a Docker/iptables 
  bypass issue rather than truly reachable]
- [Compare this against before-firewall.md and after-firewall.md — does the 
  blocked-port list match the ports that stopped responding to Nmap?]

## Basic Detection Query (conceptual)
If this log were ingested into a SIEM, the equivalent of "flag a port scan" is:
This is the same logic behind the Sigma rule idea in the main README's 
Detection Angle section — this file is the evidence that logic actually holds 
up against real log data, not just a theoretical claim.

## Key Takeaway
[Fill in after doing the actual analysis — e.g. did the raw logs match your 
expectation from the README, or did anything surprise you — like a port 
staying silent in the log despite Nmap reporting it as filtered?]
