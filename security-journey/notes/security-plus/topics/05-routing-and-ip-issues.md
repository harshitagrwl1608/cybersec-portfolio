# Routing and IP Issues

**Source pages:** added notes PDF, pages 14–16.

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
