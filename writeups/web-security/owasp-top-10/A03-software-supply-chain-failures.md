# A03 — Software Supply Chain Failures
 
## Definition
Occurs when critical applications rely on components, libraries, or
services that are outdated — and an attacker exploits those specifically.
 
Modern systems depend on many third-party APIs/dependencies. If even one
of those is compromised, it can cascade into a full system exploit.
 
Supply chain attacks are often automated at scale.
**Example:** the SolarWinds Orion compromise (2021).
 
## Common Patterns
- Using unverified or unmaintained libraries/dependencies
- Automatic updates applied without verification
- Over-reliance on third-party pipelines
- Poor license/provenance tracking of dependencies
- Lack of vulnerability monitoring across the dependency tree
