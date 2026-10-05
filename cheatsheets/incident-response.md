# Incident Response

## Core flow
**Preparation → Detection/Analysis → Containment → Eradication → Recovery → Lessons Learned**

### Containment
Short-term = stop spread fast.  
Long-term = controlled environment while investigation continues.

### Eradication
Remove root cause, malware, persistence, compromised accounts, vulnerabilities.

### Recovery
Restore normal operations, validate, monitor for recurrence.

## Triage
1. What happened?
2. What systems/users/data are affected?
3. Is it still active?
4. What is the scope?
5. What evidence must be preserved?

## IoCs
IPs · domains · URLs · hashes · filenames · process names · registry changes · unusual logins · DNS anomalies · outbound traffic.

**IoC ≠ proof by itself:** correlate signals and baseline behavior.

## Evidence
Preserve integrity and chain of custody.  
When appropriate, collect volatile data before shutdown because memory/process/network state can disappear.

## Forensics
Timeline = correlate events across hosts/logs.  
Hash evidence = demonstrate integrity.  
Write blocker = helps prevent modification of storage media.  
E-discovery = identify/collect/preserve relevant electronic information.

## Logs
Centralize, synchronize time, restrict access, retain appropriately, and protect against tampering.

**Backups are only useful if restores work.**
