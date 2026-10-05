# Network Infrastructure Concepts
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.1 – Architecture Models → Network Infrastructure Concepts
**Coverage:** source pages 20–21

## Physical isolation
Physically separate devices when a strong isolation boundary is required. The notes give a simple example of web servers on one rack and database servers on another. Physical isolation can reduce movement between zones but does not automatically provide complete security.

## Logical segmentation with VLANs
Logical segmentation creates separated network zones without requiring separate physical networks. The notes describe VLANs as scalable logical isolation that can be implemented with switches/routers and used to separate security zones.

## Software-defined networking (SDN)
The notes divide network operation into planes/layers:
1. **Data/Infrastructure plane:** processes network frames/packets and forwarding decisions.
2. **Control plane:** manages data-plane behavior, routing tables, and routing-protocol updates.
3. **Management plane / application layer:** manages devices through interfaces such as SSH, APIs, and browsers.

The key idea is that separating these functions can simplify management and enable programmable network control.
