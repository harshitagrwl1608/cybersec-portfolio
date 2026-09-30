# Misconfiguration Vulnerabilities

## Overview
Misconfiguration vulnerabilities occur when a system's security settings are missing, overly permissive, inconsistent, or left at insecure defaults. They are often preventable through secure baselines, change control, and continuous configuration monitoring.

## Core concepts
- Open permissions and public exposure can turn otherwise protected resources into internet-accessible targets.
- Unsecured administrative accounts and default credentials create easy entry points.
- Insecure protocols can expose data or credentials when encrypted alternatives are available.
- Default settings and unnecessary services often increase exposure, especially on IoT and cloud systems.
- Complex firewall rules can become risky when they are poorly ordered or insufficiently reviewed.

## Practical examples
- An AWS Security Group that permits unnecessary inbound access is a configuration error that creates a security exposure.
- Leaving a default device password unchanged is a common example of insecure configuration.

## Security / mitigation
- Use hardened baselines, least privilege, configuration review, automated drift detection, and regular audits.
- Remove unused services and public access where it is not required.

## Detection / troubleshooting
- Watch for unauthorized configuration changes, public-resource exposures, default-account use, and policy deviations.

## Detailed notes captured from the notebook
# Misconfiguration Vulnerabilities

# Misconfiguration Vulnerabilities
## Open permissions
- Very easy to leave a door open
  - hacker will find it
- Usually happen in cloud
  - E.g. June 2017 - 100m Verizon records exposed

## Unsecured admin accounts
- Linux / Windows root access
- Can be a misconfig
  - easy to guess password
- Disable direct login to root account
- PROTECT THEM

## Insecure protocols
- Created protocols
  - E.g. HTTP, SMTP, FTP etc.
- Verify with a packet capture
- USE ENCRYPTED VERSIONS

## Default settings
- Every app and IoT network device has a default login
- Mirai Botnet
  - Take advantage of default config
  - IoT devices
  - Don't default config
- Open source software

## Open ports & services
- Limit to only necessary
- Use firewalls
  - manage traffic plans
  - however gets complex
  - easy to make mistakes
- Always test & audit

## Further reading (optional)
[AWS — Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html)
