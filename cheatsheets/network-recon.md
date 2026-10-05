# Network Recon

## Passive recon
`whois` / RDAP = registration and ownership data.
`dig` / `nslookup` = DNS queries.
Shodan / DNSDumpster / certificate-transparency data = discover publicly exposed or published information.

## Active recon
`ping` = ICMP reachability.
`traceroute` / `tracert` = path/hop discovery.
`telnet` / `nc` = basic service interaction and banner checks.
`nmap` = host, port, and service enumeration.

## Nmap essentials
```bash
nmap <target>
nmap -sn <net/CIDR>           # host discovery
nmap -sS <target>             # TCP SYN scan
nmap -sT <target>             # TCP connect scan
nmap -sU <target>             # UDP scan
nmap -p- <target>             # all TCP ports
nmap -p 22,80,443 <target>    # selected ports
nmap -sV <target>             # service/version detection
nmap -O <target>              # OS detection
nmap -sC <target>             # default NSE scripts
nmap -Pn <target>             # skip host-discovery check
```

## Workflow
**Passive → active → discover hosts → identify ports → enumerate services → fingerprint → validate → document**

**Scope first:** scan only systems you are authorized to test.