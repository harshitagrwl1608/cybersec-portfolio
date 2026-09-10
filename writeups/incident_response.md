# Incident Response Fundamentals

**Category:** Defensive Security — Incident Response

## Objective
Understand what actually qualifies as an "incident," the common incident
types a SOC deals with, both major lifecycle frameworks (SANS and NIST),
and the difference between a playbook and a runbook.

## Methodology

### What Is an Incident?
Security environments generate many events. Security solutions consume
those events and identify patterns that may indicate harmful activity. An
**incident** is a security event or set of events that meets an
organization's criteria for requiring response. The exact definition and
severity levels vary by organization.

### Common Incident Types

**1. Malware infection** — malicious software executes on a system
(ransomware, trojans, worms, spyware, infostealers). Indicators:
suspicious processes, unexpected persistence, malicious files, unusual
network connections.

**2. Security breach** — an unauthorized party gains access to protected
systems, accounts, or data.

**3. Data leak / data exposure** — confidential/sensitive information
becomes accessible to unauthorized parties. Causes: misconfiguration,
stolen credentials, insider activity, exploitation, accidental disclosure.

**4. Insider threat** — a trusted user misuses legitimate access,
intentionally or accidentally.

**5. Denial-of-Service (DoS)** — an attacker reduces/prevents
availability by exhausting resources or overwhelming a service.

**6. Malicious attachment** — a malicious document/file delivered via
email or another channel (phishing attachments, malicious Office/PDF
files, executables disguised as documents, malware-bearing archives).

### Severity Classification
Organizations classify incidents by: business impact, number of affected
systems/users, data sensitivity, scope, persistence, attacker privilege,
operational disruption, regulatory/legal implications.

| Severity | Example |
|----------|---------|
| Low | Single benign-looking alert requiring investigation |
| Medium | Confirmed malware on one workstation |
| High | Compromised privileged account |
| Critical | Widespread ransomware or major sensitive-data compromise |

(Illustrative only — real organizations define their own criteria.)

### SANS Incident Response Framework (6 phases)
```
Preparation → Identification → Containment → Eradication → Recovery → Lessons Learned
```

**1. Preparation** — build the capability before incidents happen:
IR plan, roles/contacts, SIEM/EDR coverage, backups, logging, playbooks,
training, tooling access.

**2. Identification** — determine whether suspicious activity represents
an incident. Questions: What happened? Which systems/accounts are
affected? When did it start? What evidence supports the finding? Likely
severity?

**3. Containment** — limit the attacker's ability to continue/spread:
isolate an endpoint, disable a compromised account, block malicious
infrastructure, segment affected systems. Can be short-term or long-term.

**4. Eradication** — remove the root cause and attacker foothold: remove
malware, remove persistence, patch exploited vulnerabilities, reset
compromised credentials, remove unauthorized accounts, reimage when
appropriate.

**5. Recovery** — return affected systems to a trusted operational
state: restore from known-good backups, rebuild systems, reconfigure
security controls, monitor for recurrence, validate normal operation.

**6. Lessons Learned** — document what happened, review the timeline,
identify what worked/failed, improve controls, tune detections, update
playbooks, conduct a post-incident review.

### NIST Incident Response Lifecycle
```
Preparation → Detection & Analysis → Containment/Eradication/Recovery → Post-Incident Activity ↺
```
This lifecycle is explicitly **iterative** — lessons from incidents feed
back into improving future preparation and detection.

### SANS vs NIST — Mapping
| SANS | NIST-style |
|------|-----------|
| Preparation | Preparation |
| Identification | Detection & Analysis |
| Containment | Containment |
| Eradication | Eradication |
| Recovery | Recovery |
| Lessons Learned | Post-Incident Activity |

Different grouping/wording, same broad journey.

### Incident Response Techniques by Technology
- **SIEM** — detection, identification, investigation, correlation
- **Antivirus/AV** — malware prevention/detection, protection,
  identification of known/suspicious malware
- **EDR** — endpoint visibility, detection, investigation,
  containment/response, eradication support

### Playbooks vs Runbooks
A **playbook** is a documented set of repeatable steps for handling a
particular *class* of incident (e.g. phishing playbook, ransomware
playbook, account-compromise playbook). Playbooks reduce decision time
and make response consistent.

A **runbook** is a detailed *operational procedure* for a specific task —
more granular than a playbook.

```
Playbook: "Respond to compromised endpoint"

Runbook:  "How to isolate endpoint in EDR"
          "How to collect triage package"
          "How to reset the user's credentials"
```

### Incident Response Plan — What It Should Define
Purpose and scope, roles and responsibilities, severity levels,
escalation contacts, communication channels, evidence handling, incident
lifecycle, decision criteria, legal/compliance considerations, external
communication, recovery expectations, post-incident review.

### Practical Checklist (by phase)

**Preparation:** logging enabled for important systems; SIEM receives
required logs; EDR coverage known; backups exist and are tested; incident
contacts current; playbooks/runbooks exist; analysts know escalation
procedures.

**Identification:** record alert/event ID; record first-seen/last-seen
times; identify affected users/hosts; identify source/destination IPs;
identify relevant URLs/domains/files; determine true vs false positive;
assign preliminary severity.

**Containment:** decide what must be isolated; preserve evidence before
destructive actions when practical; disable/protect compromised
accounts; block confirmed malicious infrastructure; document every
containment action.

**Eradication:** identify root cause; remove malicious artifacts; remove
persistence; patch exploited vulnerabilities; reset/revoke compromised
credentials/tokens; reimage when necessary; validate the threat is no
longer active.

**Recovery:** restore systems from trusted sources; validate system
integrity; reconnect systems carefully; increase monitoring; confirm
business functionality; watch for recurrence.

**Lessons Learned:** build a timeline; document root cause and impact;
record response actions; identify detection gaps; tune detections;
update playbooks; record recommendations.

## Detection Angle
This whole topic *is* response, not detection — but the loop back from
Lessons Learned into tuned detections is exactly how a Detection Engineer
(see SOC Fundamentals writeup) turns a real incident into a permanent
improvement, e.g. writing a new Sigma rule off a technique that wasn't
previously alerting (the same pattern used for the SSH detection rule in
this repo's `sigma-rules/` folder).

## Key Takeaway
SANS and NIST aren't competing frameworks to memorize separately — they
describe the same six-ish-phase journey with different labels. The
practically important distinction to internalize is **playbook vs
runbook**: a playbook tells you *which path to take*, a runbook tells you
*exactly how to execute one step of it* — conflating the two is a common
mistake when building IR documentation from scratch.

