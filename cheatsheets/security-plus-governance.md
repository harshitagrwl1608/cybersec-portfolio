# Security+ Governance, Change & Baselines

## Security rules
Policy = management direction.  
Standard = mandatory specific requirement.  
Procedure = step-by-step implementation.  
Guideline = recommended practice.  
Baseline = minimum approved secure configuration.

## Asset and data lifecycle
Inventory assets with **owner, location, purpose, version, data sensitivity, dependencies, and support status**. Track procurement, assignment, changes, monitoring, end-of-life, and secure disposal. Sanitize storage media before reuse or disposal.

Data roles:
- **Owner:** business accountability for a dataset and its access/use decisions.
- **Controller:** decides why/how personal data is processed (jurisdiction-specific).
- **Processor:** processes data on a controller's behalf.
- **Custodian/steward:** handles day-to-day protection, quality, or administration under assigned responsibilities.

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
Asset = valuable resource. Threat = potential cause. Vulnerability = weakness. Exploit = method using weakness. Risk = likelihood × impact.

Responses: **Avoid · Mitigate · Transfer · Accept**.

## Third parties and agreements
Assess vendors before engagement, set security/data-handling obligations in contracts, monitor changes, reassess, and plan safe exit/data return or deletion.

| Agreement | Main purpose |
|---|---|
| SLA | Measurable service/support targets |
| MOU | Broad intent or shared understanding |
| MOA | Agreed objectives/responsibilities |
| MSA | General terms for an ongoing relationship |
| SOW | Scope, deliverables, milestones, acceptance |
| NDA | Protect confidential information |
| BPA | Responsibilities and terms of a business partnership |

Labels alone do not determine legal enforceability; wording and applicable law matter.

## Compliance and audits
Compliance includes applicable laws, regulations, contracts, industry requirements, and internal policy—but **compliance alone does not guarantee security**. Audits/assessments use defined criteria, scope, evidence, and sampling; findings need owners, corrective action, due dates, and follow-up verification. Understand the scope and exceptions in any attestation.

## Privacy
**Collect minimally → use for stated purpose → restrict access → retain only as needed → dispose securely.**

Maintain data inventory, ownership, retention rules, approved sharing, and secure disposal. Requirements vary by data type, sector, and jurisdiction.

## Resilience objectives
**RTO = how quickly to restore. RPO = how much data loss in time is acceptable.**

HA = keep service running. DR = restore after disruption. BC = continue essential business operations.