# SOC & Detection

## SIEM
**Collect → normalize → correlate → alert → investigate → report**

SIEM = centralized security-event visibility and correlation.

## Log sources
Identity/AD · endpoints · firewall · VPN · DNS · proxy · web server · cloud control plane · applications · EDR.

## IDS / IPS
IDS = detects/alerts.  
IPS = detects + actively blocks inline.

NIDS = network-based.  
HIDS = host-based.

## EDR / XDR
EDR = endpoint-centric telemetry and response.  
XDR = correlates telemetry across multiple security layers.

## Detection logic
**Signal + context + baseline + correlation → higher confidence**

Useful enrichment: asset owner · user identity · destination/domain · process tree · hash reputation · geo/time context · known-good baseline.

## IoC examples
Hash · IP · domain · URL · filename · mutex · registry key · process · email artifact.

## Sigma
Portable detection-rule format for log/SIEM detection logic.

## Alert tuning
Reduce noise by suppressing known-benign patterns, narrowing scope, requiring correlated signals, using thresholds carefully, and documenting exceptions.

## Incident cue
**Detect → validate → scope → contain → eradicate → recover → lessons learned**