# Command Line Tools

**Source pages:** added notes PDF, pages 22–23.

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
