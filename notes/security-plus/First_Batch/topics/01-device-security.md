# Device Security

## Overview
Device security reduces the attack surface of an endpoint or network device by removing unnecessary exposure, restricting access, and verifying that the configuration behaves as intended. The core principle is to make the secure configuration the normal state rather than depending on the absence of an attacker.

## Core concepts
- Disable services, ports, protocols, and management interfaces that are not needed.
- Use host-based or network firewalls to restrict traffic by direction, address, port, protocol, application, or identity.
- Replace default credentials and disable unused administrative paths; default credentials are commonly documented and easily discovered.
- Port security and 802.1X/NAC can restrict which devices are allowed onto a switch or network.
- MAC filtering can add a control layer, but MAC addresses can be spoofed and therefore should not be treated as a strong authentication mechanism by itself.
- Centralized key-management systems can issue, rotate, revoke, and audit cryptographic keys used by multiple services.

## Practical examples
- A home router can have remote administration disabled while allowing local administration.
- A laptop can expose only the services that are actually required and block unsolicited inbound traffic.
- An administrator can verify the intended exposure with an authorized port scan such as Nmap.

## Security / mitigation
- Remove or disable unused services.
- Use strong unique credentials and MFA where supported.
- Apply patches and secure configuration baselines.
- Use network segmentation and NAC/802.1X where appropriate.
- Regularly audit exposed ports and management interfaces.

## Detection / troubleshooting
- Useful evidence includes unexpected listening ports, unknown processes/services, new MAC addresses, authentication failures, configuration changes, and newly enabled management services.

## Detailed notes captured from the notebook
# Device Security

## 1. Disable unnecessary ports & services
- Disable unnecessary ports & services.

## 2. Control access with firewall
- NCHFW

## 3. Unused / unknown running services
- Installed from unknown sources.

## 4. Use nmap / port scanners to verify

## 5. Change default credentials
- They are common.
- Could provide anyone with administrative controls.
- Very easy to find defaults for your AP.
- Source note: `http://www.routerpasswords...` **[URL ending unclear in source]**

## 6. Prevent unauth. users from connecting to a switch interface
- Port security.
- Cannot just plug in a new device.
- Detection of source MAC addr.
- Each port has its unique configuration.
- Configuration which MAC addr are allowed through a port.
- Any change → security alarm.

## 7. Disable unused interfaces
- Takes time but worth it for security.
- Adm. control.
- Network Access Control (NAC).
- `802.1X` controls.
- Can't communicate unless authenticated.

## 8. MAC filtering
- Keep out devices that aren't supposed to be on network.
- However, can be spoofed.

## Security through obscurity
- If you know the method, you can easily defeat it.

## 9. Key management system
- Keys for all services on one console.
- Rotate keys.
- Log key usage.
- Encryptions etc.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
