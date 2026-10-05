# Indicators of Compromise (IoCs)
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 2.4 – Indicators of Malicious Activity → Indicators of Compromise
**Coverage:** source pages 5–8

## Definition
An **indicator of compromise (IoC)** is an observable event or artifact that increases confidence that an attack or compromise may be occurring. The notes describe IoCs as events that indicate an intrusion with high confidence and as clues that something is happening inside the environment.

## Indicators listed in the notes
- Large volumes of data transfer.
- Changes in file-hash values.
- Irregular/international or otherwise unusual traffic.
- Changes in DNS data.
- Uncommon login patterns.
- Spikes in read requests for particular files.

## Account lockout
Lockouts can indicate:
- Credentials no longer working.
- Excessive login attempts.
- A disabled account.
- A user unable to access a large account pool.
- A possible larger attack plan, such as a password-reset or social-engineering campaign.

## Concurrent session usage
The same account appearing at different places simultaneously can be suspicious. Multiple legitimate devices can complicate the picture, so analysts must distinguish normal multi-device behavior from impossible or highly unusual concurrent use.

## Blocked content
An attacker may attempt to persist for as long as possible by blocking or interfering with:
- Updates.
- Security patches.
- Third-party anti-malware/security sites.
- Removal tools.

## Impossible travel
Authentication from geographically incompatible locations in an implausibly short time is an IoC. The notes use the example of a user logging in from India and only minutes later appearing to log in from Europe.

## Resource consumption
Unusual CPU, bandwidth, storage, or other resource usage can indicate malicious activity, cryptomining, exfiltration, or disruption. Odd hours and unusual usage patterns are especially useful when they deviate from the baseline.

## Resource inaccessibility
Examples include:
- Server/network/service outages.
- Encrypted data or ransomware-related access loss.
- Brute-force attempts causing lockouts.
- Disruption or denial of service.

## Out-of-cycle logins
A login at an unusual time can be an indicator when it does not match normal user behavior, shift patterns, or scheduled activity.

## Missing logs
Logs are evidence. Attackers may try to remove or alter them. Log deletion, gaps, unexpected rotation, or evidence that logs were edited should therefore be investigated.

## Published/documented compromise
The notes also recognize a post-breach indicator: sometimes the entire attack becomes known because data is exfiltrated, breached, or published online, potentially accompanied by ransomware/payment demands.
