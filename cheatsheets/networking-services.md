# Networking Services & Secure Communications

## DNS
A = IPv4 · AAAA = IPv6 · CNAME = alias · MX = mail · NS = authoritative server · TXT = text/policy · PTR = reverse lookup.

DoT = DNS over TLS, commonly 853.  
DoH = DNS over HTTPS, commonly 443.

## DHCP
IPv4 DORA = **Discover → Offer → Request → Acknowledge**.

Relay forwards DHCP between subnets.  
Reservation = predictable client address.  
DHCPv6 and SLAAC provide IPv6 configuration mechanisms.

## Time
NTP = network time synchronization.  
NTS = security for NTP.  
PTP = high-precision time synchronization.

**Time matters for:** Kerberos, log correlation, certificates, investigations.

## Common services
HTTP/HTTPS · SSH · FTP/FTPS · SMTP · POP3/IMAP · LDAP/LDAPS · SMB · RDP · SNMP · Syslog.

Use the dedicated [Protocols & Ports](networking-ports.md) sheet for port lookup.

## VPN / IPsec
AH = integrity/authentication without confidentiality.  
ESP = confidentiality + integrity/authentication features.  
IKE/IKEv2 = negotiates security associations/keys.

Transport mode = protects payload.  
Tunnel mode = encapsulates whole original IP packet.

## Remote access
Client-to-site = user/device to organization.  
Site-to-site = network to network.  
Full tunnel = all/most traffic through VPN.  
Split tunnel = selected organization traffic through VPN.

## Network management
SNMP = monitoring/management.  
SNMP traps = asynchronous notifications.  
Syslog = event messages.  
NetFlow/flow data = who talked to whom/where/how much, without full packet content.

Port mirroring/SPAN = copy traffic to an analysis interface.

## Secure network design
Management plane should be isolated.  
Out-of-band management = separate management path.  
Use segmentation, ACLs, firewalls, VPNs, and least privilege.

## Wireless essentials
WPA2-Personal = PSK.  
WPA3-Personal = SAE.  
Enterprise = 802.1X/EAP + backend authentication such as RADIUS.

2.4 GHz = more range/interference.  
5 GHz = more capacity/shorter range.  
6 GHz = newer spectrum where supported.
