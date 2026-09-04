# [Windows Fundamentals 3] — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals  
**Date:** 2026-09-04  
**Category:** Windows Fundamentals — Security Controls

## Objective

Understand the security features built into Windows and how they contribute to endpoint protection.

## Tools used

- Windows Update
- Windows Security
- Microsoft Defender
- Windows Firewall
- SmartScreen
- Exploit Protection
- Core Isolation / Memory Integrity
- TPM
- BitLocker
- Volume Shadow Copy Service
- PowerShell / `cmd`

## Methodology

- Looked at **Windows Update** and why patching is one of the basic security controls.
- Worked through **Windows Security** and the built-in Defender protections.
- Studied the different **firewall/network profiles** and how rules control traffic.
- Looked at **SmartScreen** and **Exploit Protection** under App & browser control.
- Explored **Device Security**, including Core Isolation and Memory Integrity.
- Learnt what a **TPM** does and how it supports security features such as BitLocker.
- Studied **BitLocker** for protection of data at rest.
- Looked at **Volume Shadow Copy Service (VSS)** and why it matters for recovery as well as incident response.

## Windows Updates

A vulnerable system is still vulnerable no matter how good the rest of the security stack is.

The basic process is:

```text
Vulnerability
   ↓
Security update
   ↓
Test
   ↓
Deploy
   ↓
Verify
```

The main lesson here is that patching is part of the security process, not just normal system maintenance.

## Windows Security + Defender

Windows Security brings multiple protections together, including:

```text
Virus & threat protection
Firewall & network protection
App & browser control
Device security
```

Defender provides real-time protection and other detection layers.

## Firewall & Network Protection

Windows Firewall uses profiles:

```text
Domain
Private
Public
```

I also connected this to the firewall work I had already done on Windows/Linux: rules decide what traffic is allowed or blocked, so the profile matters when troubleshooting or reviewing exposure.

Useful PowerShell commands:

```powershell
Get-NetFirewallProfile
Get-NetFirewallRule
```

## SmartScreen + Exploit Protection

**SmartScreen** helps with malicious websites, phishing, suspicious downloads and untrusted applications.

**Exploit Protection** is a different layer: instead of just deciding whether content is malicious, it adds mitigations that can make exploitation harder.

## Device Security

Core Isolation and **Memory Integrity (HVCI)** use virtualisation-based security to help protect sensitive system/kernel operations.

This is an example of defence in depth — even if another protection fails, additional controls can still make exploitation harder.

## TPM

A **Trusted Platform Module (TPM)** is a hardware security component that can protect cryptographic material and support features such as BitLocker.

Important distinction:

```text
TPM = hardware-backed security component
BitLocker = disk encryption feature
```

They work together, but they are not the same thing.

## BitLocker

BitLocker provides full-volume encryption to protect data at rest.

```text
Disk
 ↓
BitLocker encryption
 ↓
Encrypted data
 ↓
Unlock / recovery
```

This matters especially for lost or stolen laptops because an attacker should not be able to simply remove the drive and read the contents as normal plaintext files.

Recovery keys are therefore important and need to be stored securely.

## Volume Shadow Copy Service

VSS provides point-in-time copies that Windows and backup software can use.

```cmd
vssadmin list shadows
```

From a defensive perspective, VSS can help with recovery and can sometimes provide useful investigation data.

At the same time, destructive malware may try to delete shadow copies, which is why VSS should not be treated as the only backup mechanism.

## Detection angle (SOC-relevant)

Windows security controls also create useful signals for defenders:

```text
Defender detections
Firewall blocks
Security events
Suspicious application reputation events
Changes to security configuration
```

A SOC should not rely on one security product alone. The stronger approach is combining endpoint, identity and network telemetry.

## Key takeaway

Windows security is layered. Patching, Defender, firewall controls, SmartScreen, exploit mitigations, hardware-backed protections, encryption and recovery all solve different parts of the problem.
