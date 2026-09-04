# Windows Fundamentals 3

> Source: TryHackMe --- Windows Fundamentals 3

## Windows Update

Windows Update delivers operating-system updates and security patches.

``` text
Vulnerability → Patch released → Test → Deploy → Verify
```

Patch management reduces exposure to known vulnerabilities while
allowing organisations to manage compatibility and operational risk.

## Windows Security

Windows Security brings together: - Virus & threat protection - Firewall
& network protection - App & browser control - Device security - Device
performance/health

## Defender / Virus & Threat Protection

Important features include: - Current threats - Protection history -
Real-time protection - Cloud-delivered protection - Automatic sample
submission

These layers help detect malware and suspicious activity.

## Controlled Folder Access

Controlled Folder Access can restrict untrusted applications from
modifying protected folders and is particularly useful against
ransomware-style file modification.

``` text
Suspicious process
      ↓
Attempts protected-file modification
      ↓
Controlled Folder Access
      ↓
Access may be blocked
```

## Firewall & Network Protection

Windows Firewall applies rules according to network profiles: -
**Domain** --- domain-connected network. - **Private** --- trusted
network. - **Public** --- less trusted network.

PowerShell:

``` powershell
Get-NetFirewallProfile
Get-NetFirewallRule
```

Do not disable the firewall just to fix connectivity; identify the
relevant rule/profile first.

## App & Browser Control

Microsoft Defender SmartScreen helps protect against phishing sites,
malicious websites, suspicious downloads and untrusted applications.

Exploit Protection adds mitigations that make exploitation of vulnerable
applications more difficult.

## Device Security

Core Isolation and Memory Integrity use virtualisation-based security to
protect sensitive system/kernel operations.

Memory Integrity (HVCI) helps prevent untrusted kernel-mode code from
being executed in protected contexts.

## TPM / Security Processor

A Trusted Platform Module (TPM) is a hardware security component that
can protect cryptographic keys and support secure boot measurements and
BitLocker.

TPM is not itself equivalent to full-disk encryption.

## BitLocker

BitLocker provides full-volume encryption.

``` text
Disk data
   ↓
BitLocker encryption
   ↓
Encrypted volume
   ↓
Unlock / recovery mechanism
   ↓
Accessible data
```

TPM can help protect BitLocker keys and verify aspects of the boot
environment.

A recovery key should be stored securely because losing access to the
normal unlock mechanism can otherwise prevent data recovery.

## Volume Shadow Copy Service (VSS)

VSS creates point-in-time shadow copies used by Windows and backup
software.

``` cmd
vssadmin list shadows
```

VSS can help restore previous versions and may provide useful
investigation evidence. Attackers/ransomware may also try to delete
shadow copies, so VSS is not a replacement for proper backups.

## Defensive Checklist

``` text
✓ Patch Windows
✓ Keep Defender protection enabled
✓ Keep firewall enabled
✓ Enable SmartScreen where appropriate
✓ Use exploit mitigations
✓ Evaluate Core Isolation / Memory Integrity
✓ Protect TPM-backed keys
✓ Enable BitLocker on suitable endpoints
✓ Secure recovery keys
✓ Maintain tested backups
```

## Key Takeaway

Windows security is defence in depth: patching, antivirus, firewall,
application reputation, exploit mitigations, hardware-backed security,
encryption and recovery each address different parts of the attack
surface.
