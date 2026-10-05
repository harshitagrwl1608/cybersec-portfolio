# Security+ Governance, Change & Baselines

## Security rules
Policy = management direction.  
Standard = mandatory specific requirement.  
Procedure = step-by-step implementation.  
Guideline = recommended practice.  
Baseline = minimum approved secure configuration.

## Gap analysis
**Current state → desired state → gaps → remediation priorities → verify**

Identify control deficiencies, business/security impact, owner, priority, and target state.

## Change management
**Request → assess → approve → schedule → test → implement → verify → document**

Standard = routine/pre-approved.  
Normal = reviewed/approved.  
Emergency = accelerated but documented.

Always have **rollback** and ownership. Separate approval from implementation for sensitive changes.

## Secure baseline
Document known-good configuration → deploy → monitor drift → update baseline when requirements change.

Examples: OS policy, firewall settings, endpoint controls, mobile/AD policy.

## Risk / governance
Asset = valuable resource.  
Threat = potential cause.  
Vulnerability = weakness.  
Exploit = method using weakness.  
Risk = likelihood × impact.

Responses: **Avoid · Mitigate · Transfer · Accept**

## Data classification
Public/unclassified = minimal restriction.  
Internal/private = controlled organizational use.  
Confidential/restricted = stronger access controls.  
PII = identifies a person.  
PHI = protected health information.  
Proprietary/trade secret = organization-controlled valuable information.

## Privacy
**Collect minimally → use for stated purpose → restrict access → retain only as needed → dispose securely.**

Encryption protects confidentiality; masking/tokenization reduce unnecessary exposure.

## Third-party / supply chain
Assess vendor → contract security requirements → monitor → reassess → exit safely.

Watch software provenance, signing keys, build systems, update sources, and dependency risk.

## Resilience objectives
**RTO = how quickly to restore.  RPO = how much data loss in time is acceptable.**

HA = keep service running.  DR = restore after disruption.  BC = continue essential business operations.