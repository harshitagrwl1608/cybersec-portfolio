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
SSL/TLS VPN = application/transport-based remote access commonly over 443.  
SD-WAN = software-defined WAN policy/connectivity.  
SASE = cloud-delivered networking + security.

## Data states
At rest = stored.  
In transit = moving.  
In use = actively processed.

Sovereignty = data subject to laws/regulations based on jurisdiction.  
Geolocation = location-derived policy signal.

## Security zones
External/Internet → DMZ → Internal → Management/Restricted.

Use segmentation to control trust boundaries and blast radius.