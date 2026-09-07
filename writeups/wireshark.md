# Wireshark — Cheatsheet

**Source:** TryHackMe — Wireshark: The Basics (Cyber Security 101, Tools module).
A few sections go slightly past strict "basics" scope since this doubles as a living reference I keep adding to.

## 01 — Interface and Capture

### What Wireshark does

Wireshark captures network traffic and displays packets at different protocol layers. It can decode protocols, filter traffic, reconstruct conversations and expose application-layer data when the traffic is not encrypted.

### Start a capture

1. Open Wireshark.
2. Select the correct network interface.
3. Start capturing.
4. Generate or wait for the traffic you want to investigate.
5. Stop the capture.

Common interfaces:

```text
Ethernet
Wi-Fi
Loopback
VPN/tunnel interfaces
```

### Main areas of the interface

Wireshark normally presents packet information in three main panes:

#### 1. Packet List

A summary of each packet, including fields such as:

- Packet number
- Time
- Source
- Destination
- Protocol
- Length
- Info

Select a packet for deeper investigation.

#### 2. Packet Details

Expands the selected packet into protocol layers and fields.

Example:

```text
Frame
└── Ethernet II
    └── Internet Protocol Version 4
        └── Transmission Control Protocol
            └── Hypertext Transfer Protocol
```

#### 3. Packet Bytes

Shows the raw packet bytes and their ASCII representation.

This is useful for finding readable strings, headers and application data.

### Capture vs display filters

**Capture filter:** controls what is collected while capturing.

**Display filter:** captures traffic first and then controls what is shown.

Do not confuse the two syntaxes.

## 02 — Packet Dissection

### Packet dissection

Packet dissection means breaking a packet into protocol layers and fields so that the analyst can understand what happened.

#### Frame

The Frame section contains capture-level information and details associated with the captured frame.

#### Ethernet

Common Layer-2 information:

- Source MAC address
- Destination MAC address
- EtherType

#### IP

Common IPv4 information:

- Source IP
- Destination IP
- TTL
- Protocol

#### TCP

Important TCP fields include:

- Source port
- Destination port
- Sequence number
- Acknowledgment number
- Flags
- Window size

#### UDP

Important UDP fields include:

- Source port
- Destination port
- Length
- Checksum

#### Application layer

Depending on traffic, Wireshark may dissect protocols such as:

```text
HTTP
DNS
FTP
SMB
TLS
DHCP
ICMP
```

### Protocol errors

Wireshark can flag protocol problems such as:

- Malformed packets
- Checksum issues
- Retransmissions
- TCP segment reassembly
- Unexpected or deprecated protocol behaviour

Treat expert warnings as investigation clues, not automatic proof of malicious activity.

## 03 — Display Filtering

Display filters are used after packets have been captured.

### Protocol filters

```text
tcp
udp
dns
http
icmp
arp
tls
```

### Port filters

```text
tcp.port == 443
udp.port == 53
tcp.srcport == 443
tcp.dstport == 80
```

### IP filters

```text
ip.addr == 192.168.1.10
ip.src == 192.168.1.10
ip.dst == 192.168.1.10
```

### Combine conditions

```text
ip.addr == 192.168.1.10 && tcp.port == 443
```

OR:

```text
tcp.port == 80 || tcp.port == 443
```

NOT:

```text
!(arp)
```

### Find packets

Use **Edit → Find Packet** or the packet search feature.

Useful search types can include:

- Display filter
- Hex value
- String
- Regular expression

Select an appropriate search field before searching.

### Conversation filters

When investigating a specific conversation, Wireshark can create a filter from the selected packet/conversation. This is useful when you need to isolate a particular host, port or flow.

## 04 — Packet Navigation

### Go to a packet

Use **Go → Go to Packet** to jump directly to a packet number.

Useful when a challenge or investigation tells you to inspect a specific packet.

### Mark packets

Right-click a packet and choose the packet-marking option.

Marked packets are highlighted so you can return to important evidence later.

> Packet marking is generally a temporary investigation aid and should not be confused with persistent packet comments.

### Packet comments

Add a comment to a packet when you want to record why it matters.

Typical uses:

- Evidence
- Investigation notes
- Suspicious activity
- Important protocol events

Comments can remain associated with the capture when the capture format supports them.

### Time display

Wireshark can change how packet timestamps are displayed.

Look under:

**View → Time Display Format**

Useful choices include:

- Seconds since beginning of capture
- Date and time
- Seconds since previous packet

Relative timing can be especially useful when reconstructing an attack sequence.

## 05 — Following Streams

Following a stream reconstructs traffic belonging to a conversation so that it is easier to read at the application level.

### Follow TCP

Select a TCP packet and use:

**Analyze → Follow → TCP Stream**

Wireshark reconstructs the TCP conversation when possible.

Typical uses:

- Read HTTP requests/responses
- Inspect text-based protocols
- Understand client/server communication
- Identify credentials or commands in unencrypted traffic

### Follow HTTP

For HTTP traffic, Wireshark can also provide an HTTP-stream view when the protocol is correctly dissected.

### Colours

The stream view commonly distinguishes directions visually.

The exact colours can vary with theme/version, so focus on the direction and content rather than relying on a particular colour.

### Important limitation

Encrypted protocols such as HTTPS/TLS generally do not expose readable application data merely by following the stream. Decryption requires the appropriate keys/session secrets and configuration.

## 06 — Exporting, Merging and File Details

### Export packets

To export selected packets:

1. Select the required packets.
2. Use **File → Export Specified Packets**.
3. Choose the destination and packet range/options.

This is useful when sharing a small evidence set instead of an entire capture.

### Export objects

Wireshark can reconstruct and export objects from supported protocols.

Common examples include:

```text
HTTP
SMB
TFTP
DICOM
```

Typical workflow:

**File → Export Objects → <protocol>**

This can reveal transferred files that are embedded in a capture.

### Merge capture files

To combine captures, use:

**File → Merge**

Save the merged result before continuing analysis when appropriate.

Merging is useful when evidence is split across multiple capture files.

### Capture file properties

Use:

**Statistics → Capture File Properties**

Depending on the capture, useful information may include:

- File hash
- Capture start/end time
- Capture comments
- Interfaces
- Statistics

These details help establish context and prioritize an investigation.

## 07 — Expert Information and Packet Colouring

### Expert Information

Wireshark's Expert Information system highlights protocol conditions that may deserve attention.

Open it through the relevant **Analyze/Expert Information** interface in your version of Wireshark.

Common severity categories:

| Severity | Typical meaning |
|---|---|
| Chat | Normal/interesting protocol information |
| Note | Notable event |
| Warn | Unusual condition worth checking |
| Error | Significant protocol problem |

Examples of conditions may include:

- Checksum-related issues
- Malformed packets
- Retransmissions
- Deprecated protocol usage
- Other protocol anomalies

These are **hints**, not proof of an attack.

### Packet colouring

Colouring helps visually identify traffic based on protocol or user-defined rules.

Open:

**View → Coloring Rules**

You can:

- Create custom rules
- Edit existing rules
- Disable rules
- Reorder rules

Example idea:

```text
TCP traffic → one visual rule
DNS traffic → another
Suspicious protocol/content → custom highlight
```

### Filters vs colouring

- **Display filter:** hides packets that do not match.
- **Colouring rule:** keeps packets visible but highlights matching packets.
