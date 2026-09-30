# Basic Network Device Commands

## Overview
Network-device show commands expose operational state without requiring full packet-level capture. They are particularly useful on switches and routers when checking MAC tables, routes, interfaces, ARP, VLANs, configuration, and PoE.

## Core concepts
- MAC-address tables show which MAC addresses were learned on switch ports.
- Routing tables show current routes and next-hop decisions.
- Interface details expose status, speed/duplex, counters, errors, and encapsulation.
- ARP tables associate IPv4 addresses with link-layer addresses on the local segment.
- VLAN commands reveal VLAN membership and configuration; PoE commands expose power usage on supported switches.

## Practical examples
- Typical Cisco-style commands include `show mac address-table`, `show ip route`, `show interfaces`, `show running-config`, `show arp`, `show vlan`, and `show power` where supported.

## Security / mitigation
- Restrict device management access, use authenticated administration, and record configuration changes.
- Use read-only roles when full administrative access is not required.

## Detection / troubleshooting
- Unexpected MAC addresses, route changes, interface flaps, error counters, new VLAN assignments, or unusual PoE consumption can warrant investigation.

## Detailed notes captured from the notebook
# Basic Network Device Commands

## Basic Network Device Commands
- Managing networking devices using command line.
- Syntax and output is very similar for different manufacturers.
- Learn the root working.

## 1. Show MAC-address-table — `{switch}`
- Usually for switches.
- Where traffic goes.

```text
show mac-address-table
```

## 2. show route — `{router}`
- To be able to see current route.
- Route data would take → find route you're looking for.

```text
show route
```

## 3. show interface <interface-name>
- Status of an interface.
  - Config.
  - Speed, MTU, encapsulation.
- Identify errors.
  - CRC errors, drops etc.
- Performance.
  - Queue capacity.
  - Total traffic.

```text
show interface <interface-name>
```

## 4. show config
- Check device config.
- Display currently running config.
- A little different syntax.

```text
show config
```

## 5. show arp
- Check ARP cache inside a device.
  - Similar to OS.

```text
show arp
```

## 6. show vlan
- View VLANs associated.
  - VLAN IDs.
  - Default VLANs.
- Confirm assignment of each device.

```text
show vlan
```

## 7. show power
- Power device on other side of eth. cable using switch port.
- Display power-related info.
- Monitor power usage.
- Manage PoE devices.

```text
show power
```

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
