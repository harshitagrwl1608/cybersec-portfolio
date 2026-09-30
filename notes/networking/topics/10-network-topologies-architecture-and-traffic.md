# Topologies, Architecture and Traffic Flows

## Detailed concepts, examples, and edge cases

Mesh topology diagram with multiple redundant links among network nodes. Benefits: multiple links, redundancy, fault tolerance, load balancing; common in WAN/cloud-style resilient designs.

Hybrid topology combines designs. Spine-leaf architecture: leaf switches connect to spine switches; every leaf reaches each spine. This material emphasizes non-blocking/low-latency paths and that additional spine switches increase cost but also capacity/redundancy.

Spine-leaf continues: top-of-rack/leaf switch to a rack; one leaf maps to one rack in the simple model. Benefits: simple cabling, speed, redundancy; drawback is more switches and cost.

Three-tier architecture: core, distribution, access. Core is backbone; distribution aggregates and controls access policy; access connects end stations and printers. Diagram shows redundant links between layers.

Collapsed core combines core and distribution for simpler/smaller deployments. Lower cost but less redundancy/less separation. Traffic flow concepts introduced.

Traffic flows: east-west within a data center between devices; north-south between internal systems and outside/external devices, including ingress and egress traffic.

## Network topologies

### Mesh
A mesh design provides multiple interconnections between nodes. More links create multiple paths and redundancy, which can improve resilience and enable load sharing. Full mesh can become expensive because the number of links grows rapidly as nodes are added.

### Hybrid
A hybrid topology combines two or more topology types. Enterprises commonly use a mixture of star access networks, redundant core links and other structures.

### Spine-and-leaf
Spine-and-leaf is common in data centers. Every leaf switch generally connects to multiple spine switches, creating predictable low-latency paths between leaves.

```text
 Spine 1 ─────┬───── Leaf 1 ── Servers
              ├───── Leaf 2 ── Servers
 Spine 2 ─────┼───── Leaf 1
              └───── Leaf 2
```

The design provides multiple equal-cost paths and scales by adding spine or leaf capacity, subject to the architecture's limits.

## Three-tier campus architecture

### Core layer
High-speed backbone. Its primary goal is fast, resilient transport between major parts of the network.

### Distribution layer
Aggregates access switches and applies policy. Typical functions include inter-VLAN routing, summarization, ACLs, routing policy and redundancy.

### Access layer
Connects end devices such as PCs, phones, printers and APs. Common functions include VLAN assignment, PoE, port security and endpoint access control.

### Collapsed core
In smaller environments, core and distribution functions may be combined into one layer. This reduces cost and complexity but also concentrates functions and failure domains.

## Traffic flows

### North-south traffic
Traffic entering or leaving a data center, enterprise or security boundary. Examples include users accessing an external service or remote users accessing a hosted application.

### East-west traffic
Traffic between systems inside the same data center or environment, such as application-to-database or server-to-server flows. Modern architectures often see large amounts of east-west traffic.

## Network architecture principle
Design should account for availability, scalability, segmentation, security policy, bandwidth, latency and failure domains—not just connectivity.

## Three-tier campus flow
```text
                 CORE
                /    \
       DISTRIBUTION  DISTRIBUTION
          /  \         /  \
      ACCESS ACCESS   ACCESS ACCESS
        |      |         |      |
      Users   APs      Phones  Printers
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
