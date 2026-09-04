# Active Directory Basics

> Source: TryHackMe --- Active Directory Basics

## What is Active Directory?

Active Directory (AD) is Microsoft's directory service for Windows
domain environments. **Active Directory Domain Services (AD DS)**
provides centralised identity, device and policy management.

It manages objects such as users, computers, groups, OUs, services and
policies.

## Domains and Domain Controllers

A domain is a logical administrative/security boundary.

``` text
corp.example
```

A **Domain Controller (DC)** hosts AD DS and provides directory
services, authentication, policy and replication.

DCs are high-value assets because compromise can affect the wider
domain.

## AD Objects

-   **Users** --- identities used to authenticate and access resources.
-   **Computers** --- domain-joined machines represented as computer
    objects.
-   **Security Groups** --- assign permissions efficiently.
-   **OUs** --- organise objects and support policy/delegation.

## Security Principals

Users, computers and groups can act as security principals. Windows
identifies principals with SIDs (Security Identifiers).

## Groups

Instead of assigning permissions individually:

``` text
Alice ─┐
Bob   ─┼→ Finance-Users → File Share
Carol ─┘
```

Important privileged groups include Domain Admins, Server Operators,
Backup Operators and Account Operators. Privileged membership should be
minimised and monitored.

## Computers and OUs

A useful AD layout is:

``` text
corp.example
├── Users
├── Workstations
├── Servers
└── Domain Controllers
```

Separating workstations, servers and DCs makes policy management easier.
DCs require especially restrictive controls.

## Group Policy

Group Policy provides centralised configuration for users and computers.

Examples: - password/security policy - firewall settings - audit
settings - software configuration - user restrictions

Useful commands:

``` cmd
gpupdate /force
gpresult /r
gpresult /h report.html
```

A malicious or overly permissive GPO can affect many machines, so
permissions to modify GPOs are sensitive.

# Kerberos in Active Directory

Kerberos is the primary modern authentication protocol used by AD.

Main components:

``` text
Client
  |
  v
KDC (Domain Controller)
  ├── Authentication Service (AS)
  └── Ticket Granting Service (TGS)
```

### Simplified authentication flow

``` text
1. User logs in
       ↓
2. Client requests a TGT
       ↓
3. KDC authenticates the user and issues TGT
       ↓
4. Client requests a service ticket
       ↓
5. TGS issues ticket for target service
       ↓
6. Client presents ticket to service
       ↓
7. Service validates ticket
       ↓
8. Authorisation determines access
```

### TGT

A **Ticket Granting Ticket** is used to request additional service
tickets after initial authentication. This avoids repeatedly sending the
user's password to every service.

### Service Ticket

If a user wants a file share, the client requests a ticket for the
relevant service.

A service may be represented by an **SPN (Service Principal Name)**, for
example:

``` text
cifs/fileserver.corp.example
```

### Security relevance

Important Kerberos concepts include TGTs, service tickets, SPNs, service
accounts, delegation and time synchronisation. Unusual authentication or
ticket activity can be useful during investigations.

## NTLM

NTLM is an older Windows authentication protocol that remains available
for compatibility.

Simplified challenge-response:

``` text
Server → challenge
Client → response based on password-derived secret
Server → validates response
```

Modern domain environments generally prefer Kerberos where supported.

## DNS and AD

AD depends heavily on DNS. Clients use DNS to locate domain services and
Domain Controllers.

``` cmd
ipconfig /all
nslookup dc01.corp.example
nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.example
```

Broken DNS can cause domain-join and authentication problems even when
basic IP connectivity works.

## LDAP

LDAP is used to query and interact with directory information.

Remember:

``` text
Kerberos → authentication / tickets
LDAP     → directory access / queries
DNS      → service discovery
```

These protocols commonly work together.

## AD Database

A Domain Controller stores directory data in:

``` text
C:\Windows\NTDS\ntds.dit
```

This is highly sensitive and must be protected.

## Trusts

A trust establishes an authentication relationship between domains.

``` text
Domain A ←── trust ──→ Domain B
```

A trust does not automatically grant access to every resource.
Authentication and resource authorisation are separate concepts.

## Trees and Forests

A **tree** contains related domains sharing a contiguous DNS namespace.

``` text
corp.example
├── eu.corp.example
└── us.corp.example
```

A **forest** is a collection of one or more domain trees sharing the AD
schema/configuration and trust framework.

``` text
Forest
 ├── Tree
 │    ├── Domain
 │    └── Child Domain
 └── Tree
      └── Domain
```

The forest is a major security boundary in traditional AD architecture.

## Delegation

Delegation allows specific administrative tasks without granting full
Domain Admin privileges.

Example:

``` text
Helpdesk → reset passwords in a specific OU
```

This supports least privilege.

## Practical Enumeration

For an authorised lab/domain:

``` cmd
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

``` powershell
Get-ADUser -Filter *
Get-ADComputer -Filter *
Get-ADGroup -Filter *
Get-ADDomain
Get-ADForest
```

## AD Security Checklist

### Domain Controllers

-   Restrict administrative access.
-   Patch regularly.
-   Monitor privileged logons.
-   Protect `ntds.dit`.
-   Minimise unnecessary software/services.

### Accounts

-   Minimise Domain Admin membership.
-   Use separate normal and privileged accounts.
-   Disable stale accounts.
-   Monitor service accounts.

### OUs / GPOs

-   Separate workstations, servers and DCs.
-   Apply security policies deliberately.
-   Audit GPO modification rights.

### Authentication

-   Prefer Kerberos where supported.
-   Understand remaining NTLM dependencies.
-   Monitor unusual authentication.
-   Maintain time synchronisation.

## Mental Model

``` text
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

## Key Takeaway

AD centralises identity and policy for Windows domains. Domain
Controllers, privileged groups, GPOs, authentication systems and the AD
database are especially important from a security perspective.
