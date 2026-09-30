# Network Software Tools

## Overview
Network software tools provide visibility without necessarily changing the network. They are used for packet analysis, discovery, topology mapping, and measurement.

## Core concepts
- Protocol analyzers capture and decode frames/packets so you can inspect protocols, timings, retransmissions, and errors.
- Nmap performs host discovery and port/service reconnaissance and can run scripts for authorized assessment.
- CDP is Cisco proprietary; LLDP is an IEEE standardized neighbor-discovery protocol used across vendors.
- Speed-test sites provide a rough measurement of throughput and latency to a test service, not a perfect representation of every path.

## Practical examples
- Wireshark can identify DNS queries, TCP handshakes, retransmissions, and protocol anomalies.
- Nmap can enumerate exposed services on an authorized host/network.

## Security / mitigation
- Use only authorized targets.
- Capture minimally and protect packet captures because they may contain credentials or sensitive payloads.
- Keep tool output time-stamped and tied to the test conditions.

## Detection / troubleshooting
- Look for repeated scans, unexpected service exposure, abnormal DNS traffic, unusual protocols, and topology changes.

## Detailed notes captured from the notebook
# Network Software Tools

## 1. Protocol Analyzer
> “Tool to troubleshoot slow network”
- Gather frames from anywhere.
- Analyze patterns.
- Big data analysis.

## 2. Nmap
> “Find info about any networking device without logging in”
- Port scan.
- OS.
- Scripts.
- Service scan.
- Active reconnaissance.
- Visual map of the network.
- Rogue system detection.

## 3. Discovering network devices
- Switched networks can be a challenge.
  - Many different interfaces.
  - Different config.
  - Identify port, MAC, VLAN etc.
- CDP + Cisco Discovery Protocol.
  - Proprietary.
- LLDP — Link Layer Discovery Protocol.
  - Open source, common.

## 4. Speed test sites
- Bandwidth.
- Test pre & post changes.
- Measure at different times of day.
- Depends on location.
- Use your ISP provided.

## Further reading (optional)
[Nmap — Official Guide](https://nmap.org/book/)
