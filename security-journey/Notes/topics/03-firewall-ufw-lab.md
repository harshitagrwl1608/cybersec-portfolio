# Firewall — UFW for Lab

## Overview
UFW (Uncomplicated Firewall) is Ubuntu's simplified host-firewall interface. It provides an easier way to create Netfilter firewall rules for common host-firewall use cases.

## Core concepts
- `sudo ufw enable` enables UFW; `status`, `status verbose`, and `status numbered` show its configuration.
- Rules can allow, deny, reject, or limit traffic by port, protocol, source, destination, or application profile.
- Rules can be deleted or inserted by number; rule ordering matters when rules overlap.
- UFW can use service names from `/etc/services` and application profiles.
- For a lab, Nmap before/after scans provide a practical way to demonstrate how firewall rules change externally observable port state.

## Practical examples
- Example: `sudo ufw allow 22/tcp` permits SSH/TCP 22; `sudo ufw deny 23/tcp` blocks Telnet/TCP 23.
- Example with a source: `sudo ufw allow proto tcp from 192.168.0.2 to any port 22`.
- Use `sudo ufw --dry-run ...` to inspect resulting rules without applying them.

## Security / mitigation
- Set a deliberate default posture, usually denying unnecessary inbound traffic.
- Allow only required services and sources.
- Keep the ruleset readable; delete obsolete rules rather than layering conflicting rules.
- Test from an authorized second host after changes.
- Back up configuration and use a rollback plan when modifying remote access.

## Detection / troubleshooting
- Compare Nmap results before/after the change, inspect `ufw status verbose`, and review host logs for blocked or rate-limited traffic.

## Detailed notes captured from the notebook
# Firewall — UFW for Lab

## UFW
- UFW → uncomplicated firewall.
- Enable firewall with default rules:

```bash
sudo ufw enable
```

- Allow outgoing.
- Deny incoming.

## 1. Allow / deny

### a) Allow by port / optional protocol
```bash
sudo ufw allow <port>/<optional:protocol>
```

Examples:
```bash
sudo ufw allow 53/tcp
sudo ufw deny 22/tcp
```

### Delete a rule
```bash
sudo ufw delete <port>/<optional:protocol>
```

- Simply write the rule to delete.

Example:
```bash
sudo ufw delete 53/tcp
```

### b) Services
- `/etc/services`

```bash
sudo ufw allow <service_name>
sudo ufw deny smtp
```

## Advanced syntax

### 1) Allow by IP / subnet
```bash
sudo ufw allow from <IP-Addr>
```

### 2) Allow by specific port, IP addr, protocol
```bash
sudo ufw allow from <target> to <destination> port <portnumber> proto <protocol-name>
```

Example in source notes:
```bash
sudo ufw allow from 192.168.1.2 ... any port 22 proto tcp
```
**[One short segment of the original example was unreadable; the clarified UFW syntax above is the standalone working form.]**

## Advanced example
- Block access to port 22 from `192.168.1.2` & `192.168.1.3`, but allow all other `192.168.1.x` IPs to access port using TCP.

```bash
sudo ufw deny from 192.168.1.2 to any port 22
sudo ufw deny from 192.168.1.3 to any port 22
sudo ufw allow from 192.168.1.3/24 to any port 22 proto tcp
```

## Note
If you want to remove a rule:
1. **Best — delete it**
   - Keeps rules table clean.
2. **Deny**
   - Adds deny rule above allow.

## Further reading (optional)
[Ubuntu Server — Firewall / UFW](https://documentation.ubuntu.com/server/how-to/security/firewalls/index.html)
