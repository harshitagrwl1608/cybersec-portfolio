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

## Triage
**Account → process → network → persistence → logs → hash → scope**

PowerShell is object-oriented; full cmdlet names are preferable in scripts even when aliases exist.