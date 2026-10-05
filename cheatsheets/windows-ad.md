# Windows & Active Directory

## AD mental model
**Forest → Tree → Domain → OU → Users / Groups / Computers / GPOs**

Domain Controller (DC) provides directory/authentication services and stores the AD database.

Important file: `C:\Windows\NTDS\ntds.dit`

## Core services
- **Kerberos:** ticket-based authentication.
- **LDAP:** directory queries/access.
- **DNS:** locates domain controllers and services.
- **NTP/time sync:** important for Kerberos operation.
- **Group Policy:** centrally applies configuration/security policy.

## Kerberos flow
**AS-REQ → AS-REP/TGT → TGS-REQ → TGS-REP/service ticket → service**

KDC = **Authentication Service (AS) + Ticket Granting Service (TGS)**

SPN = identifies a Kerberos service instance, e.g. `MSSQLSvc/host:1433`.

## Useful triage / enumeration
```cmd
whoami
whoami /groups
whoami /user
hostname
ipconfig /all
net user /domain
net group "Domain Admins" /domain
gpresult /r
nltest /dsgetdc:<domain>
nslookup -type=SRV _ldap._tcp.dc._msdcs.<domain>
```

PowerShell:
```powershell
Get-ADUser -Filter *
Get-ADComputer -Filter *
Get-ADGroup -Filter *
Get-ADDomain
Get-ADForest
```

## Important Windows security events
4624 = successful logon  
4625 = failed logon  
4688 = new process created  
4720 = user account created  
4768 = Kerberos TGT request  
4769 = Kerberos service-ticket request

**Always inspect context:** account, host, source IP, logon type, process, time, related events.

## High-value AD concerns
Privileged groups · unusual GPO changes · new accounts · group-membership changes · abnormal Kerberos activity · suspicious service accounts · legacy NTLM use

## Key distinctions
Authentication = prove identity.  
Authorization = determine permitted action.  
AD/DNS/Kerberos/LDAP solve different parts of the same enterprise identity system.