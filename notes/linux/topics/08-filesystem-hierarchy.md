# Linux Filesystem Hierarchy

Linux presents a single directory tree beginning at `/`. The notes introduce the major directories below.

```text
/
├── home
├── root
├── etc
├── var
├── tmp
├── usr
├── bin
├── sbin
├── boot
├── dev
├── proc
├── sys
├── media
├── mnt
└── run
```

## `/` — root of the filesystem

The top of the entire directory hierarchy.

## `/home` — users' home directories

Stores normal users' personal directories and data.

Example:

```text
/home/harshit/
```

## `/root` — root user's home

The home directory of the `root` account. It is not the same thing as `/`.

## `/etc` — system configuration

Configuration files live here. The notes show:

```text
/etc/passwd
/etc/shadow
/etc/hosts
/etc/hostname
```

`/etc/passwd` contains account metadata; `/etc/shadow` contains password-hash related data on systems that use it and is normally restricted; `/etc/hosts` maps local hostnames; `/etc/hostname` commonly stores the system hostname.

## `/var` — variable data

Data that changes during normal operation:

- logs
- caches
- databases
- spool/state/server data

## `/tmp` — temporary files

Used for temporary data. It is often backed by normal storage and may be configured as `tmpfs`; it is therefore not literally “RAM” on every system.

## `/usr` — userland programs and data

Contains many installed programs, libraries, documentation, and other read-mostly system data. The notes use commands such as `grep` and `nano` as examples of software found in this hierarchy.

## `/bin` — essential executables

Historically used for essential user commands. On many modern Linux distributions, `/bin` is a symlink into `/usr/bin` because of the `/usr` merge, but `/bin` remains a standard path name seen by users.

Examples traditionally associated with basic commands include `ls`, `cp`, `mv`, `cat`, `echo`, `pwd`, and `rm`.

## `/sbin` — system administration executables

Historically held system-administration commands. On many modern distributions `/sbin` may also be part of a merged `/usr` hierarchy.

## `/boot` — boot-related files

Contains files needed by the boot process, such as kernels, initramfs images, and bootloader-related data depending on the distribution and setup.

## `/dev` — device nodes

Linux exposes many hardware and pseudo-devices through device files. Example:

```text
/dev/sda
```

may refer to a block device representing a storage device; the actual name depends on the system.

## `/proc` — process/kernel virtual filesystem

A virtual filesystem exposing process and kernel information. Much of its content is generated dynamically rather than stored as ordinary disk files.

## `/sys` — sysfs

A virtual filesystem exposing information and controls for devices and kernel subsystems. It provides a structured interface between userspace and the kernel for hardware/device information.

## `/media` — removable media mount points

Commonly used for automatically mounted removable media, such as USB drives, under desktop environments.

## `/mnt` — temporary/manual mount point

Conventionally used as a mount point for filesystems mounted manually or temporarily.

## `/run` — runtime state

Runtime information created since boot, including sockets, PID files and other transient state.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

