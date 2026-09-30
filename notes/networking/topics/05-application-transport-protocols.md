# Application and Transport Protocols / Common Ports

## Detailed concepts, examples, and edge cases

Introduction to IP: moving data efficiently; network topology; Internet Protocol; application information. Encapsulation diagram: Ethernet header, IP, TCP/UDP, HTTP data, Ethernet trailer. TCP vs UDP table with reliability, order, error checking, overhead and congestion control.

Ports identify which process/application should receive traffic. Traditional convention: servers use well-known ports; clients use ephemeral ports. Note says port number alone is not a security mechanism; TCP and UDP each have distinct port spaces.

FTP file transfer; control on TCP 21 and active-mode data on TCP 20. Uses authentication and commands such as list/add/delete. SSH secure shell, encrypted, TCP 22. SFTP/secure FTP uses SSH-based transfer on TCP 22.

Telnet: console access, no security/plaintext, TCP 23. SMTP: server-to-server email on TCP 25 and submission commonly on 587; send mail from device to mail server. DNS maps names to IP; UDP 53 and TCP 53 for cases requiring TCP.

DHCP: automatic IP configuration; UDP 67/68; requires DHCP server/router integration. Lease time makes assignments temporary from a dynamic pool. Reservation can map a client/MAC to a fixed address. TFTP: UDP 69, simple file transfer, no authentication.

HTTP/HTTPS: HTTP TCP 80, HTTPS TCP 443 using TLS. NTP UDP 123, synchronizes clocks for logs/authentication/outage timing. SNMP collects data from network devices; v1 simple, v2 adds data types/bulk transfer, v3 adds security.

SNMP: automatic alerts/notifications via traps, UDP 162. LDAP/LDAPS: directory access; TCP 389 for LDAP, 636 for LDAP over TLS/SSL.

SMB: Windows file/print sharing; TCP 445. Syslog: standard message logging and centralized collectors, commonly UDP 514; can integrate into SIEM. This material emphasizes storage requirements for logs.

SQL/database: databases store organized information; SQL is a structured query language standardized across DB servers. Microsoft SQL Server commonly TCP 1433. RDP: TCP 3389 remote desktop/application access. SIP: VoIP signaling, commonly 5060/5061, manages VoIP sessions and related communications.

ICMP: network control/error messages; not application data transfer; ping uses ICMP Echo. Can report unreachable/time-exceeded information. GRE: tunnel between endpoints and can encapsulate IP inside IP; no built-in encryption. VPN: virtual private network, concentrator may be hardware/software.

IPsec: Layer 3 security for IP; confidentiality/integrity/anti-replay. AH authenticates/integrity; ESP provides encrypted/authenticated payload protection. VPN gateway/concentrator diagram.

IPsec key exchange: agreement on algorithms/keys using IKE. Notes depict IKE and ESP tunnels, with two phases in traditional IKEv1 terminology. IKE uses UDP 500 and NAT traversal uses UDP 4500.

Transport mode vs tunnel mode diagrams. Authentication Header placement and ESP format. ESP provides encrypted payload and integrity/authentication fields; tunnel mode adds a new outer IP header.

## TCP vs UDP

| Characteristic | TCP | UDP |
|---|---|---|
| Connection model | Connection-oriented | Connectionless |
| Data model | Reliable byte stream | Datagrams |
| Ordering | Maintained | Not guaranteed |
| Retransmission | Built in | Not built in |
| Flow control | Yes | No TCP-style mechanism |
| Congestion control | Yes | Application/other protocol dependent |
| Overhead | Higher | Lower |
| Typical use | Web, SSH, file transfer | DNS, DHCP, streaming/real-time workloads, QUIC |

TCP uses sequence numbers, acknowledgments, checksums and retransmission to provide a reliable ordered byte stream. UDP provides minimal transport mechanism and does not itself guarantee delivery, ordering or duplicate protection.

## Ports
A port number identifies a transport-layer endpoint associated with an application/service. Port numbers are 16-bit values. IANA divides them into System Ports (0–1023), User Ports (1024–49151), and Dynamic/Private Ports (49152–65535). A registered service may use a well-known port by convention, but a service can be configured to use another port.

## Common protocols and ports

| Service | Typical port(s) | Transport / notes |
|---|---:|---|
| FTP control | 21/TCP | File Transfer Protocol |
| FTP data, active mode | 20/TCP | Data connection in active FTP |
| SSH / SFTP / SCP | 22/TCP | Secure Shell |
| Telnet | 23/TCP | Plaintext remote terminal |
| SMTP | 25/TCP | Server-to-server mail transfer |
| DHCP server/client | 67/68 UDP | IPv4 DHCP |
| DNS | 53/TCP + UDP | Queries and other DNS operations |
| HTTP | 80/TCP | Classic HTTP over TCP |
| POP3 | 110/TCP | Mail retrieval |
| IMAP | 143/TCP | Mail access |
| NTP | 123/UDP | Time synchronization |
| SNMP | 161/UDP | Queries/management |
| SNMP traps/informs | 162/UDP | Notifications |
| LDAP | 389/TCP/UDP | Directory access |
| HTTPS | 443/TCP; also common with UDP via QUIC/HTTP/3 | TLS-protected HTTP |
| SMB | 445/TCP | Windows file/print sharing |
| LDAPS | 636/TCP | LDAP over TLS |
| SQL Server | 1433/TCP | Microsoft SQL Server default instance commonly |
| RDP | 3389/TCP and UDP | Remote Desktop |
| RADIUS auth | 1812/UDP | AAA authentication/authorization |
| RADIUS acct | 1813/UDP | Accounting |
| SIP | 5060/UDP/TCP | SIP signaling |
| SIP over TLS | 5061/TCP | Secure SIP |

Port assignments can evolve and applications can use alternate ports; use IANA's service registry when exact protocol/port assignment matters.

## FTP
FTP uses a separate control channel and data channel. TCP 21 is the control connection. In **active mode**, the server initiates the data connection from TCP 20 to the client-designated endpoint. In **passive mode**, the server tells the client which server-side high port to connect to for data, which is usually easier through client-side firewalls/NAT.

FTP by itself is plaintext. Use SFTP (SSH) or FTPS (FTP over TLS) when transport confidentiality and authentication are required.

## SSH, SFTP and SCP
SSH provides encrypted remote access over TCP 22 and can also carry other channels. SFTP is an SSH subsystem designed for secure file transfer; SCP is an older SSH-based secure-copy mechanism.

## Telnet
Telnet provides remote terminal access over TCP 23 but does not protect credentials or command output with encryption. It may still be used in controlled legacy environments, but it should not be treated as a secure management protocol.

## Email protocols
- **SMTP:** transfers/submits mail; TCP 25 is primarily server-to-server, while 587 is the standard message-submission port and 465 is widely used for implicit TLS submission.
- **POP3:** downloads mail from a server, commonly TCP 110; secure POP3 commonly uses TCP 995.
- **IMAP:** synchronizes and accesses mail on a server, commonly TCP 143; IMAPS commonly uses TCP 993.

## DNS
DNS uses UDP and TCP on port 53. UDP is common for ordinary queries. TCP can be used for zone transfers and situations where a reliable stream is required, including some large/extended exchanges. Modern DNS security transports include DoT on TCP 853 and DoH over HTTPS, commonly TCP 443.

## DHCP
IPv4 DHCP uses UDP 67 on servers and UDP 68 on clients. DHCP relay allows a router/L3 device to forward client broadcasts to a centralized server.

## TFTP
TFTP uses UDP 69 and intentionally provides a very small feature set. It has no built-in user authentication or encryption and is typically used only in constrained/managed environments such as network booting or firmware/configuration transfer.

## HTTP/HTTPS and modern transport
HTTPS is HTTP protected by TLS. HTTP/2 commonly runs over TLS/TCP. HTTP/3 uses QUIC, which runs over UDP and incorporates TLS-based security and transport functions inside the QUIC stack.

## NTP
NTP synchronizes clocks across networked systems, commonly using UDP 123. Accurate time is important for log correlation, certificate validation, distributed systems and security events.

## SNMP
SNMP allows monitoring and management of network devices. UDP 161 is commonly used for requests and responses; UDP 162 is used for traps/informs.

- **SNMPv1:** basic community-string model.
- **SNMPv2c:** improved protocol data types/operations but still community-string based.
- **SNMPv3:** adds authenticated and privacy-protected security models.

## LDAP / LDAPS
LDAP provides directory access, often on TCP 389. LDAPS commonly uses TCP 636 for LDAP over TLS. LDAP is frequently used for querying and updating directory information used by identity systems.

## SMB
SMB provides file and printer sharing and other Windows networking functions. Modern SMB commonly uses TCP 445 directly. Older NetBIOS-over-TCP deployments may use TCP 139.

## RDP
Microsoft Remote Desktop commonly uses TCP 3389 and can also use UDP for performance features. Network exposure should be controlled with authentication, access policy and preferably secure remote-access architecture rather than unrestricted Internet exposure.

## SIP
SIP is a signaling protocol for initiating/managing voice and multimedia sessions. 5060 is commonly used for SIP without TLS, and 5061 is commonly used for SIP over TLS. Media such as RTP uses separate ports negotiated during session setup.

## Protocols without TCP/UDP ports
ICMP, GRE and IPsec AH/ESP are not TCP/UDP services and therefore do not have TCP/UDP port numbers:

- ICMP = IP protocol 1
- GRE = IP protocol 47
- ESP = IP protocol 50
- AH = IP protocol 51

IKE commonly uses UDP 500 and UDP 4500 for NAT traversal.

## Protocol stack example
```text
HTTPS application
      ↓
HTTP over TLS
      ↓
TCP or QUIC transport (HTTP/2 uses TCP; HTTP/3 uses QUIC/UDP)
      ↓
IP
      ↓
Ethernet/Wi-Fi
```

## Verified / corrected technical details

- Port ranges are conventionally divided by IANA into System (0–1023), User (1024–49151) and Dynamic/Private (49152–65535); an application can still be configured to use another port.
- HTTPS is not inherently tied to TCP anymore: HTTP/3 uses QUIC over UDP, while HTTP/1.1 and HTTP/2 are commonly carried over TCP with TLS where encrypted.
- FTP active mode uses TCP 20 as the server source port for the data connection; passive mode uses a server-selected high port.
- ICMP, GRE, AH and ESP use IP protocol numbers rather than TCP/UDP ports.

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
- [IANA — Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml)
- [IETF RFC 9293 — TCP](https://www.rfc-editor.org/rfc/rfc9293)
- [IETF RFC 768 — UDP](https://www.rfc-editor.org/rfc/rfc768)
- [IETF RFC 8446 — TLS 1.3](https://www.rfc-editor.org/rfc/rfc8446)
- [IETF RFC 9000 — QUIC](https://www.rfc-editor.org/rfc/rfc9000)
