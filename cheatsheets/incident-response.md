# Incident Response

## Core flow
**Preparation → Detection/Analysis → Containment → Eradication → Recovery → Lessons Learned**

Preparation includes authority, contacts, escalation paths, approved playbooks, evidence handling, access to tools, and communication plans.

## Roles
Depending on the incident: SOC/analyst, incident lead, IT/endpoint/network teams, system/data owner, legal/privacy/HR, communications, and external responders. Assign decision authority before an incident and preserve a clear timeline of actions.

## Containment
Short-term = stop spread fast.  
Long-term = controlled environment while investigation continues.

## Eradication
Remove root cause, malware, persistence, compromised accounts, vulnerabilities.

## Recovery
Restore normal operations, validate, monitor for recurrence.

## Triage
1. What happened?
2. What systems/users/data are affected?
3. Is it still active?
4. What is the scope and business impact?
5. What evidence must be preserved?
6. Who must be notified, and who can authorize disruptive action?

## IoCs
IPs · domains · URLs · hashes · filenames · process names · registry changes · unusual logins · DNS anomalies · outbound traffic.

**IoC ≠ proof by itself:** correlate signals and baseline behavior.

## Evidence
Preserve integrity and chain of custody. When appropriate, collect volatile data before shutdown because memory/process/network state can disappear.

## Forensics & logs
Timeline = correlate events across hosts/logs.  
Hash evidence = demonstrate integrity.  
Write blocker = helps prevent modification of storage media.  
E-discovery = identify/collect/preserve relevant electronic information.

Centralize logs, synchronize time, restrict access, retain appropriately, and protect against tampering.

## Playbooks / SOAR
A **playbook** documents repeatable response steps, decision points, approvals, and evidence collection. **SOAR** orchestrates or automates work across security tools; guard disruptive actions with approval, scope limits, logging, and rollback.

**Backups are only useful if restores work.**