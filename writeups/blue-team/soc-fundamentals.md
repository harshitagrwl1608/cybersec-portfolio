# SOC Fundamentals

**Category:** Defensive Security — SOC Operations

## Objective
Understand what a SOC actually is, the three pillars it depends on
(people/process/technology), the analyst tiers and their responsibilities,
and the core vocabulary (event vs alert vs incident) that everything else
in defensive security builds on.

## Methodology

### What Is a SOC?
A **Security Operations Center (SOC)** is a team/function responsible for
continuously monitoring an organization's environment, detecting
suspicious activity, investigating alerts, and coordinating responses.

**Main purposes:**
- **Detection** — identify potentially malicious or abnormal activity
- **Response** — investigate, contain, and help remediate confirmed threats
- **Monitoring** — maintain visibility across endpoints, networks,
  identities, cloud, and applications
- **Reporting** — document findings, incidents, actions, and recommendations

Mental model: **Events → Detection → Alert → Triage → Investigation →
Response → Lessons learned**

### The Three Pillars
1. **People**
2. **Process**
3. **Technology**

Technology without skilled analysts creates noise. Analysts without
repeatable processes work inconsistently. Processes without telemetry
can't see enough of the environment. All three have to function together.

### People — Roles

**L1 — First responder / alert triage**
- Monitor incoming alerts
- Validate whether an alert is meaningful
- Gather basic context
- Determine apparent nature and severity
- Close obvious false positives per procedure
- Escalate suspicious/confirmed incidents to L2

**L2 — Deeper investigation**
- Perform deeper investigation of escalated detections
- Correlate multiple events and evidence sources
- Investigate user, endpoint, network, and authentication activity
- Determine scope and likely attack path
- Produce investigation notes and reports
- Recommend or coordinate containment

**L3 — Expert / threat-focused analysis**
- Investigate complex/advanced threats
- Perform malware/threat analysis
- Hunt for attacker activity
- Develop or improve detections
- Provide expert support during serious incidents

**Security Engineer** — focuses on the security controls/infrastructure
supporting the SOC: SIEM architecture and integrations, endpoint security
deployment, network security controls, identity/security tooling,
hardening.

**Detection Engineer** — focuses on the logic behind detections:
detection rules, correlation logic, Sigma-style detections, alert tuning,
detection testing, reducing false positives while preserving coverage.

**SOC Manager** — responsible for the SOC as an operational function:
team management, escalation processes, metrics/reporting, incident
coordination, staffing/training, continuous improvement.

### Process
A SOC needs repeatable processes for: alert triage, incident
classification, escalation, investigation, containment, evidence
preservation, documentation, reporting, and post-incident improvement.

**During an investigation, ask:**
| Question | Meaning |
|---|---|
| Who? | Which user, account, host, or actor is involved? |
| What? | What action or event occurred? |
| Where? | Which endpoint, server, IP, application, or resource? |
| When? | What is the timeline? |
| Why? | What is the likely purpose/context? |

Then document the evidence and report the conclusion.

### Technology

**SIEM (Security Information and Event Management)** — collects,
normalizes, correlates, and analyzes logs/events from multiple sources.
Used for centralized log collection, detection/correlation, search and
investigation, dashboards/reporting, alert generation, and retention for
investigations/compliance.

**EDR (Endpoint Detection and Response)** — provides endpoint telemetry
and detection/response capability: process activity, command execution,
file activity, network connections, persistence indicators, real-time
and historical endpoint visibility, and response actions like isolation
(depending on the product).

**Firewall** — controls network traffic per configured rules/policies.
Analysts use firewall logs to investigate allowed/blocked connections,
suspicious source/destination IPs, unusual ports, repeated connection
attempts, and network scanning indicators.

### Alert Triage
When a security solution finds events associated with potentially
harmful activity, it creates an **alert**. Two key outcomes:
- **True positive** — the detection corresponds to real suspicious/malicious activity
- **False positive** — the detection fired, but the activity is benign

A true positive may be promoted to an **incident** when it meets the
organization's incident criteria.

### Event vs Alert vs Incident
- **Event** — something happened and was logged
- **Alert** — a security control identified an event (or combination of
  events) as potentially suspicious
- **Incident** — a confirmed or sufficiently credible security event
  requiring response per the organization's criteria

Not every event is an alert, and not every alert is an incident.

### Baseline
A SOC needs a baseline of normal behavior so analysts can identify
meaningful deviations: normal login locations/times, typical
administrative activity, normal network destinations, expected service
behavior, normal endpoint processes, typical application traffic.
Baselines are **context, not proof of maliciousness** — a deviation from
baseline is a reason to look closer, not a verdict.

### Typical Escalation Path
```
Telemetry
   ↓
Detection
   ↓
L1 triage
   ↓
False positive ──→ Document / close
   ↓
Suspicious / true positive
   ↓
L2 investigation
   ↓
Complex / high risk
   ↓
L3 / Incident Response / Engineering
   ↓
Contain → Eradicate → Recover → Lessons Learned
```

### Worked Example — Escalation in Practice
A SIEM detects many failed logins followed by a successful login.

**L1 asks:**
1. Which account?
2. Which source IP?
3. Which target system?
4. When did the attempts occur?
5. Was the successful login expected?
6. Was MFA used?
7. Was the source location normal?
8. What happened immediately after login?

If suspicious, escalate to L2.

**L2 correlates:** authentication logs, EDR telemetry, VPN logs, firewall
logs, cloud identity logs, application logs — with the goal of
determining **scope, impact, timeline, and response actions**.

## Detection Angle
This entire topic *is* the detection angle for everything else in this
repo — the L1→L2→L3 escalation model and the WHO/WHAT/WHERE/WHEN/WHY
framework are the lens every other writeup here (firewall lab, ARP
spoofing, home network scan) should be viewed through when thinking about
"how would a real SOC actually catch this."

## Key Takeaway
A brute-force login attempt (many 4625s followed by a 4624, in Windows
Event Log terms — see the Logs Fundamentals writeup) isn't automatically
a confirmed incident just because it looks suspicious in isolation — the
whole point of L1→L2 escalation is to correlate enough context (MFA used?
normal geography? what happened after login?) before treating it as one.
