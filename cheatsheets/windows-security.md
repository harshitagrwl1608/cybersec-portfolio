# Windows Security Commands

## CMD
```cmd
whoami
ipconfig /all
route print
arp -a
netstat -ano
tasklist
tasklist /svc
systeminfo
whoami /all
```

## PowerShell
```powershell
Get-Process
Get-Service
Get-NetTCPConnection
Get-NetIPAddress
Get-WinEvent -LogName Security
Get-LocalUser
Get-LocalGroupMember Administrators
Get-FileHash .\file.exe -Algorithm SHA256
Get-ChildItem -Force
```

## Security locations
- Windows Event Logs
- Security log = authentication/security events
- Sysmon = richer endpoint telemetry when deployed
- Registry = configuration/persistence source; investigate unexpected changes

## Fast triage
**Account → process → network connection → persistence → logs → hash → scope**