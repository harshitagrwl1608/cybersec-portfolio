# Zero Trust

## Overview
Zero Trust is an architectural model that removes implicit trust based on network location or asset ownership. Access is granted to a specific resource based on policy, identity, device context, and other signals, and trust decisions can be re-evaluated over time. NIST describes authentication and authorization of both subject and device before access is established.

## Core concepts
- Protect resources rather than assuming a trusted internal network.
- Evaluate user and device identity, context, risk, and policy.
- The Policy Decision Point determines the decision; the Policy Engine evaluates policy and risk; the Policy Administrator communicates the decision to enforcement components.
- The Policy Enforcement Point (PEP) is the gatekeeper that allows, monitors, or terminates sessions.
- Microsegmentation and least privilege reduce the blast radius if an account or device is compromised.

## Practical examples
- Laptop login flow: identity check -> device posture -> policy decision -> PEP -> requested resource.
- A device can be denied even after a correct password if the device fails posture requirements.

## Security / mitigation
- Use MFA, device health/EDR, segmentation, continuous logging, and least-privilege policies.
- Avoid using 'inside the network' as a substitute for authorization.

## Detection / troubleshooting
- Monitor policy denies, posture failures, repeated access requests, token anomalies, and access to resources outside the user's normal pattern.

## Detailed notes captured from the notebook
# Zero Trust

# Zero Trust
- Many networks are relatively open inside
- Zero trust
  - Holistic app to network security
  - Verify everything on network
  - Everything must be verified regularly

## Planes of operation
- Split network into [four] planes
- Use physical, data, control planes for each type of component [wording as written]
1. **Data plane** -> process frames, packets, network data
2. **Control plane** -> manage actions; define policies & rules

- Many networks are relatively open inside
- Zero trust
  - Holistic app to network security
  - Review everything on network
  - Everything must be verified regularly

## Planes of operation
- Split network into four planes using physical, data, control planes for each type of component
1. Data Plane -> process frames, packets, network data
2. Control Plane -> manage actions; define policies & rules

- Many networks are relatively open inside
- Zero trust
  - Holistic app to network security
  - Review everything on network
  - Everything must be verified regularly

## Planes of operation
- Split network into four planes using physical, data, control planes for each type of component
1. Data Plane -> process frames, packets, network data
2. Control Plane -> manage actions; define policies & rules

# Controlling Trust
1. **Adaptive identity**
   - Consider context of requested resource
   - Examine risk indicators
   - Examine user data
   - Make a decision
2. **Threat scope reduction**
   - Decrease no. of possible entry points
3. **Policy-driven access control**
   - Adaptive identity & predefined rules

## Security zones
- Where we are connecting from and where to
- Trusted / untrusted
- Using the zone may be a mistake to deny access

# Policy Enforcement Point (PEP)
- A type of gatekeeper
- Allows, monitor and terminate connection

## Apply trust in planes
- **Policy Decision Point** -> process for making an auth decision
- **Policy Engine** -> evaluates each access decision -> grant, deny or revoke
- **Policy Administrator**
  - communicate with PEP
  - generate tokens or credentials

```mermaid
flowchart LR
    subgraph CP[Control Plane]
        PE[Policy Engine]
        PA[Policy Administrator]
        PDP[Policy Decision Point]
    end

    S[System] -->|Unauthenticated| PEP[Policy Enforcement Point (PEP)]
    PEP -->|Trusted| ER[Enterprise Resources]
    PEP <--> CP
    PE --> PDP
    PA --> PEP
```

## Flow / diagram
`SYSTEM -> Policy Enforcement Point (PEP) -> Enterprise Resources`

PEP communicates with a policy set containing:
- Policy engine / Policy Decision Point
- Policy Administrator

## Further reading (optional)
[NIST SP 800-207 — Zero Trust Architecture](https://csrc.nist.gov/pubs/sp/800/207/final)
