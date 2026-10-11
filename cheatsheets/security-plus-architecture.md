# Security+ Architecture & Infrastructure

## Cloud models
IaaS = infrastructure resources.  
PaaS = managed application platform/runtime.  
SaaS = provider-managed application.

**Shared responsibility:** provider secures the underlying service; customer still owns many identity, data, configuration, and application controls depending on the service.

## Deployment
Public = shared provider environment.  
Private = dedicated organizational environment.  
Hybrid = connected mix.  
Community = shared by organizations with common requirements.

## Virtualization / containers
VM = guest OS isolated by hypervisor.  
Container = application/process isolation sharing host kernel.

Virtualization risks: hypervisor compromise, weak isolation, exposed management plane.

## Microservices / APIs
Microservices = application split into services; improves independent scaling/resilience but increases components and trust boundaries.

API risks: weak auth, excessive permissions, input validation failures, exposed secrets, poor rate limiting.

## IoT / OT / ICS
IoT = connected devices.  
IIoT = industrial IoT.  
OT = systems controlling physical processes.  
ICS/SCADA = industrial control/monitoring.

Security priority: **availability + safety + segmentation + carefully controlled change**.  
RTOS = real-time OS used when timing is critical.

## Network appliances
Router = routes between networks.  
L2 switch = forwards by MAC.  
L3 switch = switching + routing.  
Proxy = intermediary.  
Reverse proxy = represents servers to clients.  
Jump server/bastion = hardened admin gateway.  
Load balancer = distributes traffic.

## Secure infrastructure
DMZ/screened subnet = buffer for public-facing services.  
Fail-open = traffic continues on failure.  
Fail-closed = traffic stops on failure.

Attack-surface minimization = remove unnecessary services, interfaces, permissions, and exposure.

## Port security / 802.1X
Port security = restrict allowed MAC addresses.  
802.1X = port-based access control.  
EAP = authentication framework carried through an authenticator.  
RADIUS commonly handles backend authentication.

## Secure communication
VPN = protected tunnel over untrusted network.  
IPsec = network-layer security.  
TLS-based remote access commonly uses HTTPS/TCP 443.  
SD-WAN = software-defined WAN policy/connectivity.  
SASE = cloud-delivered networking + security.

## Wireless & mobile
- **Site survey:** map coverage, AP/channel use, interference, weak spots and rogue APs; spectrum analyzer helps identify RF interference.
- **WPA2-Personal:** shared PSK; weak passwords permit offline guessing when the necessary handshake is captured.
- **WPA3-Personal:** SAE/Dragonfly improves resistance to passive offline password guessing; keep passphrases strong.
- **Enterprise Wi-Fi:** 802.1X/EAP with an authenticator and commonly a RADIUS server; authenticate users/devices individually.
- **MDM:** enforces device configuration, encryption, screen lock, app controls, compliance checks and supported remote lock/wipe.
- **BYOD:** employee-owned device; privacy and work/personal data separation matter. **COPE:** corporate-owned, personally enabled. **CYOD:** choose from an approved device set.
- Bluetooth: remove old pairings, avoid unknown requests, disable unnecessary discoverability and patch devices.

## Data states
At rest = stored.  
In transit = moving.  
In use = actively processed.

Sovereignty = data subject to laws/regulations based on jurisdiction.  
Geolocation = location-derived policy signal.

## Power resilience
UPS protects against interruptions, surges and brownouts.  
Standby/office UPS = basic backup.  
Line-interactive = voltage regulation.  
Online/double-conversion = continuous power conditioning/isolation.  
Generator = longer-duration backup power.

## Security zones
External/Internet → DMZ → Internal → Management/Restricted.

Use segmentation to control trust boundaries and blast radius.