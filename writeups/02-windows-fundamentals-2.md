# [Windows Fundamentals 2] — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals  
**Date:** 2026-09-04  
**Category:** Windows Fundamentals — System Administration & Monitoring

## Objective

Learn more of the built-in Windows administration tools and understand how they can be used for troubleshooting, enumeration and security monitoring.

## Tools used

- MSConfig
- Task Scheduler
- Event Viewer
- Computer Management
- Resource Monitor
- Command Prompt
- Registry Editor
- `gpresult`

## Methodology

- Worked through **System Configuration (`msconfig`)** and how Windows startup/services can be reviewed.
- Explored **Computer Management**, which groups a lot of useful administrative tools in one place.
- Looked at **Task Scheduler** and why scheduled tasks are important both for normal automation and attacker persistence.
- Checked **Event Viewer** and the role of Windows event logs during investigation.
- Used **Resource Monitor** to get more detail than Task Manager normally gives.
- Reviewed local users/groups and Windows shares.
- Looked at the **Registry** and why it contains useful configuration and security-relevant information.
- Practised remembering where these tools are located instead of relying only on the GUI.

## MSConfig

```cmd
msconfig
```

MSConfig is mainly a troubleshooting utility. The useful areas for security work are the configured services and startup-related settings.

## Task Scheduler

Scheduled tasks can run programs:

```text
At startup
At logon
At a specific time
On a schedule
After a particular event
```

This is useful legitimately, but it also makes Task Scheduler important during persistence investigations.

When looking at a suspicious task, I would check:

```text
Task name
Trigger
Run-as account
Program/script
Arguments
Executable path
```

## Event Viewer

```cmd
eventvwr.msc
```

Important log areas:

```text
Security
System
Application
```

Some useful Security Event IDs:

```text
4624  Successful logon
4625  Failed logon
4672  Special privileges assigned to a new logon
4688  Process creation (when enabled)
4720  User account created
4728/4732  User added to a security group
```

The important point is not memorising IDs for the sake of it. It is being able to connect an event to a user, host and action.

## Computer Management

```cmd
compmgmt.msc
```

Useful sections include:

```text
Task Scheduler
Event Viewer
Shared Folders
Local Users and Groups
Device Manager
Performance
```

This became one of the more useful "where do I find that Windows tool?" shortcuts.

## Resource Monitor

```cmd
resmon.exe
```

Resource Monitor gives a more detailed view of:

```text
CPU
Memory
Disk
Network
```

For example, when a process looks suspicious in Task Manager, Resource Monitor can help investigate what resources and network activity are actually associated with it.

## Local users / groups

```cmd
net user
net localgroup
net localgroup administrators
```

Things worth checking:

- unexpected administrator accounts
- old/stale accounts
- suspicious group membership

## Windows shares

```cmd
net share
```

Administrative shares commonly use `$`, for example:

```text
C$
ADMIN$
IPC$
```

A hidden share is not automatically a vulnerability; the important part is who can authenticate and what permissions they have.

## Registry

```cmd
regedit.exe
```

The Registry stores Windows, application, user and hardware configuration.

Main root keys:

```text
HKLM
HKCU
HKCR
HKU
HKCC
```

From a security perspective, Registry locations can also contain persistence/configuration artefacts, so they are useful during investigation.

## Useful commands

```cmd
whoami
hostname
systeminfo
tasklist
net user
net localgroup
net share
gpresult /r
```

## Detection angle (SOC-relevant)

This room connects directly to endpoint monitoring.

A suspicious scheduled task, new administrator account and unusual process creation are much more useful when they occur close together in the Windows logs.

That is the main lesson for me: **individual events can look normal; correlated events can tell the story.**

## Key takeaway

Windows already has a large set of tools for troubleshooting and investigation. Learning where these tools are and what evidence they expose is useful before moving on to dedicated security tooling.
