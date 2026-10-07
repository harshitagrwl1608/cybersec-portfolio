# Secure Baselines
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 4.1 – Security Techniques → Secure Baselines
**Coverage:** source pages 67–68

## Baseline definition
A secure baseline is a documented reference configuration for an application/system/environment. The notes say security should be well defined and maintained as a set baseline with controlled, expected updates.

## Establish a baseline
Create a series of baselines appropriate to the environment. The notes mention that operating systems may have extensive configuration options; the baseline establishes what the organization considers secure and acceptable.

## Deploy baselines
Baselines can be deployed through centralized administration and multiple deployment mechanisms such as:
- Active Directory policy.
- Mobile/endpoint management.
- Centralized administrative consoles.

Automation is highlighted as important for scaling baseline deployment.

## Maintain baselines
Most baseline configurations need to remain aligned with current requirements, but changes such as:
- New updates.
- New rules.
- Operating-system changes.
may require the baseline itself to be revised.

Enterprise environments are complex, and baseline controls can conflict with application or operational requirements, so changes should be evaluated and documented.

## External benchmarks
Current CIS Benchmarks provide consensus-based secure configuration recommendations across cloud providers, operating systems, network devices, containers, databases, and other technologies. NIST's SCAP 1.4 can automate the expression/exchange of configuration and vulnerability information.
