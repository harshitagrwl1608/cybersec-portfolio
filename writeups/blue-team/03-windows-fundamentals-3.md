# Windows Fundamentals 3 — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals
**Date:** 2026-09-04
**Category:** Windows Fundamentals / Security Controls

## Objective

Last room in the Windows track, this one's focused on the built-in security features — Defender, firewall, BitLocker, that whole stack — and how they actually fit together instead of feeling like a random list of settings.

## Tools used

- Windows Update
- Windows Security / Microsoft Defender
- Windows Firewall
- SmartScreen
- Exploit Protection
- Core Isolation / Memory Integrity
- TPM
- BitLocker
- Volume Shadow Copy Service
- PowerShell / cmd

## Methodology

Started with **Windows Update**, and honestly the framing here is what mattered more than the tool itself — a fully patched system with everything else configured perfectly is still vulnerable if it's missing the one update that closes the gap. Rough process is vulnerability → patch released → test → deploy → verify. Patching isn't just routine maintenance, it's a security control in its own right.

**Windows Security / Defender** bundles a few things together — virus & threat protection, firewall & network protection, app & browser control, device security — with Defender handling real-time protection underneath it.

**Firewall** runs on profiles — Domain, Private, Public — and I connected this back to firewall stuff I'd already done on Windows and Linux, since the rules deciding what traffic gets through matter differently depending which profile is active. Poked at it with PowerShell too:

```powershell
Get-NetFirewallProfile
Get-NetFirewallRule
```

**SmartScreen vs Exploit Protection** — these get lumped together but do different jobs. SmartScreen is about flagging malicious sites, phishing, sketchy downloads, untrusted apps. Exploit Protection doesn't care if content is "malicious" or not, it just adds mitigations that make actually exploiting something harder in the first place.

**Device Security** — Core Isolation / Memory Integrity (HVCI) uses virtualization-based security to protect kernel-level stuff. Good example of defense in depth — even if one layer gets bypassed, this is still sitting there making things harder.

**TPM** — hardware security component, holds cryptographic material, supports things like BitLocker. Kept the distinction simple for myself: TPM is the hardware-backed component, BitLocker is the actual disk encryption feature — they work together but they're not the same thing, easy to conflate them.

**BitLocker** — full-volume encryption, matters most in the "laptop gets stolen" scenario, since without it someone can just pull the drive and read the files straight off. Recovery keys obviously need to be stored somewhere safe, since losing them is basically losing the data too.

**Volume Shadow Copy Service** — point-in-time copies Windows/backup software can use.

```cmd
vssadmin list shadows
```

Useful for recovery and sometimes for investigation, but worth remembering that destructive malware specifically tries to wipe shadow copies, so it's not something to rely on as your only backup plan.

## Detection angle (SOC-relevant)

These controls generate useful signals on their own — Defender detections, firewall blocks, security events, reputation flags on suspicious apps, changes to security config settings. Main point I took away: a SOC really shouldn't lean on one product alone, combining endpoint + identity + network telemetry is the stronger approach every time.

## Key takeaway

Windows security is genuinely layered, not just one big toggle — patching, Defender, firewall, SmartScreen, exploit mitigations, TPM/BitLocker, VSS, they're all solving different pieces of the same problem, and it took this room to actually see how they line up next to each other instead of as separate settings.
