# Nmap Scan — AFTER UFW Enabled

## Purpose
Re-run the same scan after applying UFW rules to see what changed.

## Command
\`\`\`
nmap -sV -p- <container_ip>
\`\`\`

## Output
[paste raw output here]

## Observations
[Which ports got blocked/filtered vs stayed open, did anything unexpected
stay open (Docker/iptables bypass issue), compare directly against before-firewall.md]
