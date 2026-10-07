# Network Appliances
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.2 – Applying Security Principles → Network Appliances
**Coverage:** source pages 37–40

## Jump server
A jump server is a hardened intermediary inside a secure network that can be reached from outside for authorized administrative access. The notes emphasize:
- Internet-facing entry point.
- Hardened system.
- Used for authentication/administration.
- Commonly reached using SSH/VPN tunnels.

```mermaid
flowchart LR
    E[External / Public] --> T[SSH / VPN tunnel]
    T --> J[Hardened Jump Server]
    J --> I[Internal resources]
```

## Proxy
A proxy sits in the middle of a network communication and makes requests on behalf of users. It can:
- Hide direct connections.
- Make access-control decisions.
- Detect malicious traffic.
- Cache content.
- Perform URL filtering.

### Forward proxy
A forward proxy protects/controls internal users reaching the Internet.

```mermaid
flowchart LR
    U[Internal users] --> P[Forward proxy]
    P --> I[Internet]
```

### Reverse proxy
A reverse proxy sits in front of internal services and receives Internet-originating traffic on their behalf.

```mermaid
flowchart LR
    I[Internet] --> P[Reverse proxy]
    P --> S[Internal service]
    P --> C[Cache / security controls]
```

## Open proxy
The notes warn that an uncontrolled third-party proxy may become a security concern and can undermine existing controls. It may provide visibility into requests, enable modification, or act as an interception point.

## Open proxy architecture
An open proxy is an uncontrolled third-party intermediary. It may receive the user request and forward it to the Internet while creating a visibility, modification, or policy-bypass risk.

```mermaid
flowchart LR
    U[User] --> P[Open proxy]
    P --> I[Internet / destination]
    P -. may observe or modify .-> R[Security / privacy risk]
```

## Load balancer
A load balancer distributes traffic across servers and supports scalable implementations. The notes connect load balancing with fault tolerance and rapid handling when a server fails.

### Active/active and active/passive
- **Active/active:** all servers are active and share traffic.
- **Active/passive:** some servers serve while one or more remain ready to take over.

The notes list configuration load, TCP offload, SSL offload, encryption/decryption, caching, prioritization, and application switching as possible load-balancer functions.

```mermaid
flowchart TD
    A[Clients] --> L[Load balancer]
    L --> AA[Active / Active<br/>Multiple servers handle traffic]
    L --> AP[Active / Passive<br/>Active server + standby]
```

```mermaid
flowchart TD
    C[Clients] --> LB[Load balancer]
    LB --> S1[Server 1]
    LB --> S2[Server 2]
    LB --> S3[Server 3]
    LB --> S4[Server 4]
```

## Sensors and collectors
Sensors aggregate information from network devices, IDS/IPS, logs, IoT/security-specialized devices, etc. Collectors feed SIEM consoles and other central analysis systems.
