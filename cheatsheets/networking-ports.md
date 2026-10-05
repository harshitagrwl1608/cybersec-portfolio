# Networking — Protocols & Ports

| Port | Protocol | Remember |
|---:|---|---|
| 20/21 | FTP | File transfer; plaintext |
| 22 | SSH | Secure remote shell / SCP |
| 23 | Telnet | Insecure remote terminal |
| 25 | SMTP | Mail transfer |
| 53 | DNS | Name service |
| 67/68 | DHCP | IPv4 assignment |
| 80 | HTTP | Web; plaintext at HTTP layer |
| 88 | Kerberos | Authentication |
| 110 | POP3 | Mail retrieval |
| 123 | NTP | Time |
| 143 | IMAP | Mail retrieval |
| 161/162 | SNMP | Monitoring / traps |
| 389 | LDAP | Directory |
| 443 | HTTPS | HTTP over TLS |
| 445 | SMB | Windows file/printer sharing |
| 500 | IKE | IPsec key management |
| 514 | Syslog | Common traditional UDP logging |
| 636 | LDAPS | LDAP over TLS |
| 1433 | MSSQL | Microsoft SQL Server |
| 3306 | MySQL | MySQL |
| 3389 | RDP | Windows remote desktop |
| 4500 | IPsec NAT-T | Encapsulated IPsec through NAT |
| 5432 | PostgreSQL | PostgreSQL |
| 5900 | VNC | Remote desktop |

**Secure alternatives:** SSH/SFTP, HTTPS, FTPS/explicit TLS, LDAPS.

### TCP vs UDP
TCP = connection-oriented, reliable, ordered.  
UDP = connectionless, lower overhead, no delivery guarantee.

### DNS records
A = IPv4  
AAAA = IPv6  
CNAME = alias  
MX = mail server  
NS = authoritative name server  
TXT = text/policy data  
PTR = reverse lookup

### DHCP
**DORA:** Discover → Offer → Request → Acknowledge