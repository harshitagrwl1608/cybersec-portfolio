# Security Rules

**Source pages:** added notes PDF, pages 4–6.

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
