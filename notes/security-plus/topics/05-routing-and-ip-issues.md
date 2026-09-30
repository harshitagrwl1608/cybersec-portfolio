# Routing and IP Issues

## Overview
Routing determines where packets should go next. IP troubleshooting therefore focuses on addressing, subnetting, routes, gateways, DHCP allocation, duplicate addresses, and evidence from path-testing tools.

## Core concepts
- A routing table maps destinations to next hops or interfaces.
- A default route (for IPv4, commonly 0.0.0.0/0; for IPv6, ::/0) is used when no more specific route matches.
- Missing or incorrect routes can cause drops, unreachable destinations, or asymmetric paths.
- DHCP scope exhaustion can prevent new clients from receiving addresses; IPAM helps track address use in larger environments.
- Duplicate IP addresses can cause intermittent or asymmetric connectivity, especially when static assignments conflict with DHCP.
- Ping and traceroute help distinguish reachability and path problems from application-layer failures.

## Practical examples
- A client with a correct IP address but an incorrect default gateway may reach its local subnet but fail to reach remote networks.
- A DHCP scope with no free addresses can make new clients appear disconnected even though the network itself is healthy.

## Security / mitigation
- Verify documentation and intended addressing first.
- Keep static reservations organized.
- Avoid overlapping DHCP and static-address ranges.
- Use IPAM in larger environments.
- Monitor DHCP lease utilization and routing changes.

## Detection / troubleshooting
- Look for DHCP failures, duplicate-address alerts, route changes, asymmetric traffic, ICMP unreachable messages, and abnormal hop changes.

## Detailed notes captured from the notebook
# Routing and IP Issues

## Routing tables
- How to get from P-A to P-B.
- Routes, subnets.
- Default gateway.
- Network map.
- Data flow.

## Missing route
- Route to destination doesn't exist.
  - Drop packet.
  - Sometimes ICMP.

## Gateway of last resort
- If it does not match anything.
- Static route: `0.0.0.0/0`
- For large orgs → large routing tables.

## Addr pool exhaustion
- Client requests an IP addr.
  - Local subnet common, only.
- Check DHCP server.
- Add more IPs, if possible.
- IP addr management (IPAM) may help there.
- Lower lease time.

## Troubleshooting IP config
- Check documentation.
  - IP addr, subnets, default gateway.
- Monitor traffic/leaving from network.
  - Check config.
  - Traceroute, ping.

## Duplicate IP addr
- Static addr assignment.
  - Manual config.
- DHCP.
  - DHCP server overload.
  - Rogue DHCP servers.
- Intermittent connectivity.
  - Might seem right.
  - Usually duplicate addr.
  - One blocked by OS.
- Use `ping` while manually config. IP.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
