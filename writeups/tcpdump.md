# tcpdump — Cheatsheet

**Source:** TryHackMe — Tcpdump: The Basics (Cyber Security 101, Tools module).

## 01 — Basic tcpdump Capture

`tcpdump` is a command-line packet analyzer built around packet capture and Berkeley Packet Filter (BPF) expressions.

### Identify interfaces

```bash
sudo tcpdump -D
```

or:

```bash
ip link
```

### Capture on an interface

```bash
sudo tcpdump -i eth0
```

Replace `eth0` with your actual interface.

### Write packets to a pcap file

```bash
sudo tcpdump -i eth0 -w capture.pcap
```

Read it later with:

```bash
tcpdump -r capture.pcap
```

### Stop after a fixed number of packets

```bash
sudo tcpdump -i eth0 -c 100
```

### Why save a pcap?

Saving packets lets you:

- Analyze them later
- Open them in Wireshark
- Share a controlled evidence set
- Avoid losing traffic after stopping capture

## 02 — Capture Options

### Useful options

| Option | Purpose |
|---|---|
| `-i` | Select interface |
| `-w` | Write raw packets to a file |
| `-r` | Read packets from a pcap |
| `-c` | Stop after N packets |
| `-n` | Do not resolve hostnames |
| `-nn` | Do not resolve hostnames or service/port names |
| `-v` | Verbose output |
| `-vv` | More verbose |
| `-vvv` | Maximum verbosity |
| `-A` | Print packet payload in ASCII |
| `-x` | Print packet data in hexadecimal |
| `-xx` | Include link-layer header in hex output |

### Examples

```bash
sudo tcpdump -i eth0 -nn
```

```bash
sudo tcpdump -i eth0 -c 50
```

```bash
sudo tcpdump -i eth0 -nn -w traffic.pcap
```

### Why use `-nn`?

It prevents DNS and service-name resolution, making output faster and less ambiguous.

For example, instead of resolving an IP into a hostname or `443` into `https`, tcpdump keeps the numeric values.

## 03 — Filtering Expressions

tcpdump filters are written using BPF syntax.

### By protocol

```bash
sudo tcpdump -i eth0 ip
sudo tcpdump -i eth0 ip6
sudo tcpdump -i eth0 tcp
sudo tcpdump -i eth0 udp
sudo tcpdump -i eth0 icmp
```
![image](images/tcpdump_02.png)

![image](images/tcpdump_01.png)

### By port

```bash
sudo tcpdump -i eth0 port 53
sudo tcpdump -i eth0 port 443
```
![image](images/tcpdump_04.png)


Source/destination port:

```bash
sudo tcpdump -i eth0 src port 443
sudo tcpdump -i eth0 dst port 80
```

### By host/IP

```bash
sudo tcpdump -i eth0 host 192.168.1.10
```
![image](images/tcpdump_03.png)

Only source:

```bash
sudo tcpdump -i eth0 src host 192.168.1.10
```

Only destination:

```bash
sudo tcpdump -i eth0 dst host 192.168.1.10
```

## 04 — Logical Operators and IP Filters

### AND

Both conditions must match:

```bash
sudo tcpdump -i eth0 'host 1.1.1.1 and tcp'
```

### OR

Either condition can match:

```bash
sudo tcpdump -i eth0 'udp or tcp'
```

### NOT

Exclude a condition:

```bash
sudo tcpdump -i eth0 'not arp'
```

### Combine filters

```bash
sudo tcpdump -i eth0 'src host 192.168.1.10 and dst port 443'
```

Use parentheses when combining more complicated expressions:

```bash
sudo tcpdump -i eth0 '(tcp port 80 or tcp port 443) and host 192.168.1.10'
```

Quoting the expression is a good habit because the shell also interprets operators such as parentheses.

## 05 — Advanced Filters

### Filter by packet length

BPF supports packet-length tests:

```bash
sudo tcpdump -i eth0 'greater 1500'
```

```bash
sudo tcpdump -i eth0 'less 100'
```

This can help locate unusually large or small packets.

### Inspect protocol header bytes

BPF supports access to packet bytes using protocol-relative offsets.

For example, TCP flags can be inspected with expressions based on the TCP header.

A commonly used shorthand is:

```text
tcp[tcpflags]
```

Examples:

```bash
sudo tcpdump -i eth0 'tcp[tcpflags] & tcp-syn != 0'
```

```bash
sudo tcpdump -i eth0 'tcp[tcpflags] & tcp-fin != 0'
```

```bash
sudo tcpdump -i eth0 'tcp[tcpflags] & tcp-rst != 0'
```

The exact byte offsets depend on the protocol/header being inspected, so protocol-aware names are preferable when available.

### Packet payload/header byte tests

General syntax:

```text
proto[expr:size]
```

Where:

- `proto` identifies the protocol header
- `expr` is the byte offset
- `size` is the number of bytes to inspect

Use this carefully: offsets are protocol-dependent.

## 06 — Display Options and Practical Recipes

### Brief output

```bash
sudo tcpdump -i eth0 -nn
```

### ASCII payload

```bash
sudo tcpdump -i eth0 -A
```

Useful for readable protocols such as unencrypted HTTP.

### Hex output

```bash
sudo tcpdump -i eth0 -x
```

Include link-layer header:

```bash
sudo tcpdump -i eth0 -xx
```

### Verbose output

```bash
sudo tcpdump -i eth0 -vv
```

### Capture DNS traffic

```bash
sudo tcpdump -i eth0 -nn 'udp port 53'
```

### Capture HTTPS traffic

```bash
sudo tcpdump -i eth0 -nn 'tcp port 443'
```

### Capture traffic to/from a host

```bash
sudo tcpdump -i eth0 -nn 'host 192.168.1.10'
```

### Save filtered traffic

```bash
sudo tcpdump -i eth0 -nn -w filtered.pcap 'tcp port 443'
```

Then inspect it:

```bash
tcpdump -nn -r filtered.pcap
```

### Count matching packets

```bash
sudo tcpdump -i eth0 -nn -c 100 'tcp port 443'
```

### Practical investigation workflow

```text
1. Identify interface
2. Capture or open pcap
3. Use -nn to avoid name resolution
4. Narrow with protocol/host/port filters
5. Save interesting traffic
6. Open the pcap in Wireshark for deeper protocol analysis
```

