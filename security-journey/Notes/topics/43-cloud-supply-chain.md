# Cloud-Specific & Supply-Chain Vulnerabilities

## Overview
Cloud-specific vulnerabilities often come from exposed services, identity mistakes, insecure configuration, or shared-responsibility gaps. Supply-chain vulnerabilities extend that risk to service providers, software vendors, hardware suppliers, and update mechanisms.

## Core concepts
- Cloud risks include overly permissive access, public storage, weak identity controls, insecure APIs, exposed metadata, and missing logging.
- Supply-chain risks exist because a trusted provider or component can become the path into many downstream systems.
- The customer remains responsible for configuring many cloud controls even when the provider operates the underlying infrastructure.

## Practical examples
- An overly broad AWS Security Group can expose a service even though the underlying AWS platform is functioning correctly.
- A compromised third-party update mechanism can distribute malicious code to otherwise secure clients.

## Security / mitigation
- Use least privilege, configuration baselines, continuous posture monitoring, vendor assessment, signed artifacts, and contract/security requirements for suppliers.

## Detection / troubleshooting
- Cloud audit logs, configuration-drift alerts, unusual API activity, provider-originated security advisories, and unexpected update signatures are valuable evidence.

## Detailed notes captured from the notebook
# Cloud-Specific & Supply-Chain Vulnerabilities

# Cloud-Specific Vulnerabilities
## Security in Cloud
- Cloud adoption has been universal
  - we put sensitive data on cloud
  - RISK
- Right protections are not put in
  - 67% of code in production -> unpatched
  - with rated high / critical

# Attack the service
- Denial of Service (DoS)
- Auth bypass
  - insecure / faulty config
- Directory traversal
  - accessing cloud system
- Remote code execution

# Attack the application
- Web App. attacks have increased
  - Log4j & spring cloud?
  - easy to exploit, vendors extensive
- Cross Site Scripting (XSS)
  - poor input validation
- Out of bounds write
  - write to unwanted areas
  - corruption, crash etc.
- Code injection
  - E.g. SQL injection

# Supply Chain Vulnerability
## Supply chain risk
- Chain contains many parts
  - raw material, manufacturer, transporter etc.
- Every step is risk
  - usually chains are trusted
- One exploit can infect entire system

## Service providers
- You can control your security posture
  - not always for a service provider
- Service providers have internal access
  - opportunity
  - may diff service
- Consider ongoing security audit of all contracts

# Target Service Provider Attack
- Target Corp. breach - Nov. 2013
  - 40 million cards stolen
- Through a AC firm in Pennsylvania
  - Malware delivered through mail [channel]
- Target Corp. was a client and malware spread

## Hardware providers
- Can you trust your new devices??
- Use smaller trusted supplier base
  - strict policy control
  - ensure proper security
- There should be a limit to trust

# Software Providers
- Verify digital signature
- How secure are the updates?
  - open source is not immune
- E.g. SolarWinds Orion

## Further reading (optional)
[AWS — Security Groups](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html)
