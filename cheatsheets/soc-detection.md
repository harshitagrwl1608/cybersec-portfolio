# SOC & Detection

## Core flow
**Telemetry → Detection → Alert → Triage → Investigation → Response → Lessons Learned**

## SIEM
Collect → normalize → correlate → search/alert → investigate.  
Missing, delayed, or badly parsed logs = visibility gap. Confirm events arrived before debugging a query.

## IDS / IPS
IDS = detect/alert.  
IPS = detect + block inline.  
NIDS = network. HIDS = host.

## EDR / XDR
EDR = endpoint telemetry + detection + response.  
XDR = correlate signals across multiple security layers.

## Useful Windows events
- `4624` = successful logon.
- `4625` = failed logon.
- `4688` = process created; command-line field needs appropriate audit policy.
- `4720` = user account created.
- `4768` = Kerberos TGT request.
- `4769` = Kerberos service-ticket request.
- Sysmon `Event ID 1` = process creation; check that command-line collection is configured.

## Detection logic
**Signal + context + baseline + correlation → confidence**

Enrich with account, host, process tree, source/destination, time, asset owner, hash/domain reputation, and related events.

## Portfolio examples
- **Windows brute force:** Event `4625`; count by username + source IP; 5+ failures in 2 minutes. False positives include mistyped passwords and stale service credentials. Does not by itself catch password spraying or distributed attempts.
- **Encoded PowerShell:** process creation for `powershell.exe`/`pwsh.exe` plus `-EncodedCommand` or a valid abbreviation. Encoding alone is not proof of maliciousness; inspect parent process, user, decoded content, and surrounding telemetry.

Both rules are **experimental**. The current writeups distinguish Sigma syntax/conversion and synthetic-fixture testing from testing against real Windows telemetry.

## IoCs
Hash · IP · domain · URL · filename · process · registry artifact · email artifact.  
An IoC is a lead—not proof on its own. Correlate with behavior and context.

## Sigma / Snort / Splunk
- **Sigma:** portable, YAML-based log-detection logic.
- **Snort:** network rule-based detection; fields include action, protocol, source/destination and metadata such as SID/revision.
- **Splunk:** SIEM search/analytics; SPL queries depend on the actual event fields, sourcetype and index.
- **Correlation:** combine events by meaningful keys and time range, then tune thresholds against the environment.

See [Splunk & Sigma](splunk-sigma.md) for conversion and testing notes.

## Threat intelligence
**Direction → collect → normalize/enrich → analyze → disseminate → feedback.**  
Use OSINT, internal telemetry, trusted sharing, and vendor feeds as appropriate; assess source reliability, age, confidence, and business relevance.

## Alert rule
**Alert ≠ incident.** Validate, correlate, scope, preserve evidence, then respond under the approved procedure.