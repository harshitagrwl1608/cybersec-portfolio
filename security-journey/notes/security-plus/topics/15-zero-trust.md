# Zero Trust

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 10
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

### Page 11
# ZERO TRUST
- Many networks are relatively open inside
- Zero trust
  - Holistic app to network security
  - Review everything on network
  - Everything must be verified regularly

## Planes of operation
- Split network into four planes using physical, data, control planes for each type of component
1. Data Plane -> process frames, packets, network data
2. Control Plane -> manage actions; define policies & rules

### Page 12
# ZERO TRUST
- Many networks are relatively open inside
- Zero trust
  - Holistic app to network security
  - Review everything on network
  - Everything must be verified regularly

## Planes of operation
- Split network into four planes using physical, data, control planes for each type of component
1. Data Plane -> process frames, packets, network data
2. Control Plane -> manage actions; define policies & rules

### Page 13
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

### Page 14
# Policy Enforcement Point (PEP)
- A type of gatekeeper
- Allows, monitor and terminate connection

## Apply trust in planes
- **Policy Decision Point** -> process for making an auth decision
- **Policy Engine** -> evaluates each access decision -> grant, deny or revoke
- **Policy Administrator**
  - communicate with PEP
  - generate tokens or credentials

### Page 15

## Digital reconstruction of the handwritten architecture diagram

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

The architecture diagram has been reconstructed directly in Mermaid above; no source-page image is included.
