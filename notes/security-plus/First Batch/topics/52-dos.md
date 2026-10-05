# Denial of Service

## Overview
Denial-of-Service (DoS) attacks attempt to reduce or eliminate availability. They may exhaust bandwidth, connection state, CPU, memory, application resources, or another limiting resource.

## Core concepts
- A distributed DoS (DDoS) uses many sources, often a botnet.
- Reflection/amplification attacks abuse third-party services so the attacker can generate more traffic than they directly transmit.
- Not every outage is malicious; accidental or friendly DoS can result from legitimate traffic or loops.

## Practical examples
- A service can be overwhelmed by connection attempts, expensive application requests, or volumetric network traffic.

## Security / mitigation
- Use rate limiting, capacity planning, DDoS protection services, traffic filtering, caching, segmentation, and resilient architecture.

## Detection / troubleshooting
- Monitor sudden traffic-volume changes, source diversity, request-rate spikes, resource saturation, and abnormal protocol distributions.

## Detailed notes captured from the notebook
- Force a service to fail
  - take adv. of any vuln etc.

## Reasons
- business aspects
- Revenge
- political
- distractions

### i) Friendly DoS
- unintentional
- E.g. login in loop with website bandwidth DoS

### ii) Distributed DoS
- Botnets

### iii) DoS reflection & amplification
- Smaller -> big attack
- exploit protocols
- DNS ANY <domain>

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
