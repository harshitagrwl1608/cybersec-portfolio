# Active Directory Basics — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals
**Date:** 2026-09-04
**Category:** Active Directory / Identity & Authentication

## Objective

This room is basically the "why does every company run AD" room. It walks through how Windows domains are structured, how users/computers/groups get managed centrally, and how authentication actually works under the hood (Kerberos + NTLM). Goal for me was to actually understand the auth flow instead of just knowing the buzzwords.

## Tools used

- Active Directory Users and Computers
- AD PowerShell module
- cmd
- whoami, gpresult, nltest
- nslookup

## Methodology

I went in expecting this to be a dry "here's what AD is" room but it ended up being more useful than I thought, mostly because it forced me to actually sit down and understand Kerberos instead of just nodding along to the term.

Started with the basic pitch for AD — why would you centrally manage users/computers instead of configuring every machine by hand. Makes sense once you think about a company with a few hundred employees, you're not touching 300 machines individually every time someone joins or leaves. That's the whole point of a Domain Controller: it's the server holding all this together, handling logins, directory lookups, replication, and Group Policy. Also became pretty obvious why a DC is such a high value target — compromise that and you basically own the identity layer of the whole network.

Users and groups is straightforward on paper (put people in groups, give the group permissions instead of managing per-user) but what stuck with me more was the emphasis on watching privileged groups like Domain Admins specifically. OUs are just the folders you use to organize all this and apply different policies to, e.g. keeping servers and workstations separate because they obviously need different rules.

Group Policy is where I spent a bit more time — it's genuinely one of the bigger reasons AD is powerful, since you can push password policy, firewall rules, audit settings, whatever, to a whole OU at once. Played with `gpupdate /force` and `gpresult /r` to see current applied policy.

DNS was the part I didn't expect to matter this much. Domain members literally use DNS to find the DC and other domain services, so if login/auth breaks in an AD environment, DNS is one of the first things worth checking, not something you check last. Ran a couple of basic checks:

```cmd
ipconfig /all
nslookup dc01.corp.example
nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.example
```

LDAP vs Kerberos vs DNS kept blurring together for me at first, so I ended up just writing down a dumb mental split: Kerberos does the actual authenticating, LDAP is for querying/looking things up in the directory, DNS is how everything finds everything else. Different jobs, same environment.

### Kerberos — the part I actually had to slow down for

Kerberos is the default auth mechanism in a Windows domain, and it's ticket-based rather than "send password every time." The KDC (which lives on the DC) has two jobs — the Authentication Service and the Ticket Granting Service.

Flow, as I understand it now:

1. User logs in
2. Client sends AS-REQ
3. KDC replies with AS-REP containing a TGT
4. Client sends a TGS-REQ when it wants to reach a specific service
5. KDC replies with TGS-REP containing a service ticket
6. Client hands that ticket to the target service
7. Service checks the ticket
8. Whether the user can actually *do* anything is a separate authorization/ACL check

The mental shortcut that finally made this click for me: the TGT basically just means "I already proved who I am to the domain," so the client doesn't need to keep re-sending the password every time it wants to hit a new service. It asks for a ticket for that specific service instead — e.g. `cifs/fileserver.corp.example` for a file share.

One thing I hadn't really connected before: this whole flow throws off specific, useful Windows event IDs — 4768 for a TGT request, 4769 for a TGS request, and 4624 for the actual logon on the target. Being able to trace those together is basically how you'd follow someone's authentication path across a network if you were on the defensive side.

Also — apparently Kerberos really cares about clock sync between systems. Didn't expect a networking/NTP detail to directly affect domain login, but it does.

**NTLM** is the older method still hanging around for compatibility — simplified, it's a challenge/response thing (server sends a challenge, client responds based on a password-derived secret, server validates). Kerberos should be preferred wherever it's supported; NTLM shows up mostly because of legacy stuff.

**SPNs** (Service Principal Names, e.g. `MSSQLSvc/sql01.corp.example:1433`) identify a specific service instance to Kerberos — these matter a lot when you get into service account attacks later, apparently, so worth remembering now.

### Domains, trees, forests, trusts

Domain = the actual security boundary (users, computers, policy). A tree is a group of domains sharing a DNS namespace. A forest can hold multiple trees sharing schema/config and a trust framework. Trusts connect domains for authentication — but a trust does **not** automatically mean full access to everything in the other domain. Auth and authorization are still separate conversations.

Also noted where the actual AD database lives on a DC:

```text
C:\Windows\NTDS\ntds.dit
```

which is basically why DC security matters so much — that one file is the whole directory.

### Enumeration commands from the room (lab-only obviously)

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

```powershell
Get-ADUser -Filter *
Get-ADComputer -Filter *
Get-ADGroup -Filter *
Get-ADDomain
Get-ADForest
```

Point of all these is just answering the basic "where am I, who am I, what's around me" questions fast — who am I, what box am I on, what domain, who's privileged, what policies apply, where's the DC.

## Detection angle (SOC-relevant)

AD throws off a ton of auth/directory noise all day, every day, so the useful stuff to actually watch for is failed logons, privileged account logons succeeding, TGT/TGS activity, new user creation, group membership changes (especially into anything privileged), GPO changes, and weird service account behavior.

Biggest takeaway from this section honestly wasn't a command, it was the reminder that identity is the center of the whole Windows enterprise — if someone gets a privileged account, that's not a "one machine" problem anymore, it spreads.

## Key takeaway

Went in thinking of AD as "the thing that holds the user list." Came out thinking of it more as: Forest → Trees → Domains → OUs/GPOs → Users/Groups/Computers → Kerberos/NTLM → actual resources. Once that chain is in your head, enumeration and later attacks make a lot more sense because you know what layer you're actually poking at.
