# [Windows Fundamentals 1] — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals  
**Date:** 2026-09-04  
**Category:** Windows Fundamentals — OS Basics

## Objective

Learn the basic Windows environment, how Windows stores files, how user permissions work, and where some of the important built-in administrative/security tools are located.

## Tools used

- File Explorer
- Control Panel / Settings
- Task Manager
- `cmd`
- `icacls`
- `dir`
- `whoami`

## Methodology

- Started with the Windows desktop, Start Menu, taskbar and File Explorer to get comfortable navigating the OS.
- Looked at the Windows file system and why **NTFS** is important from a security point of view.
- Checked file/folder permissions and how Windows uses ACLs to decide what a user can do.
- Looked at **Alternate Data Streams (ADS)** because files can contain more than what is visible in a normal directory listing.
- Explored **UAC**, the Control Panel and Task Manager.
- Used basic commands such as `whoami`, `hostname`, `ipconfig`, `tasklist` and `systeminfo` for quick host/user enumeration.
- Also noted the role of `C:\Windows\System32` and Windows environment variables.

## NTFS + Permissions

NTFS supports permissions through ACLs. The important idea is that access is not simply "file exists = everyone can use it".

Common permissions include:

```text
Read
Write
Execute
Modify
Full Control
```

I used `icacls` to inspect permissions:

```cmd
icacls C:\Users\Public
```

This is useful during enumeration because a writable directory can become security-relevant depending on what files/programs use it.

## Alternate Data Streams

NTFS supports **Alternate Data Streams**, for example:

```text
file.txt:hidden.txt
```

They can be legitimate, but from a security perspective they are worth checking because data can be stored without appearing as a normal second file.

```cmd
dir /r
```

## UAC

**User Account Control (UAC)** is used to control elevation of privileges when an action requires administrator-level access.

```cmd
UserAccountControlSettings.exe
```

The main thing I took from this was that UAC is an extra protection layer around administrative actions, not a replacement for correct permissions.

## Task Manager

Task Manager is useful for a quick look at:

- running processes
- CPU / memory / disk / network usage
- startup applications
- logged-in users
- services

For a first-pass investigation, I would check the process name, the user running it and whether the process is consuming unusual resources.

## Useful commands

```cmd
whoami
hostname
ipconfig
ipconfig /all
tasklist
systeminfo
net user
net localgroup
```

## Detection angle (SOC-relevant)

Windows endpoint activity leaves a lot more evidence than just the network traffic.

From a SOC point of view, useful things to correlate are suspicious processes, unexpected startup items, account/group changes and unusual privilege elevation.

For example, `whoami` tells me **which identity I am actually using**, while `tasklist` lets me connect that identity to what is currently running.

## Key takeaway

Windows security starts with understanding the host itself — users, permissions, files, processes and built-in tools. Before doing anything more advanced, I need to be comfortable enumerating the machine and understanding what normal Windows activity looks like.
