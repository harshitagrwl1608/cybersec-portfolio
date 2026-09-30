# Windows Fundamentals 1 — TryHackMe

**Path:** Cyber Security 101 — Windows and AD Fundamentals
**Date:** 2026-09-04
**Category:** Windows Fundamentals / OS Basics

## Objective

First room in the Windows track — pretty introductory, gets you comfortable navigating Windows and understanding file permissions, NTFS, and a couple of the built-in admin tools before things get more technical in the next two rooms.

## Tools used

- File Explorer
- Control Panel / Settings
- Task Manager
- cmd
- icacls
- dir
- whoami

## Methodology

Started off just poking around the desktop, Start Menu, File Explorer — nothing new here if you've used Windows before, but the room ties it back to security concepts pretty quickly which is nice.

The NTFS section is where it got more interesting. Windows doesn't just say "file exists, anyone can touch it" — permissions are handled through ACLs (read, write, execute, modify, full control), and `icacls` lets you actually see who has what:

```cmd
icacls C:\Users\Public
```

This is one of those commands that seems boring until you realize a writable directory that shouldn't be writable is basically a foothold waiting to happen, depending what runs against it.

Alternate Data Streams was the part I hadn't touched before. NTFS lets a file carry hidden data attached to it, like `file.txt:hidden.txt`, and a normal `dir` won't show you that — you need `dir /r` to actually see the stream. Not inherently malicious, but definitely something worth checking during any kind of investigation since it's a decent place to stash stuff without it showing up as a second file.

UAC came up next — basically the thing that pops up asking "are you sure" before anything needs admin rights. Worth remembering it's a layer on top of permissions, not a replacement for them. If the account already has bad permissions, UAC alone isn't saving you.

Task Manager is the usual suspects — processes, CPU/memory/disk/network, startup apps, logged in users, services. For a quick first-pass look at a machine I'd check process name, what user is running it, and whether it's eating resources it has no business eating.

Closed it out with a handful of quick enumeration commands, which honestly feel like the ones I'll end up typing out of habit on every single room from here on:

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

Windows endpoints leave way more evidence than just network traffic — process activity, startup changes, account/group changes, privilege escalation, all of it is visible if you're looking in the right place. Small thing that stuck with me: `whoami` tells you who you actually are right now, and `tasklist` lets you tie that identity to what's actually running — putting those two together is basically step one of "does this look normal."

## Key takeaway

Feels like a "know your house before you defend it" room — before touching anything more advanced, I need to be able to comfortably enumerate a Windows box and have a baseline sense of what normal looks like, otherwise nothing weird is going to stand out later.
