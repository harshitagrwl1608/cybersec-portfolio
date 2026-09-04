# Windows Fundamentals 2 — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals
**Date:** 2026-09-04
**Category:** Windows Fundamentals / System Administration & Monitoring

## Objective

Second room in the series, and this one's more about the built-in admin tools — where they live, what they're for, and why a lot of them matter just as much for defense/investigation as they do for normal troubleshooting.

## Tools used

- MSConfig
- Task Scheduler
- Event Viewer
- Computer Management
- Resource Monitor
- Command Prompt
- Registry Editor
- gpresult

## Methodology

This room felt like a "here's where all the good stuff is hidden" tour more than a concept-heavy one, so most of my notes ended up being per-tool.

**MSConfig** (`msconfig`) — mainly a troubleshooting utility, but from a security angle the interesting part is the services/startup config, since that's exactly where persistence tends to live.

**Task Scheduler** is legit useful for normal automation (run at startup, at logon, on a schedule, after a specific event) but it's also a really common persistence spot for attackers, so I noted down what I'd actually check on a suspicious task — name, trigger, run-as account, the actual program/script it launches, arguments, and the executable path. Basically don't just glance at the task name and move on.

**Event Viewer** (`eventvwr.msc`) — Security, System, and Application logs are the main areas. Grabbed a handful of the Security event IDs that seem to come up constantly:

```text
4624  Successful logon
4625  Failed logon
4672  Special privileges assigned to a new logon
4688  Process creation (if enabled)
4720  User account created
4728/4732  User added to a security group
```

Point isn't to memorize these like flashcards, it's being able to connect an event back to a specific user, host, and action when something looks off.

**Computer Management** (`compmgmt.msc`) turned out to be a genuinely handy shortcut — it bundles Task Scheduler, Event Viewer, Shared Folders, Local Users and Groups, Device Manager, Performance, all in one place instead of hunting for each individually.

**Resource Monitor** (`resmon.exe`) gives more detail than Task Manager on CPU/memory/disk/network — good next step when something in Task Manager looks off and you want to actually see what it's touching on the network or disk.

Went through local users/groups next:

```cmd
net user
net localgroup
net localgroup administrators
```

things worth flagging here being unexpected admin accounts, stale/old accounts nobody uses anymore, and weird group membership.

**Shares** — `net share`. Admin shares (`C$`, `ADMIN$`, `IPC$`) show up with the `$` suffix. A hidden share existing isn't automatically a red flag on its own — what actually matters is who can authenticate to it and what they're allowed to do once they're in.

**Registry** (`regedit.exe`) — stores Windows/app/user/hardware config across the main root keys (HKLM, HKCU, HKCR, HKU, HKCC). Definitely a spot worth knowing since persistence/config artifacts show up here a lot during investigations.

Same core commands as last time plus a couple extras:

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

This room connects pretty directly to endpoint monitoring — a scheduled task, a new admin account, and an odd process creation event on their own might each look kind of normal, but stacked close together in time they start telling a story. That's basically the main lesson I took from this one: individual events can look fine in isolation, but correlated events are where the actual signal is.

## Key takeaway

Windows already ships with a surprising amount of investigation tooling built in — Event Viewer, Task Scheduler, Computer Management, Resource Monitor. Knowing where they live and what evidence each one exposes seems like a prerequisite before I even get near dedicated SOC tooling.
