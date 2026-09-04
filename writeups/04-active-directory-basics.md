# [Active Directory Basics] — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals  
**Date:** 2026-09-04  
**Category:** Active Directory — Identity & Authentication

## Objective

Understand how Active Directory is structured, how users/computers/groups are managed, how Group Policy works, and how authentication works inside a Windows domain.

## Tools used

- Active Directory Users and Computers
- Active Directory PowerShell module
- `cmd`
- `whoami`
- `gpresult`
- `nltest`
- DNS tools such as `nslookup`

## Methodology

- Learnt why organisations use **Active Directory** to centrally manage Windows users, computers and policies.
- Studied the role of a **Domain Controller** and how AD objects are organised.
- Worked through **users, groups and Organizational Units (OUs)**.
- Looked at **Group Policy** and why different OUs can be used for different policies.
- Learnt the difference between **domains, trees and forests**.
- Studied **trust relationships** between domains.
- Compared **Kerberos and NTLM** authentication.
- Filled in the main Kerberos flow: TGT request → service ticket request → ticket presented to the service.
- Connected AD authentication to **DNS and LDAP**.
- Looked at practical enumeration commands useful inside an authorised lab.

## What is Active Directory?

Active Directory is Microsoft's directory service for Windows domain networks.

THM breaks the main AD pieces down into:

```text
Domain Controllers
Forests / Trees / Domains
Users + Groups
Trusts
Policies
Domain Services
```

The reason companies use it is centralised management: users and computers can be managed from the domain instead of configuring every machine independently. citeturn138336search0turn138336search1

## Domain Controller

A **Domain Controller (DC)** is the server providing AD DS services.

It handles important functions such as:

```text
Authentication
Directory lookups
Group / user management
Group Policy
Replication
```

Because a DC is central to the domain, it is a very high-value system from a security point of view.

## Users + Groups

Instead of assigning permissions one user at a time:

```text
Alice
Bob
Carol
   ↓
Finance-Group
   ↓
File-share permission
```

Groups make access management much easier.

Privileged groups are especially important to monitor, particularly groups such as:

```text
Domain Admins
```

## Organizational Units (OUs)

OUs are containers used to organise objects and help apply/delegate administration and Group Policy.

A sensible structure could be:

```text
corp.example
├── Users
├── Workstations
├── Servers
└── Domain Controllers
```

Keeping **Servers and Workstations in separate OUs** is useful because they usually need different policies.

## Group Policy

Group Policy is one of the biggest advantages of AD because administrators can centrally configure many computers/users.

Examples:

```text
Password/security settings
Firewall settings
Audit policy
Software configuration
User restrictions
```

Useful commands:

```cmd
gpupdate /force
gpresult /r
gpresult /h report.html
```

A GPO is therefore not just an administrative convenience — permissions to modify one can have a very large security impact.

## DNS + Active Directory

DNS is extremely important to AD because domain members use it to locate domain services and Domain Controllers.

Useful checks:

```cmd
ipconfig /all
nslookup dc01.corp.example
nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.example
```

So when an AD environment has "authentication problems", DNS should be one of the first things checked.

## LDAP

LDAP is used to query and work with directory information.

I keep the distinction like this:

```text
Kerberos → authentication / tickets
LDAP     → directory queries
DNS      → locating domain services
```

These are different roles but they work together inside the same AD environment.

# Kerberos Authentication

Kerberos is the default authentication service for Microsoft Windows domains. THM describes it as a ticket-based system using a KDC, TGTs and service tickets. citeturn138336search8

The important parts are:

```text
Client
   |
   v
KDC
├── Authentication Service (AS)
└── Ticket Granting Service (TGS)
```

## Kerberos flow

The simplified flow is:

```text
1. User logs in
       ↓
2. Client sends AS-REQ
       ↓
3. KDC returns AS-REP containing a TGT
       ↓
4. Client sends TGS-REQ for a particular service
       ↓
5. KDC returns TGS-REP containing a service ticket
       ↓
6. Client presents the ticket to the target service
       ↓
7. Service validates it
       ↓
8. Access is checked by authorisation
```

### 1. TGT

The **Ticket Granting Ticket (TGT)** is used to request tickets for other services after the initial authentication.

The useful mental model is:

```text
TGT = "I have already authenticated to the domain"
```

It means the client does not need to send the user's password to every service it accesses.

### 2. TGS / Service Ticket

Suppose the user wants to access a file share.

The client asks the TGS for a ticket for that service.

Example SPN:

```text
cifs/fileserver.corp.example
```

The KDC then provides the service ticket that the client presents to the target.

### 3. Service Authentication

The target service validates the ticket and the user's identity. Authentication tells the system **who the user is**; normal Windows authorisation/ACLs still decide **what the user can access**.

## Kerberos + Security Monitoring

The authentication flow also creates useful Windows/AD events.

A current THM AD monitoring example maps:

```text
4768 → TGT request
4769 → TGS request
4624 → successful logon/session on target
```

These are useful because they let a defender follow an authentication chain through the environment. citeturn138336search7

## Time Synchronisation

Kerberos is sensitive to clock differences between systems.

So time sync is not just an NTP/networking topic here — it directly affects domain authentication.

## SPNs

A **Service Principal Name (SPN)** identifies a service instance used by Kerberos.

Example:

```text
MSSQLSvc/sql01.corp.example:1433
```

SPNs become particularly important when investigating service accounts and Kerberos-related authentication activity.

## NTLM

NTLM is an older Windows authentication method that is still present for compatibility.

Simplified idea:

```text
Server → challenge
Client → response based on password-derived secret
Server → validates response
```

For modern AD environments, I should expect Kerberos to be preferred where it is supported, while NTLM can still appear because of legacy/compatibility scenarios. citeturn138336search8

# Domains, Trees and Forests

A **domain** is the main organisational/security boundary containing users, computers and policies.

A **tree** is a collection of related domains sharing a contiguous DNS namespace.

A **forest** can contain multiple domain trees that share the AD schema/configuration and trust framework.

Simplified:

```text
Forest
  ├── Tree
  │    ├── Domain
  │    └── Child Domain
  └── Tree
       └── Domain
```

## Trusts

A trust creates an authentication relationship between domains.

```text
Domain A ←── trust ──→ Domain B
```

Important distinction:

```text
Trust
  ≠
Automatic permission to every resource
```

Authentication across a trust and actual resource authorisation are separate.

## AD Database

A Domain Controller stores the AD database at:

```text
C:\Windows\NTDS\ntds.dit
```

This makes DC security especially important because compromise of directory data can have consequences far beyond one workstation.

## Practical Enumeration

Inside an authorised AD lab, these are useful starting commands:

```cmd
whoami
whoami /groups
whoami /user
hostname
ipconfig /all
net user
net user /domain
net group "Domain Admins" /domain
gpresult /r
nltest /dsgetdc:corp.example
```

With the AD PowerShell module:

```powershell
Get-ADUser -Filter *
Get-ADComputer -Filter *
Get-ADGroup -Filter *
Get-ADDomain
Get-ADForest
```

The point is to answer basic questions quickly:

```text
Who am I?
What machine am I on?
Which domain am I using?
Who are the privileged users/groups?
Which policies apply?
Where is the Domain Controller?
```

## Detection angle (SOC-relevant)

AD creates a large amount of authentication and directory activity.

Important things to monitor include:

```text
Failed logons
Successful privileged logons
TGT/TGS activity
New users
Group membership changes
GPO changes
Unusual service-account behaviour
```

The main security lesson is that **identity is the centre of the Windows enterprise**. If an attacker gains control of a privileged identity, the impact can spread across many machines.

## Key takeaway

AD is much more than "a Windows server with users". It is the identity and policy backbone of a Windows domain.

The most important mental model I took from this room is:

```text
Forest
  ↓
Trees
  ↓
Domains
  ↓
OUs → GPOs
  ↓
Users / Groups / Computers
  ↓
Kerberos / NTLM
  ↓
Network Resources
```

Understanding this structure makes later AD enumeration, authentication attacks and defensive monitoring much easier.
