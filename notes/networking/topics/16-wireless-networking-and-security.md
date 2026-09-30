# Wireless Technologies, WLAN Types and Wireless Security

## Detailed concepts, examples, and edge cases

RSTP is rapid STP, a newer/faster standard family than classic STP. Wireless technologies: 802.11 family, 2.4/5/6 GHz, channels, bandwidth/channel widths (20/40/80/160 MHz in common 5 GHz contexts), band steering.

Wireless networking types: IBSS/ad hoc without AP; temporary or longer-term connections. SSID is the network name; BSSID identifies the AP/BSS by MAC. ESS extends service across multiple APs.

Extending WLAN: multiple APs can share the same network name/SSID; clients roam between APs. Captive portal: web page shown for authentication/acceptance; access control detects unauthenticated users and redirects to login.

Wireless security modes: open/no authentication; WPA/WPA2 personal with pre-shared key; enterprise WPA2/WPA3 with 802.1X/EAP/RADIUS. Wireless network types diagram includes mesh/ad hoc concepts.

Ad hoc mode: two devices connect directly without AP. Point-to-point: two APs bridge distant sites, potentially requiring specialized antennas/power. Infrastructure mode: centralized AP handles traffic and can bridge/route/segregate networks.

Securing wireless: assume confidential data can be intercepted; authenticate users before access; encrypt wireless traffic; verify integrity with message integrity checks/MIC. Diagram shows AP and clients.

Encryption types: WEP obsolete; WPA2 commonly CCMP/AES; WPA3 uses newer security mechanisms such as SAE and stronger cipher suites/profiles. Notes compare confidentiality and integrity protection.

## Wireless LAN architecture
Wi-Fi networks can be deployed in several modes.

### IBSS / ad hoc
An Independent Basic Service Set allows wireless stations to communicate directly without an access point. It is useful mainly for limited temporary scenarios.

### Infrastructure mode
Clients associate with an access point. The AP bridges wireless traffic into the wired network and provides access to a service set identified by SSID/BSSID information.

### Point-to-point wireless
Two directional wireless devices can form a bridge between sites. High-gain/directional antennas can improve link quality over a line-of-sight path.

## SSID and BSSID
- **SSID:** human-readable network/service-set name presented to users.
- **BSSID:** the MAC address of the AP radio/interface identifying a particular basic service set.

Multiple APs can advertise the same SSID while using different BSSIDs to provide coverage across a larger area.

## Captive portals
A captive portal intercepts clients before normal Internet/service access is granted and presents an authentication, acceptance or payment page. Common environments include hotels, campuses and guest networks. The portal is an access-control mechanism, not equivalent to strong network encryption or 802.1X.

## Wireless security modes

- **Open:** no wireless authentication/encryption at the Wi-Fi layer.
- **WPA2-Personal:** pre-shared key (PSK) / passphrase-based authentication, commonly using AES-CCMP.
- **WPA3-Personal:** uses SAE rather than the WPA2 PSK handshake model.
- **WPA2/WPA3-Enterprise:** uses 802.1X/EAP with a backend authentication system such as RADIUS.

WEP is obsolete and should not be used.

## Authentication vs encryption
Authentication answers **who is allowed to join?** Encryption protects wireless frames **after security association**. A secure WLAN should also protect management/administrative access, the wired distribution network and client endpoints.

## Wireless encryption goals
A secure WLAN aims to provide:

1. authentication of the client/network relationship;
2. confidentiality of wireless traffic;
3. integrity/authentication of exchanged frames where supported by the security protocol.

## Client roaming
In a multi-AP WLAN, clients may move between BSSIDs advertising the same SSID. Controllers/APs can use RF data and standards-based roaming assistance to help clients select suitable APs, but the client often retains significant control over roaming.

## Troubleshooting wireless
A practical checklist:

```text
Power / AP status
      ↓
SSID visibility
      ↓
Association / authentication
      ↓
DHCP / IP configuration
      ↓
Default gateway / routing
      ↓
DNS
      ↓
Application access
```

For RF issues, also check channel utilization, interference, signal-to-noise ratio, channel width, AP placement and client capabilities.

## Enterprise Wi-Fi authentication
```mermaid
flowchart LR
A[Client] --> B[AP / Authenticator]
B --> C[RADIUS / Authentication Server]
C --> D[Accept or Reject]
D --> E[Network access]
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Professor Messer — CompTIA N10-009 Network+ course](https://www.professormesser.com/network-plus/n10-009/n10-009-video/n10-009-training-course/)
