# Digital Forensics

## Core workflow
**Authorize → preserve → acquire → hash → analyze copy → correlate → timeline → report**

## Evidence principles
- Preserve original evidence.
- Document acquisition details.
- Hash evidence to support integrity.
- Maintain chain of custody.
- Work from copies when possible.
- Record tool versions and relevant timestamps.

## Volatility
Collect short-lived evidence before power-off when appropriate.

Typical principle: **CPU/registers → RAM → temporary/runtime state → storage → archives**.

## Memory vs disk
Memory image = volatile state: processes, connections, loaded modules, command-line remnants, possible memory-resident malware.  
Disk image = persistent filesystem/storage artifacts.

## Windows artifacts
Event Logs · Registry · Prefetch · Scheduled Tasks · Services · browser artifacts · PowerShell logs · user profiles · filesystem metadata · authentication records.

## Tools
FTK Imager = acquisition/preview.  
Autopsy = filesystem/artifact analysis.  
Volatility = memory forensics.  
DumpIt = memory acquisition.

## Evidence safety
**Write blocker + hashes + chain of custody** protect the defensibility of the evidence trail.