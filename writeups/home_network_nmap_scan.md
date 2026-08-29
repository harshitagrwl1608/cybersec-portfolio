# Home Network Nmap Scan — Personal Recon Exercise
 
**Date:** 2026-08-14
**Category:** Network Reconnaissance — Applied
 
## Objective
Apply Nmap skills from the THM "Nmap" room against my own home network rather
than a lab target — practice host discovery and service enumeration in a
real, uncontrolled environment, and think through what an attacker on the
same network could learn.
 
> **Note on redaction:** this repo is public. Real IP ranges, MAC addresses,
> and device hostnames are replaced with placeholders below. Only the
> pattern/structure of findings is documented, not identifying details.
 
## Environment
- Network: Home WiFi, subnet `192.168.X.0/24` (redacted)
- Scanning host: Kali Linux (Dell Vostro 15)
## Methodology
 
### 1. Identify local subnet
```bash
ip a
```
[Confirm your interface's IP/subnet — don't paste the real one here]
 
### 2. Host discovery (ping sweep)
```bash
sudo nmap -sn 192.168.X.0/24
```
**Findings:**
[How many hosts responded? What kinds of devices do you think they are,
based on hostname/vendor MAC prefix — router, phone, laptop, smart TV, etc.
Redact actual IPs/MACs — describe by role, e.g. "Device A (likely router)",
"Device B (likely smart TV)".]
 
### 3. Detailed scan of the router / gateway
```bash
sudo nmap -sV -O 192.168.X.1
```
**Findings:**
[Open ports, service versions detected, OS guess. Common router findings:
80/443 admin panel, 53 DNS, sometimes UPnP on 1900, sometimes an exposed
telnet/SSH management port.]
 
### 4. Detailed scan of one other interesting device
```bash
sudo nmap -sV 192.168.X.<n>
```
**Findings:**
[Same as above for a second device — a phone, laptop, or IoT device if you
have any. IoT devices are often the most interesting from a security
standpoint since they tend to run outdated services.]
 
## Observations / Risk Notes
- [Anything concerning — e.g. router admin panel reachable without needing
  to be told the IP, exposed management ports, default-looking banners
  suggesting default credentials might work, etc. Don't actually attempt
  credential attacks against your own router unless you're prepared to
  document it responsibly — this exercise is about visibility, not exploitation.]
## Detection angle (SOC-relevant)
Home networks usually have zero monitoring, which is exactly the point of
this exercise — contrast that with an enterprise network where:
- A ping sweep across an internal subnet would show up as many ICMP
  requests in sequence from one source — easy to flag with basic network
  monitoring (something home routers never do).
- Detailed `-sV -O` scans generate a recognizable pattern of probe packets
  per host that an IDS (like the one covered in the IDS Fundamentals room)
  would typically have signatures for.
- This is a good illustration of why internal network visibility matters —
  most home networks (and many small businesses) have literally zero
  detection capability for this kind of internal recon.
## Key takeaway
[1–2 sentences — what did scanning your own network teach you that scanning
a lab target didn't? Anything surprise you about what's actually running
on your home devices?]
 
