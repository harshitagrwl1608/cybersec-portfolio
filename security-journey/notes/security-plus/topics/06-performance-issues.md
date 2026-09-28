# Performance Issues

**Source pages:** added notes PDF, pages 17–19.

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
