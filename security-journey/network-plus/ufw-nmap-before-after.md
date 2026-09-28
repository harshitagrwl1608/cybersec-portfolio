# Lab: ufw Firewall, nmap Before vs After

## Goal
Confirm that firewall rules actually change what an external scan sees.

## Setup
- Target: Linux machine/VM (`<TARGET_IP>` sanitized)
- Scanner: second device/VM

## Step 1: Baseline scan (ufw disabled)
```bash
nmap -Pn -p 22,23,80,443 <TARGET_IP>
```
Paste output:
```
(paste here)
```

## Step 2: Apply rules
```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 23/tcp
sudo ufw enable
sudo ufw status verbose
```

## Step 3: Scan again
```bash
nmap -Pn -p 22,23,80,443 <TARGET_IP>
```
Paste output:
```
(paste here)
```

## Takeaway
- Port 23 shows as `filtered` (dropped) rather than `closed` (rejected).
- ACL vs firewall rule in one sentence:
