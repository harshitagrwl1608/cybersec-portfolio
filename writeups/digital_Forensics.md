# Digital Forensics Fundamentals

**Category:** Defensive Security — Digital Forensics

## Objective
Understand the disciplined process behind digital forensics — collection
through reporting — the principles that keep evidence legally/practically
usable (chain of custody, write blockers, hashing), the different
forensic sub-disciplines, and the core toolset (FTK Imager, Autopsy,
DumpIt, Volatility).

## Tools Referenced
FTK Imager, Autopsy, DumpIt, Volatility

## Methodology

### Core Methodology
```
Collection → Examination → Analysis → Reporting
```

**1. Collection** — identify relevant devices/evidence, preserve evidence
without unnecessary alteration, obtain proper authorization, maintain
documentation and chain of custody, acquire volatile evidence when
appropriate. Examples: disk image, memory image, logs, browser artifacts,
files, network captures, mobile-device data.

**2. Examination** — process/acquire the evidence, filter irrelevant
data, extract artifacts of interest, recover useful information.
Examples: search for files, parse event logs, extract browser history,
identify deleted files, extract timestamps/metadata.

**3. Analysis** — correlate artifacts, build a timeline, determine what
happened, identify relationships between evidence sources, form and test
hypotheses. **A single artifact can be misleading — correlation across
multiple sources increases confidence.**

**4. Reporting** — a forensic report should clearly describe: scope,
evidence examined, acquisition/preservation method, tools and versions
where relevant, findings, timeline, limitations, conclusions,
recommendations.

### Evidence Acquisition Principles

**Authorization** — obtain appropriate authorization before collecting
sensitive data.

**Chain of custody** — a formal record of: what evidence was collected,
who collected it, when, where it was stored, who accessed/transferred it,
what actions were performed. The purpose is demonstrating integrity and
accountability — a broken chain of custody can make otherwise-solid
evidence inadmissible or unreliable.

**Write blockers** — a hardware/software write blocker prevents writes to
source media during acquisition, preserving the original evidence
untouched.

**Hashing** — cryptographic hashes verify evidence integrity:
```bash
sha256sum evidence.img
```
Record the hash at acquisition time and verify it later. **Important
caveat:** a matching hash proves the file hasn't changed *since the hash
was recorded* — it does not by itself prove the original acquisition
process was correct. Hashing is one part of evidence handling, not the
whole of it.

### Practical Acquisition Checklist
- [ ] Confirm authorization and scope
- [ ] Identify the device/evidence source
- [ ] Record device identifiers and current state
- [ ] Photograph/document relevant setup where appropriate
- [ ] Decide whether volatile evidence should be collected first
- [ ] Use appropriate acquisition tools
- [ ] Use a write blocker for storage acquisition when appropriate
- [ ] Calculate cryptographic hashes
- [ ] Store originals securely
- [ ] Analyze copies rather than the original whenever possible
- [ ] Maintain chain-of-custody records
- [ ] Record tool versions and acquisition details

### Why Volatile Data Matters — Order of Volatility
Some evidence disappears the instant a device loses power. A simplified
volatility principle, roughly most-to-least volatile:
```
CPU/register state
      ↓
RAM
      ↓
Temporary/system state
      ↓
Disk/storage
      ↓
Backups/archival media
```
The exact order depends on the investigation, but the general principle
holds: **capture short-lived evidence before it disappears**, which is
why a live memory capture often happens before pulling the power on a
compromised machine.

### Types of Digital Forensics
| Type | Investigates |
|------|--------------|
| Computer forensics | Computers, disks, OS artifacts |
| Mobile forensics | Smartphones/tablets and their artifacts |
| Database forensics | Database activity and artifacts |
| Network forensics | Network traffic and network devices |
| Memory forensics | Volatile RAM captures |
| Email forensics | Email messages, headers, attachments, related artifacts |

### Windows Forensics — Key Artifact Sources
Windows Event Logs, Registry, Prefetch, Scheduled Tasks, Services,
Browser artifacts, PowerShell logs, User profiles, File-system metadata,
Recycle Bin, Amcache/Shimcache-related artifacts, Authentication records.

### Disk Image vs Memory Image
| Image | Contains | Volatility |
|-------|----------|------------|
| Disk image | Data stored on a drive | Non-volatile |
| Memory image | Data present in RAM | Volatile |

Memory can hold valuable short-lived information: running processes,
network connections, loaded modules, command-line history, some
credentials/secrets, and malware that only ever exists resident in
memory (never touching disk) — a strong reason memory forensics matters
even when a disk image looks "clean."

### Popular Tools
- **FTK Imager** — GUI forensic imaging/acquisition and evidence preview
  tool; used for disk acquisition, evidence preview, hashing, basic
  examination.
- **Autopsy** — open-source digital forensics platform; file-system
  analysis, keyword search, deleted-file recovery, timeline analysis,
  artifact analysis.
- **DumpIt** — command-line memory acquisition utility for capturing RAM.
- **Volatility** — open-source memory-forensics framework; analyzes
  memory images to extract processes, network connections, loaded
  modules, command lines, and other memory-resident artifacts.

### Example Forensic Workflow
```
Get authorization
      ↓
Identify evidence
      ↓
Document scene/state
      ↓
Acquire evidence
      ↓
Hash / verify
      ↓
Examine a working copy
      ↓
Analyze + correlate
      ↓
Build timeline
      ↓
Report findings
```

## Detection Angle
Digital forensics is fundamentally the *post-incident* half of the
detection lifecycle (see SOC Fundamentals writeup) — where the SIEM/EDR
alert tells you *something* happened, forensics tells you exactly *what*
happened, in what order, and how far it spread. Memory forensics
specifically closes a real blind spot: malware that lives entirely in
RAM and never touches disk won't show up in a disk image or most
traditional file-based AV scans — which is exactly why order-of-volatility
matters operationally, not just academically.

## Key Takeaway
The discipline here isn't really about the tools (FTK Imager vs Autopsy
vs Volatility are largely interchangeable for their respective jobs) —
it's about **not touching the original evidence**. Every principle in
this room (write blockers, hashing, chain of custody, analyzing copies
instead of originals) exists to answer one question later: *how do you
prove your investigation didn't itself corrupt or alter the evidence?*
