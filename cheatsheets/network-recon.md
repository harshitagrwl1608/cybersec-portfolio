# Network Recon

## Nmap essentials
```bash
nmap <target>                 # basic scan
nmap -sn <net/CIDR>           # host discovery
nmap -sS <target>             # TCP SYN scan
nmap -sT <target>             # TCP connect scan
nmap -sU <target>             # UDP scan
nmap -p- <target>             # all TCP ports
nmap -p 22,80,443 <target>    # selected ports
nmap -sV <target>             # service/version detection
nmap -O <target>              # OS detection
nmap -A <target>              # aggressive scan
nmap -sC <target>             # default NSE scripts
nmap -oN scan.txt <target>    # normal output
```

## Recon workflow
**Discover hosts → identify ports → enumerate services → fingerprint versions → validate exposure → document evidence**

## Companion commands
```bash
ip a
ip route
ss -tulpn
dig example.com
nslookup example.com
arp -a
traceroute <target>
```

**Scope first:** scan only systems you are authorized to test.
