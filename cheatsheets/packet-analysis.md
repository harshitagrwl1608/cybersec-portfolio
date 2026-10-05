# Packet Analysis

## Wireshark display filters
```
ip.addr == 10.0.0.1
ip.src == 10.0.0.1
ip.dst == 10.0.0.1
tcp.port == 443
udp.port == 53
dns
http
tls
icmp
tcp.flags.syn == 1
tcp.flags.reset == 1
```

## tcpdump
```bash
tcpdump -i eth0
tcpdump -i eth0 -nn
tcpdump -i eth0 host 10.0.0.1
tcpdump -i eth0 port 53
tcpdump -i eth0 tcp
tcpdump -i eth0 -w capture.pcap
tcpdump -r capture.pcap
```

## Fast triage
1. Establish baseline: who talks to whom?
2. Look for unusual destinations/domains.
3. Check DNS around suspicious connections.
4. Inspect TCP flags and retransmissions.
5. Look for cleartext credentials/data.
6. Correlate timestamps with host logs.

`-nn` prevents name/service resolution in tcpdump output.
