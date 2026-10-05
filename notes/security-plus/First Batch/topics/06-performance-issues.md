# Performance Issues

## Overview
Network performance problems are usually characterized by congestion, bandwidth limits, bottlenecks, latency, packet loss, or jitter. A useful troubleshooting approach measures each part of the path rather than assuming that the link speed alone explains user experience.

## Core concepts
- Congestion occurs when offered traffic exceeds available capacity, causing queues, buffering, and potentially drops.
- Bandwidth is the capacity for data transfer; actual application performance also depends on latency, loss, protocol overhead, and workload.
- Latency is delay between transmission and response; some propagation and processing delay is unavoidable.
- Packet loss forces retransmission for many reliable protocols and can severely impact interactive applications.
- Jitter is variation in packet delay and is especially important for real-time voice/video.
- A bottleneck is the slowest or most constrained segment that limits end-to-end performance.

## Practical examples
- SNMP, NetFlow/IPFIX, sFlow, packet capture, interface counters, and synthetic tests can help isolate where performance changes.
- Testing the same destination at different times can reveal congestion patterns.

## Security / mitigation
- Baseline normal performance.
- Measure hop-by-hop where practical.
- Check interface errors, duplex/speed negotiation, CPU and storage pressure, queue drops, and WAN utilization.
- For real-time traffic, consider QoS and jitter-sensitive design.

## Detection / troubleshooting
- Useful indicators include utilization spikes, queue drops, interface errors, retransmissions, increased RTT, packet-loss percentage, and jitter variation.

## Detailed notes captured from the notebook
# Performance Issues

## 1. Congestion
- More traffic than what can be managed.
- Buffering / queuing.
  - Buffers fill.
  - Data might be dropped.
- Increase bandwidth or decrease traffic.

## Bottlenecks
- Slow speed / response.
- Difficult to troubleshoot.
- Many factors:
  - host, devices, CPUs, storage etc.
- Monitor to find slowest.
  - Very difficult.

## Bandwidth
- Amount of data transferred.
- Many different monitoring tools:
  - SNMP, NetFlow, sFlow, IPFIX.
- Slowest link is problem.

## Latency
- Delay between request & response.
  - As some is fundamental.
- Examine using tools at every step.
  - No granularity.

## Packet Loss
- Discarded / packet drops.
  - Corruption.
  - Dropped by validation.
- Cause retransmission.
- Resource intensive.

## Jitter
- Most real-time media is sensitive to delay.
  - Data should arrive regularly.
- Miss → no retransmission.
  - Upward? / move? **[wording unclear]**
  - No rewind. E.g. Vo.
- Jitter → time between frames.
  - Jitter stability / smoothness.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
