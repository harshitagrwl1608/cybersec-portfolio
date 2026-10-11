# Penetration Tests and Reconnaissance

**CompTIA Security+ SY0-701 | Domain 5: Assessment techniques**

A penetration test evaluates security by simulating authorized adversary techniques. The organization defines the scope and desired assurance, and the tester uses an agreed perspective to determine what can be discovered or exploited.

## 1. Physical penetration testing

A physical penetration test assesses whether physical controls prevent unauthorized access to facilities, equipment, and restricted areas. It may evaluate badge controls, visitor processes, doors, barriers, alarms, security staff procedures, and tailgating defenses.

Physical assessments must be explicitly authorized and must define boundaries, safety constraints, emergency contacts, and activities that are prohibited. Testers should not create unsafe conditions or access areas outside the agreed scope.

## 2. Red, blue, and integrated teams

- **Red team:** simulates an adversary and tests whether defined objectives can be achieved.
- **Blue team:** operates defensive monitoring, investigation, and response.
- **Purple team / integrated approach:** encourages collaboration, where red-team findings are used to improve blue-team detections and response. The red and blue functions may repeat testing and refinement.

The engagement model affects what the organization learns. A blind test may conceal details from defenders; a collaborative exercise may prioritize improvement and sharing of findings.

## 3. Tester knowledge

- **Known environment / white-box:** testers receive substantial information such as architecture, configuration, or source code.
- **Partially known / gray-box:** testers receive limited information or ordinary user access.
- **Unknown / black-box:** testers begin with little internal information, approximating an external perspective.

The names and exact boundaries can vary by organization; the important point is how much information the tester receives.

## 4. Reconnaissance

Reconnaissance gathers information about the authorized target before attempting an attack. It helps create a network map, identify exposed services and technology, understand the security posture, and choose relevant test paths.

- **Passive reconnaissance:** uses information gathered without directly probing the target systems, such as public records and published information.
- **Active reconnaissance:** directly interacts with the target, such as approved host discovery, port scanning, or service enumeration. It can be more detectable and may affect systems.

All reconnaissance must stay inside the authorized scope. Collect only what is needed and handle sensitive information according to the engagement rules.

```mermaid
flowchart LR
    A[Agree objectives, scope, and rules] --> B[Choose tester perspective]
    B --> C[Passive reconnaissance]
    C --> D[Authorized active reconnaissance]
    D --> E[Map assets and likely attack paths]
    E --> F[Controlled tests]
    F --> G[Report evidence and improvements]
```

## 5. What a good report includes

- Executive summary and test objectives.
- Scope, approach, dates, and limitations.
- Findings with evidence, severity, and business impact.
- Clear reproduction details where appropriate.
- Recommended remediation and priority.
- Controls that worked and gaps that were observed.
- Retest status and any residual risk.

A successful test is not measured by damage caused. It is measured by whether it answers the agreed security questions and helps the organization improve.

## Further reading
- [NIST SP 800-115 — Technical Guide to Information Security Testing and Assessment](https://csrc.nist.gov/pubs/sp/800/115/final)
- [Professor Messer — Penetration Tests](https://www.professormesser.com/security-plus/sy0-701/sy0-701-video/penetration-tests-sy0-701/)
