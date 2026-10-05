# Network Attacks

## ARP poisoning / spoofing
ARP maps **IP → MAC** on a local subnet.

Forged ARP replies change the victim's IP→MAC mapping → traffic is redirected through the attacker.

**Scope:** local Layer-2 network.

### Indicators
- Same IP associated with changing MAC addresses.
- Duplicate/conflicting IP→MAC mappings.
- Unsolicited/gratuitous ARP anomalies.

### Defenses
Dynamic ARP inspection · static bindings where appropriate · segmentation · encrypted protocols.

## MAC flooding
Flood a switch MAC table with many fake source addresses.

**Defenses:** switch port security, MAC limits, segmentation, monitoring.

## VLAN hopping
Move traffic from one VLAN to another.

Switch spoofing = abuse trunk negotiation.  
Double tagging = exploit VLAN tagging/native-VLAN behavior.

**Defenses:** disable unnecessary trunk negotiation; explicitly configure trunks/access ports; isolate native VLAN.

## DoS / DDoS
DoS = exhaust service/network resources.  
DDoS = distributed sources.  
Reflection/amplification = third-party systems amplify attacker traffic.

**Indicators:** sudden traffic/request-rate spikes, resource exhaustion, many sources targeting one service.

## MITM / On-path
Attacker places themselves between communicating parties; may observe, relay, or modify traffic.

**Defenses:** TLS/HTTPS, VPNs, certificate validation, secure Wi-Fi, segmentation.

## DNS attacks
DNS poisoning/spoofing = false DNS resolution.  
Domain/URL hijacking = manipulate naming/infrastructure to redirect users.

**Defenses:** DNSSEC where appropriate, strong registrar/account controls, monitoring, TLS.

## Cleartext credential interception
FTP, Telnet, HTTP and plain POP3/SMTP can expose data on the wire.

**Prefer:** SFTP/SSH, HTTPS, FTPS, IMAPS, SMTP over TLS/STARTTLS where supported.

## Detection mindset
**Source → target → protocol/port → volume → timing → repeated pattern → related host activity**

A single packet/connection is not proof; correlate with logs and endpoint telemetry.