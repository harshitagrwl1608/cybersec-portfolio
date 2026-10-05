# Networking Fundamentals

## OSI
7 Application · 6 Presentation · 5 Session · 4 Transport · 3 Network · 2 Data Link · 1 Physical.

**Think:** Application data → segments → packets → frames → bits.

## Devices
Hub = repeats to all ports.  
Switch = forwards by MAC.  
Router = forwards by IP.  
Firewall = enforces traffic policy.  
IDS/IPS = detects/blocks suspicious traffic.  
Load balancer = distributes connections.

## IPv4 essentials
Private: `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`.  
Loopback: `127.0.0.0/8`.  
APIPA/link-local: `169.254.0.0/16`.

## Subnetting
Hosts per normal IPv4 subnet = `2^(host bits) - 2`.
/24 = 256 addresses, 254 usable.  
/26 = 64 addresses, 62 usable.  
/30 = 4 addresses, 2 usable.

VLSM = different subnet sizes based on need.

## IPv6
Global unicast = globally routable.  
Link-local = `fe80::/10`.  
ULA = `fc00::/7`.  
Multicast = `ff00::/8`.  
No broadcast in IPv6.

NDP replaces many ARP-style functions. SLAAC uses Router Advertisements for autoconfiguration.

## Routing
Static = manually configured.  
Dynamic = routing protocol exchanges routes.

Router selection considers prefix length, administrative distance, and metric.

FHRP provides a resilient virtual first-hop gateway.

## NAT / PAT
NAT = translates addresses.  
PAT = translates addresses + ports so many internal hosts can share a public IP.

**NAT is not encryption.**

## VLAN / trunk
Access port = one VLAN.  
Trunk = carries multiple VLANs with tags.  
Native VLAN = untagged traffic on many 802.1Q implementations.

Inter-VLAN routing requires a Layer-3 function.

## STP
Prevents Layer-2 switching loops.  
Root bridge = reference point for tree calculation.  
RSTP = faster convergence.

Port security + DHCP snooping + DAI strengthen Layer-2 security.

## Ethernet / media
Twisted pair = common copper LAN medium.  
Fiber = high bandwidth, longer distance, EMI resistant.  
Single-mode = longer distance.  
Multimode = shorter/common campus/data-center links.

## Topologies
Star · mesh · hybrid · spine-leaf.  
Three-tier campus = core → distribution → access.