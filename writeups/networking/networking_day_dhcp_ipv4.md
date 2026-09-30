# DHCP + IPv4 / DORA — Hands-on Lab

**Date:** 2026-08-17  
**Category:** Networking Fundamentals — Addressing

## Objective

Observe DHCPv4 address assignment on my own machine and identify the DORA exchange.

## Tools used

- `ip`
- `dhclient`

## Methodology

First inspect the interfaces:

```bash
ip addr
```

For a DHCPv4 interface, an authorized lab/host test can request verbose DHCP activity with:

```bash
sudo dhclient -v wlan0
```

The verbose output shows the DHCP client exchanging **Discover → Offer → Request → Acknowledge (DORA)** messages with the DHCP server.

> Interface names vary. Confirm the correct interface with `ip addr` before running DHCP commands.

## Detection angle

Unexpected DHCP servers can provide incorrect network configuration, including a malicious gateway or DNS server. Monitoring DHCP activity and comparing responding servers against the expected infrastructure can help identify rogue DHCP behavior.

## Key takeaway

DHCPv4 dynamically provides clients with IPv4 configuration such as an address, subnet mask, gateway and DNS information.
