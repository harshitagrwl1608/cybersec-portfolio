# NAT/PAT, VLANs and Trunking

## Detailed concepts, examples, and edge cases

NAT diagram: internal host -> switch -> router -> Internet -> server; router translates internal IP to public IPv4 and maps replies back. PAT/NAT overload allows many internal clients to share one public address using different ports.

LAN: devices in the same broadcast domain. VLAN: Virtual LAN, logically separates devices even when they share switches/physical infrastructure. Diagram shows two logical networks across switching hardware.

Configure VLANs: assign VLAN numbers to switch ports. Multiple switches require trunking to carry several VLANs. 802.1Q adds VLAN tags; VLAN ID field is 12 bits; normal range 1-1005, extended 1006-4094, with some IDs reserved.

VLAN tagging path: application data -> trunk adds VLAN tag -> destination trunk removes tag. Native VLAN carries untagged frames by default. Native VLAN mismatch can cause tagging/traffic problems. Some switch management/control frames may not use ordinary user-data tagging.

Layer-3 switch: combines switch/routing functions; can route between VLANs. It cannot always replace a general-purpose router because feature sets differ. Voice VLAN/VoIP lets data and voice share physical cabling while being separated logically.

Voice/data problem: data can congest the link while voice is latency/jitter sensitive. Use separate VLANs and switch behavior that recognizes voice devices/traffic. Diagram shows a phone and computer on one switch with separate VLANs.

## NAT and PAT
NAT translates IP addresses as packets cross network boundaries. PAT extends this by translating transport-layer ports so many inside clients can share one public IPv4 address.

A NAT device maintains translation/state entries so replies can be returned to the correct internal connection.

## VLANs
A VLAN creates a logical Layer-2 broadcast domain. Devices can remain connected to the same physical switch infrastructure while being separated into different logical networks.

Example:

```text
             Switch
        ┌──────┴──────┐
      VLAN 10        VLAN 20
       Users          Guest
        | |            | |
      Devices        Devices
```

Devices in different VLANs cannot communicate at Layer 2 directly. Communication between VLANs requires a Layer-3 function such as a router or Layer-3 switch.

## Access port
An access port normally belongs to one VLAN and carries traffic for end hosts. Frames sent from the host are generally untagged on the access link.

## Trunk port
A trunk carries multiple VLANs between switches, routers or other infrastructure devices. IEEE 802.1Q inserts a VLAN tag into Ethernet frames so the receiving device can identify the VLAN.

```text
Switch A ====== 802.1Q trunk ====== Switch B
             VLAN 10,20,30...
```

## VLAN tag structure
802.1Q adds a 4-byte tag containing VLAN identification and priority-related fields. The VLAN ID field is 12 bits. VLAN IDs 0 and 4095 have special meaning/reservation in 802.1Q, leaving 1–4094 as the commonly usable VLAN ID range in ordinary VLAN configurations.

## Native VLAN
On an 802.1Q trunk, the native VLAN is the VLAN whose traffic may be sent untagged by the trunk configuration. Native-VLAN behavior must match at both ends of a trunk. A native-VLAN mismatch can create connectivity or security problems.

Best practice is to explicitly configure trunk mode and avoid leaving trunk negotiation enabled on host-facing interfaces.

## Inter-VLAN routing

```text
VLAN 10 → L3 switch/router → VLAN 20
```

A Layer-3 switch can create an SVI for each VLAN and route between them according to ACL/firewall policy.

## Voice VLAN
A switch can assign an IP phone to a voice VLAN while the attached workstation uses a separate data VLAN. This allows one physical switchport to support both traffic types while preserving logical separation.

## Private VLAN / port isolation concept
Some switch platforms can provide additional Layer-2 isolation inside a VLAN, allowing hosts to reach only selected ports or a default gateway while limiting host-to-host communication. Exact terminology and behavior vary by vendor.

## VLAN trunking model
```text
Host A -- access VLAN 10 -- Switch A
                           || 802.1Q trunk (10,20,30)
Host B -- access VLAN 20 -- Switch B
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
- [Cisco — Layer-2 security features (port security, DHCP snooping, DAI, IP Source Guard)](https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-series-switches/72846-layer2-secftrs-catl3fixed.html)
