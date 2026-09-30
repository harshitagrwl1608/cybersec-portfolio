# Segmentation, IoT, SCADA/ICS and Guest Networks

## Detailed concepts, examples, and edge cases

This topic covers **network segmentation**, **honeypots/honeynets**, **IoT/IIoT**, **SCADA/ICS**, **operational technology (OT)**, and **guest networks**. These areas overlap because systems that control physical processes or contain many unmanaged/heterogeneous devices benefit from reducing unnecessary communication paths.

## Honeypot

A **honeypot** is a deliberately deployed decoy system intended to attract, observe, and study attackers.

Typical characteristics:

- It can look like a real server, workstation, application, or other service.
- It is separated from production resources so the organization can observe attacker behavior without exposing the real system.
- It can be implemented in a virtualized environment or with other controlled technologies.
- Many implementation options are available, including open-source software.
- A practical challenge is distinguishing genuine attacker activity from activity that has merely been generated or simulated for testing.

A honeypot is therefore primarily an **observation/deception control**, not a replacement for normal preventive security controls.

## Honeynet

A **honeynet** is a larger deception environment containing multiple honeypots and possibly multiple decoy services or systems.

A honeynet can model a small network containing elements such as:

- servers,
- workstations,
- network services, and
- other networking devices.

Compared with a single honeypot, a honeynet can provide more context about how an attacker moves through a network and interacts with different systems.

### Honeypot vs honeynet

| Feature | Honeypot | Honeynet |
|---|---|---|
| Scope | One decoy system/service | Multiple interconnected decoys |
| Main purpose | Attract and observe activity | Observe broader attacker behavior |
| Environment | Can be virtual or physical | Usually a larger, controlled network |
| Visibility | Focused on one target | Can show attacker movement between targets |

## Network segmentation

**Segmentation** divides a larger network into separate security or operational zones so that communication between those zones can be controlled.

Segmentation can be implemented physically, logically, or virtually.

### Physical segmentation

Separate hardware or physical network paths are used for different groups of systems. This provides strong separation but can require additional infrastructure.

### Logical segmentation

A shared physical network can be divided using technologies such as VLANs, routing, ACLs, firewalls, and security zones.

### Virtual segmentation

Virtual networks and cloud/network-virtualization mechanisms can isolate workloads without requiring a separate physical network for every security boundary.

### Why segment networks?

Segmentation can be used to:

1. **Limit unnecessary communication** between applications or systems.
2. **Reduce the blast radius** of a compromise.
3. **Separate sensitive systems** from ordinary user endpoints.
4. **Meet security or compliance requirements** that require defined communication boundaries.
5. **Control traffic flows** with firewalls, ACLs, routing policy, or other enforcement points.
6. **Reduce exposure of management and industrial systems** that do not need unrestricted access.

A common security objective is to prevent two applications or system groups from communicating directly unless that communication is explicitly required and allowed.

## Segmentation enforcement

Segmentation is effective only when there is an enforcement mechanism. Examples include:

- VLAN and routed subnet boundaries;
- firewall and security-zone policies;
- network ACLs;
- host-based firewalls;
- identity-aware access controls;
- NAC and 802.1X;
- cloud security groups/network security controls.

The exact mechanism depends on the environment and on whether the separation is physical, logical, virtual, cloud-based, or application-based.

## IoT — Internet of Things

**IoT** refers to connected devices such as:

- sensors,
- smart devices,
- cameras,
- appliances,
- wearables, and
- other embedded or purpose-built systems.

IoT devices can be well engineered for their intended function while still having a weak security posture. Common concerns include limited operating systems, infrequent patching, long deployment lifetimes, default credentials, proprietary protocols, and limited endpoint security capabilities.

Because of these characteristics, IoT devices are often good candidates for **network segmentation**. An organization can place them in dedicated VLANs/subnets or security zones and permit only the communication they actually require.

### Example

A smart-building sensor may need to communicate with its management platform but should not normally need unrestricted access to employee laptops, domain controllers, or finance systems. Segmentation can enforce that boundary.

## IIoT — Industrial Internet of Things

**IIoT** is the industrial form of IoT, where connected devices are used in manufacturing, utilities, facilities, transportation, and other operational environments.

Important characteristics include:

- machine-to-machine communication;
- dependence between connected industrial services and processes;
- facility automation such as temperature, air handling, lighting, and environmental monitoring;
- monitoring of industrial equipment and operational conditions.

Because IIoT devices may participate in physical processes, segmentation is particularly important. A compromised or malfunctioning device should have as little unnecessary access as possible to other operational or enterprise systems.

## SCADA and ICS

### SCADA — Supervisory Control and Data Acquisition

**SCADA** systems are used to supervise and control industrial processes. They can collect information from distributed equipment and provide operators with monitoring and control capabilities.

### ICS — Industrial Control System

**ICS** is a broader term covering systems used to monitor and control industrial processes. SCADA is one type of industrial-control architecture; other ICS implementations include distributed control systems and programmable-control environments.

Characteristics highlighted in these notes include:

- large-scale industrial environments;
- management and monitoring through computers and control systems;
- distributed control;
- real-time operational information;
- diagnostic and control functions.

## OT — Operational Technology

**Operational Technology (OT)** includes hardware and software used to monitor or control physical processes.

Examples include:

- electrical grids,
- traffic-control systems,
- industrial machinery,
- environmental systems, and
- other equipment where digital control can affect the physical world.

OT can be more than one isolated system. A failure in one component may affect dependent systems or a larger process. For example, loss of power or a control-system failure can cause significant operational or physical consequences.

Because OT can directly influence physical processes, it is treated as a **high-criticality security area** in many environments.

## Segmentation in OT/ICS environments

OT and ICS environments frequently require strong separation between:

- enterprise IT networks;
- operator workstations;
- control servers;
- industrial controllers;
- field devices;
- safety-related systems; and
- externally reachable services.

However, segmentation must be designed around operational requirements. Excessive isolation can prevent legitimate monitoring or control, while insufficient separation can allow an enterprise compromise to reach industrial systems.

A practical design therefore uses explicit communication paths, narrowly defined access, monitoring, and controlled gateways between zones.

## Guest networks

A **guest network** is a separately controlled network for visitors or other users who should not have normal access to internal organizational resources.

Typical properties:

- separate subnet/VLAN or equivalent network boundary;
- controlled authentication or acceptance of guest terms;
- Internet access or other limited services as required;
- firewall/security policy separating guests from internal networks;
- no unnecessary access to internal servers, management systems, or corporate endpoints.

The goal is to provide useful connectivity while keeping guest devices outside trusted internal network segments.

### Example guest-network policy

```text
Guest device
     |
     v
Guest VLAN / subnet
     |
     v
Firewall / security policy
     |--------------------X--------------------> Internal corporate LAN
     |
     +------------------------------------------> Internet
```

## Practical segmentation example

A medium-sized organization might separate its environment into:

```text
                 Firewall / Policy Enforcement
                           |
          +----------------+----------------+
          |                |                |
      Corporate IT      IoT/Guest        OT/ICS
          |                |                |
      User devices    Sensors/APs      Controllers/SCADA
```

The exact topology is environment-specific. The security objective is to make communication between zones **explicit, controlled, and observable** rather than allowing unrestricted lateral movement.

## Key distinctions

| Concept | Primary purpose |
|---|---|
| Honeypot | Decoy system used to attract/observe attackers |
| Honeynet | Multiple interconnected decoy systems/services |
| Segmentation | Separate systems/networks and control communication between them |
| IoT | Connected general-purpose/embedded devices |
| IIoT | Connected devices used in industrial/operational environments |
| SCADA | Supervisory monitoring/control architecture |
| ICS | Broader category of industrial control systems |
| OT | Technology that monitors or controls physical processes |
| Guest network | Isolated network for visitors or untrusted/limited-access users |

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
