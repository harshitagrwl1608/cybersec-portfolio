# Network Documentation, SNMP, Logging, SIEM and API Integration

## Detailed concepts, examples, and edge cases

Network documentation: physical network maps include devices/physical locations; logical diagrams show VLANs/apps and architecture; rack diagrams show equipment, ports and labels for installation/changes.

Cable maps/diagrams record physical cable runs. Asset management tracks devices/tickets. Asset database records users/warranty/licensing. IPAM manages address space, DHCP integration, IP usage reports and reservations for IPv4/IPv6.

SNMP: management protocol; MIB database/object identifiers; managers poll devices over UDP 161. SNMPv1/v2c use community strings; SNMPv3 adds integrity/authentication/privacy. OID example shown.

SNMP traps reduce polling delay by sending notifications when thresholds/events occur; commonly UDP 162. Authentication options include community strings (simple, read-only/read-write) and SNMPv3 username/password/authentication/privacy controls.

Logs/monitoring: network keeps logs, monitors devices and system auth; dashboard shows status. Flow data gathers traffic data from flows. Probe/collector systems gather and aggregate traffic/telemetry for reporting.

Protocol analyzer solves complex issues, captures and displays packet/traffic details and can store captures for later analysis. Network performance baseline compares normal patterns over time and detects unusual changes. Syslog is a common standard for centralized log collection.

SIEM: security information/event management; logs security events; real-time alerts; long-term storage/reporting; data correlation. Queries can filter events for brute force, DoS etc. API integration can automate configuration, batch processing and error handling.

API integration provides a programmatic interface to devices/services. Port mirroring copies traffic to monitoring/IDS/performance-analysis interfaces; can mirror one switch port to another or gather data from remote switches.

## Network management
Network management covers configuration, monitoring, troubleshooting, performance measurement, security visibility and documentation.

## Flow data
Flow technologies such as NetFlow/IPFIX summarize communication conversations rather than capturing every packet. Typical flow records include source/destination IP, source/destination ports, protocol, timestamps, packet/byte counters and interface information.

Flow data is useful for traffic baselining, capacity planning, anomaly detection and incident response.

## Packet capture and protocol analysis
Packet analyzers such as Wireshark/TShark inspect individual frames and packets. Packet capture gives much more detail than flow records but uses more storage and processing.

Typical uses:

- troubleshooting TCP handshakes and retransmissions;
- inspecting DNS/DHCP behavior;
- finding malformed packets or protocol errors;
- validating security controls;
- investigating application/network latency.

## SIEM
A Security Information and Event Management platform aggregates logs/events from many sources, normalizes them, correlates related events, generates alerts and retains data for analysis.

```text
Devices / servers / apps
          |
          v
     Log collection
          |
          v
      Normalization
          |
          v
        SIEM
     /    |      alerts  search  correlation
```

## Syslog
Syslog is a standard family of methods/formats for transmitting and storing system log messages. Centralized syslog collection allows administrators to preserve events from many devices in one location. Transport security depends on the protocol used; plaintext UDP syslog should not be assumed confidential.

## Network performance baselines
A baseline records normal performance so deviations are recognizable. Useful metrics include:

- latency;
- packet loss;
- jitter;
- interface utilization;
- CPU and memory;
- error/discard counters;
- application response time;
- flow volumes.

## API integration
Many modern network platforms expose REST/JSON APIs. Automation can use APIs to collect inventory, apply configuration, query health and integrate network changes with ticketing/CI/CD systems.

## CLI automation
CLI automation can push commands to multiple devices, process outputs and standardize configuration. Automation should include validation, idempotence where possible, error handling and rollback planning.

## Port mirroring
Port mirroring (SPAN on many platforms) copies traffic from selected source ports/VLANs to a monitoring destination port. It is useful for packet capture, IDS/IPS sensors and troubleshooting.

```text
Traffic source(s) ──┐
                    ├──> Switch mirror session ──> Capture/IDS port
Other traffic ──────┘
```

Mirroring can oversubscribe the destination if more traffic is copied than the monitor interface can process.

## Network documentation

### Physical map
Shows physical devices, locations, racks, cable paths and ports.

### Logical map
Shows subnets, VLANs, routing relationships, applications and logical dependencies.

### Rack diagram
Shows device placement and port/cable relationships inside racks.

### Cable map
Tracks cable endpoints and paths through walls, trays, floors and patch panels.

### Asset management / CMDB
Tracks devices, ownership, lifecycle, warranty, licensing and relationships. Accurate inventory supports security and troubleshooting.

### IPAM
IP Address Management tracks IP allocation, subnet information, DHCP/DNS relationships and utilization. Good IPAM reduces conflicts and improves change management.

## Monitoring pipeline
```mermaid
flowchart LR
A[Devices / Apps] --> B[Logs / Flow / Packets]
B --> C[Collectors]
C --> D[Normalization]
D --> E[SIEM / Monitoring]
E --> F[Alert / Trend / Investigation]
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
