# Risk, GRC & Resilience

## Risk
**Risk = likelihood × impact** (a useful simple model, not a universal complete formula).

- **Inherent risk:** before controls.
- **Residual risk:** after controls.
- **Risk appetite:** amount/type of risk the organization is willing to pursue or retain.
- **Risk tolerance:** acceptable variation around objectives.
- **Risk threshold:** point that triggers escalation/action.

Treatment: **Avoid · Mitigate · Transfer · Accept**. Insurance may transfer some financial impact; it does not remove the vulnerability or all liability.

## Risk analysis
- **Qualitative:** labels/scales such as low/medium/high.
- **Quantitative:** numerical estimates such as financial impact or annualized loss.
- **Risk register:** records asset/scenario, likelihood, impact, existing controls, owner, treatment, due date and residual risk.

Prioritize using threat activity, exposure, exploitability, business impact, asset criticality, and control effectiveness—not a single score alone.

## Governance
Policy = management direction.  
Standard = mandatory requirement.  
Procedure = step-by-step method.  
Guideline = recommended practice.  
Baseline = minimum secure configuration.

## BIA / continuity
**BIA** identifies critical business processes, dependencies, and consequences of disruption.

- **RTO:** target time to restore.
- **RPO:** acceptable data loss measured in time.
- **MTTR:** mean time to repair/restore.
- **MTBF:** mean time between failures.
- **HA:** keep service available.
- **DR:** recover after disruption.
- **BC:** continue essential business functions.

## Backups
Full = all selected data.  
Incremental = changes since previous backup.  
Differential = changes since last full backup.

**3-2-1:** 3 copies, 2 media types, 1 offsite. Test restores.

## Recovery sites
Hot = near-ready.  
Warm = partly ready.  
Cold = basic facility/resources.

## Third-party risk
**Due diligence → security requirements/contract → onboarding/access limits → monitoring → reassessment → exit plan.**

Consider vendor access to sensitive data, subcontractors, availability dependencies, security assessments, right-to-audit terms, incident notification, and data return/deletion.