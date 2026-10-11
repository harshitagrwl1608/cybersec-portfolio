# Windows Security Commands

## CMD
```cmd
whoami
whoami /all
ipconfig /all
route print
arp -a
netstat -ano
tasklist
tasklist /svc
systeminfo
tasklist /FI "IMAGENAME eq sshd.exe"
```

## Maintenance / integrity
```cmd
sfc /scannow
chkdsk C: /f
driverquery
```

## PowerShell
```powershell
Get-Process
Get-Service
Get-NetTCPConnection
Get-NetIPConfiguration
Get-NetIPAddress
Get-WinEvent -LogName Security -MaxEvents 20
Get-LocalUser
Get-LocalGroupMember Administrators
Get-FileHash .\file.exe -Algorithm SHA256
Get-Item .\file.txt -Stream *
```

## High-value event cues
| Event | Meaning |
|---:|---|
| 4624 | Successful logon |
| 4625 | Failed logon |
| 4688 | Process creation |
| 4720 | User account created |
| 4768 / 4769 | Kerberos TGT / service-ticket request |
| Sysmon 1 | Process creation with richer process telemetry when configured |

**Command-line visibility:** Security Event 4688 does not automatically guarantee the process command line is present; enable the relevant process-creation command-line audit policy. Sysmon Event 1 can also record process command lines when properly configured.

## Encoded PowerShell triage
A process using `-EncodedCommand`, `-enc`, `-ec`, or `-e` merits review when combined with `powershell.exe` or `pwsh.exe`. It can be legitimate automation too.

Check: **user → parent process → full command line → decoded content → child processes → network activity → related logs**. A renamed executable, missing command-line telemetry, Unicode dash variants, and other obfuscation can evade a narrow rule.

## Triage
**Account → process → network → persistence → logs → hash → scope**

PowerShell is object-oriented; full cmdlet names are preferable in scripts even when aliases exist.