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

## Assessment distinctions
- **Vulnerability scan:** finds likely weaknesses; findings need validation.
- **Penetration test:** attempts controlled exploitation to show whether a weakness can be abused and what impact follows.
- **Black box:** little/no internal knowledge supplied.
- **Gray box:** partial knowledge or access.
- **White box:** substantial internal design/configuration knowledge.
- **Red team:** simulates adversary objectives; blue team detects/responds; purple team improves coordination between them.

## Rules of engagement
Before testing, get written authorization and define in-scope targets, exclusions, methods, time windows, source IPs/accounts, impact limits, stop conditions, emergency contacts, evidence handling, and reporting. Use the least intrusive test that answers the objective.

## Workflow
**Scope/ROE → passive recon → authorized active discovery → identify ports → enumerate services → validate findings → document evidence and remediation**

Only scan systems you are authorized to test.