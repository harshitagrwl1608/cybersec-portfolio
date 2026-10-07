# Firewall Types
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.2 – Applying Security Principles → Firewall Types
**Coverage:** source pages 43–45

## Firewall as a universal control
The notes describe firewalls as a standard control for regulating traffic, application content, and connections.

## Network-based firewall
A network firewall can filter based on ports, applications, and traffic characteristics. The notes contrast older/traditional layer-focused filtering with NGFW capabilities and mention encrypted-traffic handling such as VPN support.

## UTM / all-in-one security appliance
Unified Threat Management (UTM) combines multiple functions, including:
- URL filtering/content inspection.
- Spam filtering.
- Malware inspection.
- Firewalling.

## NGFW
A next-generation firewall can perform deeper packet inspection, application identification, and more granular policy decisions. The notes mention OSI-layer awareness, deep packet inspection, stateful/intelligent inspection, application-layer visibility, and additional/advanced decoding.

## Network-based vs. application-aware filtering
Modern firewall stacks may recognize cloud services/sites and apply policies based on applications or content rather than only IP/port pairs.

## Web Application Firewall (WAF)
A WAF is not a generic network firewall. It applies rules to HTTP/HTTPS traffic and helps prevent application attacks such as SQL injection and XSS. The notes use payment-card industry concerns (PCI-DSS) as an example context in which application-layer protections matter.
