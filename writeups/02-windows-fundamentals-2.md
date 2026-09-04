# Windows Fundamentals 2

> Source: TryHackMe --- Windows Fundamentals 2

## MSConfig

System Configuration (`msconfig`) is primarily a troubleshooting
utility.

``` cmd
msconfig
```

Tabs: - **General** --- startup mode. - **Boot** --- boot options. -
**Services** --- configured Windows services. - **Startup** --- startup
applications; modern Windows uses Task Manager for management. -
**Tools** --- shortcuts to administrative utilities.

## UAC Settings

``` cmd
UserAccountControlSettings.exe
```

UAC controls how Windows prompts for elevation. It reduces accidental or
unauthorised administrative actions but is not a substitute for least
privilege.

## Computer Management

``` cmd
compmgmt.msc
```

Major sections: - System Tools - Storage - Services and Applications

Important tools include Task Scheduler, Event Viewer, Shared Folders,
Local Users and Groups, Performance and Device Manager.

## Task Scheduler

Scheduled tasks can run programs/scripts at startup, logon, a specific
time, a recurring schedule or after an event.

Security relevance: scheduled tasks are legitimate automation but can
also be abused for persistence.

When investigating one, check its trigger, executable path, arguments,
run-as account and creation/modification details.

## Event Viewer

``` cmd
eventvwr.msc
```

Important logs: - Security - System - Application

Useful Security Event IDs: - **4624** --- successful logon - **4625**
--- failed logon - **4672** --- special privileges assigned to a new
logon - **4688** --- process creation when auditing is enabled -
**4720** --- user account created - **4728 / 4732** --- user added to a
security group

## Shared Folders

``` cmd
net share
```

Administrative shares commonly end in `$`, such as `C$`, `ADMIN$` and
`IPC$`.

A hidden share is not automatically vulnerable; permissions and
authentication still matter.

## Local Users and Groups

On supported Windows editions:

``` cmd
lusrmgr.msc
```

Useful commands:

``` cmd
net user
net localgroup
net localgroup administrators
```

Look for unexpected local administrators, stale accounts and suspicious
group changes.

## System Information

``` cmd
msinfo32.exe
```

Provides hardware, components, drivers, software environment, network
details and environment variables.

## Resource Monitor

``` cmd
resmon.exe
```

Four main views: - CPU - Memory - Disk - Network

Useful for investigating processes causing unusual resource or network
activity.

## Command Prompt

``` cmd
cmd.exe
```

Useful commands:

``` cmd
hostname
whoami
ipconfig /all
systeminfo
tasklist
net user
net localgroup
net share
```

Help:

``` cmd
net help
net help user
```

## Registry Editor

``` cmd
regedit.exe
```

The Registry is a hierarchical database containing Windows, application,
user and hardware configuration.

Major root keys:

``` text
HKLM
HKCU
HKCR
HKU
HKCC
```

Security relevance: registry locations can contain persistence
mechanisms, configuration and forensic evidence. Registry changes should
be made carefully.

## Practical Investigation Flow

``` text
whoami
  ↓
hostname / systeminfo
  ↓
tasklist / resmon
  ↓
scheduled tasks
  ↓
services
  ↓
Event Viewer
  ↓
users/groups
  ↓
registry / persistence locations
```

The important skill is correlating evidence instead of treating one
suspicious indicator as proof of compromise.

## Key Takeaway

MSConfig, Computer Management, Event Viewer, Resource Monitor, CMD and
Registry Editor are core Windows administration and investigation tools.
