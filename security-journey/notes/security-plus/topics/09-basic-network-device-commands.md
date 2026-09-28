# Basic Network Device Commands

**Source pages:** added notes PDF, pages 24–26.

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
