# Networking Devices and Network Functions

## Detailed concepts, examples, and edge cases

Networking devices: router routes between IP subnets and is mainly Layer 3; switch is Layer 2 and uses MACs; firewall filters by ports/applications and supports encrypted VPN traffic.

Firewall ingress/egress; NAT and dynamic routing. NAT translates private to public IPv4 and provides address isolation effect. Dynamic routing adapts when links fail. IDS detects/alerts; IPS can stop/block.

Load balancing: distribute load across servers, scale, fault tolerance, TLS offload, caching, prioritization. Proxy is placed between user and server for security/control and may hide direct endpoints.

NAS: network file-level storage, local download/upload, less efficient for some storage patterns. SAN: block-level storage, efficient for read/write workloads, often uses dedicated high-speed storage networking. AP is a wireless bridge rather than a router; large networks may need many APs, central management, roaming/policy concerns.

Wireless LAN controllers: central management of APs, security/performance configuration, consistent deployment, reports/logs and vendor-specific systems.

Networking functions: access to data/databases, secure communication, traffic management/prioritization, protocol support/mobility. CDN: geographically distributed caching. VPN: secure private data over public network using encryption.

VPN deployment options: specialized cryptographic hardware or software-based clients/endpoints. QoS: traffic/packet shaping, prioritization, bandwidth/data-rate control, managed by routers/switches and priority queues.

TTL: prevents indefinite looping; create a timer/hop counter; used to stop packets caught in loops and clear caches. Routing loops occur when routers repeatedly point at each other; TTL stops the packet. DNS TTL controls cache lifetime.

## Router
A router connects different IP networks and makes Layer-3 forwarding decisions using the destination IP address and a routing table. A routing table can contain connected, static, and dynamically learned routes. A router may also provide services such as NAT, DHCP relay, VPN termination, ACL enforcement, and inter-VLAN routing.

**Routing decision:** longest-prefix match is used to choose the most specific matching route; the chosen route determines the next hop and outgoing interface.

## Layer-2 switch
A switch forwards Ethernet frames inside a LAN. It learns source MAC addresses and records them in a MAC/CAM forwarding table. When the destination MAC is known on a different port, the frame is forwarded only there; an unknown-unicast frame is normally flooded within the relevant VLAN. Broadcast and appropriate multicast traffic are also replicated within the broadcast domain.

Modern switches commonly use ASICs for fast forwarding. PoE-capable switches can deliver electrical power over compatible Ethernet cabling to endpoints such as access points, phones and cameras.

## Layer-3 switch
A Layer-3 switch combines high-speed switching with routing functions. It can perform inter-VLAN routing using switched virtual interfaces (SVIs) or routed ports. It does not necessarily replace every function of a dedicated router; WAN, edge, advanced VPN, carrier and specialized routing features may still require a router or firewall.

## Firewall
A firewall enforces traffic policy between interfaces, zones or security domains. Common controls include source/destination IP, protocol, port, connection state, application identity, and sometimes user or content context.

- **Stateless filtering:** evaluates packets using individual header fields without maintaining connection state.
- **Stateful filtering:** tracks connection/session state and can allow return traffic associated with an established flow.
- **Next-generation/application-aware filtering:** can incorporate application identification, user identity, URL/content inspection and other context depending on platform.
- **Ingress filtering:** controls traffic entering an interface/security boundary.
- **Egress filtering:** controls traffic leaving a network or zone.

NAT is related to firewall deployments but is not itself a security control; translation changes addressing and may incidentally hide internal addresses, but security comes from explicit policy enforcement.

## IDS and IPS
**IDS (Intrusion Detection System)** monitors traffic or events and generates alerts. **IPS (Intrusion Prevention System)** sits inline or otherwise has an enforcement path so it can block/reset/drop traffic that matches a configured detection policy.

A practical distinction is **visibility vs enforcement**: IDS is commonly passive/out-of-band; IPS has an active blocking capability. Exact architecture varies by product.

## Load balancer
A load balancer presents a service endpoint while distributing requests among multiple backend systems. Common functions include:

- health checks and removing failed servers;
- balancing by algorithms such as round-robin, weighted or least-connections;
- TLS termination/offload (when configured);
- session persistence where required;
- caching or compression on some platforms;
- horizontal scalability and fault tolerance.

A load balancer does not automatically make an application highly available: the back-end service, storage, dependencies and load-balancing tier must all be considered.

## Proxy
A proxy acts as an intermediary between clients and servers. Depending on the design, it can terminate one connection and make another on the client's behalf, enforce access policy, cache content, inspect traffic, or hide internal addressing. A **forward proxy** represents clients; a **reverse proxy** represents servers/services.

## NAS vs SAN

| NAS | SAN |
|---|---|
| Network Attached Storage | Storage Area Network |
| File-level access | Block-level access |
| Clients access files/shares | Hosts see storage as block devices/LUNs |
| Common protocols: SMB, NFS | Common technologies: Fibre Channel, iSCSI |
| Simpler file-sharing model | Optimized for storage/network block workloads |

## Wireless access point (AP)
An access point provides Layer-2 bridging between wireless clients and a wired LAN. An AP is not inherently a router: routing/NAT can exist elsewhere in the network. A large WLAN can use many APs and a centralized controller/cloud-management system to coordinate configuration, RF settings, roaming assistance, security policies and firmware deployment.

## WLAN controller
A WLAN controller or cloud-management platform centralizes AP administration. Typical tasks include configuration templates, SSIDs, security settings, RF/channel management, software updates, monitoring, logging and client visibility.

## CDN
A Content Delivery Network uses geographically distributed edge servers/caches to deliver content closer to users. This can reduce latency and backbone traffic for cacheable content, while improving scalability and resilience. Dynamic/origin-bound requests may still have to reach the origin service.

## Quality of Service (QoS)
QoS is a policy framework for managing traffic under congestion. It can classify and mark traffic, place traffic into queues, prioritize certain classes, shape or police traffic, and reserve/allocate bandwidth according to policy. QoS does not create bandwidth; it controls which traffic receives preferential treatment when resources are constrained.

## TTL and Hop Limit
IPv4 packets carry a TTL field that is decremented by routers. IPv6 uses a Hop Limit field with the same loop-prevention purpose. When the value reaches zero, the packet is discarded and an ICMP Time Exceeded message may be returned. DNS also uses a TTL value, but there it means how long cached DNS data may be considered usable; it is not a router hop counter.

## Typical enterprise traffic path
```text
Client → Access Switch → Distribution/L3 Switch or Router → Firewall → Internet/WAN
                                    |
                                    +→ Server / Data Center
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
- [Cisco — Layer-2 security features (port security, DHCP snooping, DAI, IP Source Guard)](https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-series-switches/72846-layer2-secftrs-catl3fixed.html)
