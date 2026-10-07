# Security Rules

## Overview
Security rules translate a security policy into concrete allow, deny, inspection, filtering, or segmentation decisions. Rules are evaluated according to the control's logic and ordering, so both the rule content and the order of evaluation matter.

## Core concepts
- ACLs restrict traffic or access according to criteria such as source/destination address, protocol, port, identity, or interface.
- Firewall rules define what traffic is permitted or blocked; many systems also use an implicit deny when no explicit rule matches.
- URL filtering controls access based on URLs, domains, or categories such as malware, gambling, or inappropriate content.
- Content filtering examines the content or characteristics of traffic rather than only the destination address.
- A screened subnet/DMZ separates public-facing systems from internal systems.
- Security zones group interfaces or resources into trust domains such as internal, external, trusted, and untrusted.

## Practical examples
- A web server might allow TCP/22 only from administrators, TCP/80 and TCP/443 for public service, and deny unwanted traffic.
- A URL filter can block known malicious categories while allowing ordinary business sites.

## Security / mitigation
- Use least-privilege rules.
- Place specific high-risk exceptions deliberately and document rule order.
- Review firewall/ACL changes through change management.
- Remove obsolete rules instead of accumulating contradictory exceptions.
- Log important allow/deny decisions where operationally useful.

## Detection / troubleshooting
- Monitor denied traffic, unexpected allowed traffic, rule changes, URL-category hits, and connections to unusual destinations.

## Detailed notes captured from the notebook
# Security Rules

## 1. Access Control Lists (ACL)
- Allow / disallow traffic based on condition / groups.
- Restrict access to network devices.
  - Limit by IP.
  - Prevent non-admin access.
- Implementation:
  - Router, firewall, OS policy etc.
  - Anything that needs to take a decision about access.

## ii) Firewall Rules
- A logical path of rules.
- Rules can be specific and general.
- **Implicit deny:** If a packet matches no rule → deny.

### Example: a web server firewall ruleset

| Rule number | Remote IP | Remote Port | Local P | Protocol | Action |
|---:|---|---|---:|---|---|
| 1 | All | Any | 22 | TCP | Allow |
| 2 | All | Any | 80 | TCP | Allow |
| 3 | All | 53 | Any | UDP | Allow |
| … | All | … | … | ICMP | Deny |

## ii) URL filtering
- Allow / Block based on Uniform Resource Locator.
  - URL = Uniform Resource locator (URI).
  - Allow / Block list.
- Managed by category.
  - Auction, Travel, Malware etc.
- Can have limited control.
  - Integrate URL inside firewall so there is no workaround.

## Content Filtering
- Control traffic based on data within content.
  - Corporate control of inbound / outbound data.
  - Control of inappropriate content.
  - Protection against malware.

## Screened Subnet
- Internal / public server are separated.
- Using redirection within firewall.

## Security Zones
- Zone-based security tech.
- More flexible, secure than IP addr ranges.
- Examples: Trusted, untrusted, Internal, External.
- Simplified security policies.
  - From point of view of zones.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
