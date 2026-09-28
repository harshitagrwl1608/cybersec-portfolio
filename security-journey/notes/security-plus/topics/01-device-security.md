# Device Security

**Source pages:** added notes PDF, pages 1–3.

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
