# Command Line Tools

## Overview
Command-line network tools provide quick, scriptable visibility into reachability, routing, DNS, packet capture, sockets, and interface configuration.

## Core concepts
- `ping` tests basic IP reachability using ICMP Echo where permitted.
- `traceroute`/`tracert` reveals the path toward a destination using TTL/hop-limit behavior and response messages.
- `nslookup` and `dig` query DNS and help diagnose name resolution.
- `tcpdump` captures packets and supports filters for targeted analysis.
- `netstat` shows sockets and network statistics; `ss` is the modern Linux alternative for socket inspection.
- `ip addr`, `ip route`, and Windows `ipconfig` display interface/address information.

## Practical examples
- Use `dig example.com` to inspect DNS answers and `tcpdump` to capture selected traffic for analysis.
- Use `ss -tulpn` on Linux to inspect listening TCP/UDP sockets.

## Security / mitigation
- Prefer least-privilege execution; packet capture generally requires elevated privileges.
- Sanitize captures and command output before sharing them.
- Record the exact test conditions so results are reproducible.

## Detection / troubleshooting
- Unexpected listening ports, recurring failed DNS queries, unusual routes, and persistent outbound connections can all provide useful investigative clues.

## Detailed notes captured from the notebook
# Command Line Tools

## 1. ping
- Test device availability.
- ICMP packets!!
  - Usually blocked.

## 2. traceroute
- Maps route of a packet.
- Uses TTL exceeded msg.
  - Again ICMP → filtered.

## 3. nslookup & dig
- Query DNS server of IP → domain resolution.
- Source syntax note: `nslookup << dig` **[source notation unclear; preserve concept]**

## 4. tcpdump
- Capture packets from command line.
- View / save in file.
- Filters etc.
  - Analyse using Wireshark.

## 5. netstat
- Network statistics.
  - `-a` → all active con.
  - `-n` → does not resolve names.

## 6. ifconfig / ip addr / ipconfig
- Find your network.
- Interfaces, IP addr etc.

## 7. ARP protocol
- Determine MAC addr based on IP addr.
- From ARP cache.

## Further reading (optional)
[Nmap — Host Discovery](https://nmap.org/book/host-discovery.html)
