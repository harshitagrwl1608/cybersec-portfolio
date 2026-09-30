# DHCP, DHCP Relay, DHCPv6 and IPv6 Autoconfiguration

## Detailed concepts, examples, and edge cases

DHCP history: manual IPv4 configuration was common; BOOTP predates DHCP and did not provide the full automatic configuration behavior. DHCP introduced automatic IP configuration. DORA four-step process shown.

DORA diagram: Discover broadcast from client; Offer from server; Request from client; ACK from server. Example subnet 10.10.10.0/24 and server/router addresses. Shows broadcast destination 255.255.255.255 and UDP ports.

Enterprise DHCP: broadcast domains are limited by routers; multiple servers provide redundancy; scalability may require remote-site management. DHCP relay lets a router forward client requests to a DHCP server located on another subnet.

DHCP relay flow: client discovery reaches router/relay, relay unicasts to DHCP server; server offer returns through relay and is delivered to client. Request and ACK follow similar relay path.

DHCP scope properties: IP address range/exclusions, lease duration, and additional options such as DNS, default gateway and VoIP information. Pools group addresses; each scope typically has one address pool. Reservations bind a device to a chosen address.

DHCP address assignment: dynamic allocation from pool, automatic assignment, manual reservation. Lease is temporary; allocation gives a lease time; renewal extends the lease. Manual/admin reservation can keep a specific address.

DHCP renewal: client renews with original server and later can rebind with another DHCP server if the original is unavailable. DHCP options define configuration; common options include subnet mask and DNS. Option 121 can carry classless static routes in DHCPv4.

DHCPv6 server process is conceptually similar but uses IPv6 mechanisms. NDP: no broadcast, uses ICMPv6 multicast. Neighbor MAC/address discovery replaces IPv4 ARP behavior. SLAAC automatically configures addresses; DAD detects duplicate addresses. Router Solicitation/Advertisement discover routers.

Finding routers: ICMPv6/NDP messages carry network information such as prefix, prefix length and DNS-related information in supported deployments. SLAAC derives an IPv6 address using advertised prefix + interface identifier/stable random method, then performs DAD.

Before assigning IPv6 address, DAD checks uniqueness. CLI examples: `ip addr show` / `ip -6 addr`, `ip route`, `sudo dhclient -v` for verbose DHCPv4 behavior. Commands inspect interface addresses, routing tables and DHCP exchanges.

## DHCPv4
DHCP provides IPv4 configuration automatically. Common values include IP address, subnet mask, default gateway, DNS servers, domain information and lease duration.

### Historical context
BOOTP predates DHCP and provided a more static/limited configuration model. DHCP added dynamic allocation and additional options while preserving interoperability concepts from BOOTP.

## DHCP DORA process

```text
Client                         DHCP server
  | -- DHCPDISCOVER ----------> |
  | <----------- DHCPOFFER ----- |
  | -- DHCPREQUEST ------------> |
  | <----------- DHCPACK ------- |
```

- **DISCOVER:** client searches for available DHCP servers.
- **OFFER:** a server offers an address/configuration.
- **REQUEST:** client requests the offered configuration.
- **ACK:** server confirms the lease and options.

## DHCP relay
Broadcasts normally do not cross routers. A DHCP relay receives client broadcasts and forwards them as unicasts or otherwise relayed messages toward a DHCP server.

```text
Client subnet -- Router/L3 relay ===== DHCP Server subnet
                   |
                   +-- DHCP relay/helper
```

## DHCP scopes/pools
A DHCP scope defines a set of addresses and configuration options for a subnet. A scope can include exclusions, lease durations and options such as DNS/default gateway.

## DHCP address assignment models
- **Dynamic assignment:** address comes from a pool and is leased for a period.
- **Automatic assignment:** server may permanently associate an address with a client according to server policy.
- **Reservation:** a specific client identifier/MAC mapping receives a predictable address.

## DHCP lease lifecycle
The lease is temporary. The client renews before expiration and can rebind through other servers if the original server does not respond. The server retains the lease state and can reclaim an expired address.

## DHCP options
Options convey configuration beyond the address itself. Common examples include subnet mask (Option 1), router/default gateway (Option 3), DNS servers (Option 6), and many other vendor or application-specific options.

## DHCP security
A rogue DHCP server can provide a malicious default gateway, DNS server or other settings. On managed switches, **DHCP snooping** can mark legitimate DHCP-server/uplink interfaces trusted and block DHCP server messages from untrusted ports.

## DHCPv6 vs SLAAC
IPv6 does not use DHCPv4 DORA. IPv6 hosts commonly learn prefixes and default-router information through Router Advertisements (NDP). DHCPv6 can provide stateful address allocation or additional configuration.

### SLAAC flow

```text
IPv6 host
   ↓
link-local address
   ↓
DAD
   ↓
Router Solicitation / Router Advertisement
   ↓
learn prefix + default router
   ↓
form global/ULA address
   ↓
DAD
```

The default gateway in IPv6 is learned from Router Advertisements rather than a DHCPv6 "router option" in the IPv4 sense.

## DHCPv6 message style
DHCPv6 is a separate protocol with messages and ports different from DHCPv4. It can operate alongside SLAAC. The precise behavior is controlled by RA flags such as Managed (M) and Other configuration (O).

## Stateless vs stateful DHCPv6
- **Stateless DHCPv6:** addresses are formed by SLAAC; DHCPv6 provides other information such as DNS configuration.
- **Stateful DHCPv6:** DHCPv6 assigns the IPv6 address itself in addition to configuration information.

## Static address assignment on servers
Servers and infrastructure devices can also use manually configured addresses or reservations. Static assignment is useful when predictable addressing is required, but documentation and lifecycle management are essential.

## DHCPv4 DORA
```text
DISCOVER → OFFER → REQUEST → ACK
```

## DHCP relay
```text
Client VLAN → L3 relay/helper → routed network → DHCP server
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [IETF RFC 2131 — DHCP](https://www.rfc-editor.org/rfc/rfc2131)
- [IETF RFC 4862 — IPv6 SLAAC](https://www.rfc-editor.org/rfc/rfc4862)
