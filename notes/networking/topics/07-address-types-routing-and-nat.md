# Address Types, Routing and NAT

## Detailed concepts, examples, and edge cases

Unicast: one sender to one receiver; simple point-to-point use; does not inherently scale well to many receivers. Multicast: one source to many subscribed receivers; used for multimedia and dynamic routing updates; specialized infrastructure required.

Anycast: same destination address can be present at multiple endpoints; routing selects the preferred/nearest endpoint. Broadcast: one-to-all on local broadcast domain; IPv4 only; used for routing updates/ARP. IPv6 uses multicast instead of broadcast.

Wireless networking standards under IEEE 802.11/Wi-Fi. 4G/LTE all-IP cellular technology; LTE-Advanced. 5G around 2020, higher frequencies/capacity and major IoT impact.

## IPv4 address categories

### Private IPv4 addresses
RFC 1918 defines the following private ranges:

- `10.0.0.0/8`
- `172.16.0.0/12`
- `192.168.0.0/16`

These are not globally routed on the public Internet. They are commonly used inside local networks and are often translated through NAT for Internet access.

### Loopback
`127.0.0.0/8` is the IPv4 loopback range. `127.0.0.1` is the common loopback address used to test the local TCP/IP stack.

### APIPA / link-local IPv4
When a DHCPv4 client cannot obtain an address, many operating systems automatically configure an address in `169.254.0.0/16`. This provides local-link communication but is not a replacement for normal routed addressing and does not inherently provide Internet connectivity.

### Default gateway
The default gateway is the local Layer-3 router used when no more-specific routing-table entry matches a destination.

## Static routing
A static route is manually configured. It is predictable and has little control-plane overhead, but every network change must be handled administratively.

Simplified decision:

```text
Destination in routing table?
       ├─ yes → use best matching route → forward
       └─ no  → if default route exists → forward via default
                otherwise → drop / report unreachable
```

## Dynamic routing
Dynamic routing protocols exchange reachability information and calculate routes automatically. Examples include RIP, OSPF, IS-IS and BGP. They can react to topology changes but consume control-plane resources and require protocol configuration.

## Routing metrics and administrative distance
A routing protocol uses its own metric to compare paths within that protocol. Examples: RIP uses hop count; OSPF uses cost; BGP uses path attributes/policy rather than a single universal "best metric." Administrative distance (on systems that use the concept) is a local mechanism for comparing routes learned from different sources/protocols.

## First Hop Redundancy Protocols (FHRP)
FHRPs provide a resilient default gateway. Hosts use a virtual IP address; routers share responsibility for forwarding traffic for that virtual gateway.

```text
             Virtual gateway IP
                     |
             +-------+-------+
             |               |
          Router A         Router B
           active            standby
```

The exact protocol behavior differs among HSRP, VRRP and GLBP, but the common goal is first-hop availability.

## NAT — Network Address Translation
NAT changes address information as packets cross a translation boundary. A common example is translating private RFC 1918 source addresses into public addresses for Internet access.

### NAT example

```text
Inside host 192.168.1.10:12345
          |
          | NAT router
          v
Public source 203.0.113.10:40001
          |
       Internet
```

The router maintains state so return traffic can be mapped back to the internal host.

## PAT — Port Address Translation
PAT (NAT overload) allows many internal hosts to share one public IPv4 address by translating transport-layer port numbers as well as addresses.

Example concept:

```text
192.168.1.10:52333 ─┐
                    ├─> 203.0.113.10:40001
192.168.1.20:52344 ─┘   203.0.113.10:40002
```

This lets a single public IPv4 address represent many simultaneous internal connections.

## NAT is not encryption
NAT translates addresses/ports. It does not by itself provide confidentiality, authentication or message integrity.

## PAT translation flow
```text
Inside: 10.0.0.10:50000
      ↓
NAT/PAT router
      ↓
Public: 198.51.100.10:40001
      ↓
Internet
      ↓
Return traffic matched to translation state
```
