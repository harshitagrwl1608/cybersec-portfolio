# SOC & Detection

## Core flow
**Telemetry → Detection → Alert → Triage → Investigation → Response → Lessons Learned**

## SIEM
Collect → normalize → correlate → alert/search → investigate.
Missing or badly parsed logs = visibility gap.

## IDS / IPS
IDS = detect/alert.  
IPS = detect + block inline.
NIDS = network.  
HIDS = host.

## EDR / XDR
EDR = endpoint telemetry + detection + response.  
XDR = correlate signals across multiple security layers.

## Useful Windows events
4624 = successful logon  
4625 = failed logon  
4688 = new process created  
4720 = user account created  
4768 = Kerberos TGT request  
4769 = Kerberos service-ticket request

## Detection logic
**Signal + context + baseline + correlation → confidence**

Enrich with account, host, process tree, source/destination, time, asset owner, hash/domain reputation.

## IoCs
Hash · IP · domain · URL · filename · process · registry artifact · email artifact.

## Sigma / Snort
Sigma = portable log/SIEM detection logic.
Snort = network rule-based detection; rule fields include action, protocol, source/destination and metadata such as SID/revision.

## Alert rule
**Alert ≠ incident.** Validate, correlate, scope, then respond according to procedure.