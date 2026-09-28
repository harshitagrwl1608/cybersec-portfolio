# Cloud-Specific & Supply-Chain Vulnerabilities

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 80
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

### Page 81
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

### Page 82
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

### Page 83
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

### Page 84
# Software Providers
- Verify digital signature
- How secure are the updates?
  - open source is not immune
- E.g. SolarWinds Orion
