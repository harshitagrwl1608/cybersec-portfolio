# Windows Fundamentals 1

> Source: TryHackMe --- Windows Fundamentals 1

## Windows Desktop

-   Desktop: shortcuts and files.
-   Start Menu: applications, search and settings.
-   Taskbar: running/pinned applications and system tray.
-   File Explorer: browse drives, folders and files.
-   Settings / Control Panel: system configuration.

## NTFS

NTFS (New Technology File System) is the main Windows filesystem.
Important features include ACL permissions, ownership, auditing,
journaling, compression and EFS encryption.

``` cmd
fsutil fsinfo volumeinfo C:
icacls C:\Users
```

### NTFS vs FAT32

  Feature           NTFS        FAT32
  ----------------- ----------- -------------------------
  ACL permissions   Yes         Limited
  Journaling        Yes         No
  EFS               Yes         No
  Large files       Supported   \~4 GB maximum per file

## Windows Permissions

-   **Read** --- view information.
-   **Write** --- modify information.
-   **Execute** --- run a program.
-   **List folder contents** --- enumerate a directory.
-   **Modify** --- read/write plus deletion.
-   **Full control** --- broad control over the object.

Use least privilege: users should receive only the access they need.

``` cmd
icacls C:\Users\Public
```

## Alternate Data Streams (ADS)

NTFS supports named alternate data streams, for example:

``` text
file.txt:hidden.txt
```

ADS has legitimate uses, but attackers have historically abused it to
hide data from normal directory listings.

``` cmd
dir /r
```

## Windows`\System32`{=tex}

`C:\Windows\System32` contains critical Windows executables, DLLs and
utilities such as `cmd.exe`, `regedit.exe` and `taskmgr.exe`.

On 64-bit Windows, System32 contains 64-bit system binaries; SysWOW64
contains many 32-bit components.

## Environment Variables

``` cmd
echo %WINDIR%
echo %PATH%
echo %TEMP%
echo %USERNAME%
echo %COMPUTERNAME%
```

`%WINDIR%` normally points to the Windows installation directory. The
`PATH` variable determines where executables are searched for, so unsafe
writable PATH locations can create security issues.

## UAC

User Account Control (UAC) helps prevent applications/users from
silently performing administrative actions.

``` cmd
UserAccountControlSettings.exe
```

UAC is an additional protection layer, not a replacement for proper
permissions.

## Control Panel

Control Panel contains legacy administration interfaces for users,
programs, networking, firewall and system settings.

## Task Manager

Task Manager provides visibility into processes, resource usage, startup
applications, users and services.

For security triage, check suspicious processes, high resource usage,
unexpected startup items and which user owns a process.

## Useful Commands

``` cmd
hostname
whoami
ipconfig
ipconfig /all
tasklist
systeminfo
net user
net localgroup
```

## Practical Security Checklist

1.  Identify the user with `whoami`.
2.  Identify the host with `hostname`.
3.  Review processes and startup items.
4.  Check local group membership.
5.  Inspect suspicious ACLs with `icacls`.
6.  Check ADS with `dir /r`.
7.  Treat UAC prompts seriously.
8.  Avoid modifying System32 without a clear reason.

## Key Takeaway

Windows fundamentals matter in security work because permissions,
processes, users, filesystems and built-in utilities are common sources
of both evidence and attack surface.
