# Viruses & Worms

## Overview
Viruses and worms both replicate malicious code, but a virus normally requires a host and execution event while a worm is designed to self-propagate, commonly over a network.

## Core concepts
- Common virus categories include file/program, boot-sector, macro, script, and memory-resident/fileless behaviors.
- Worms can spread automatically once they obtain access to a vulnerable or weakly protected system.
- Worm outbreaks can move faster than manual response, so segmentation and rapid isolation are important.

## Practical examples
- WannaCry is a well-known example of malware that propagated using a Windows SMB vulnerability and combined ransomware impact with worm-like spreading behavior.

## Security / mitigation
- Patch exposed services, disable unnecessary protocols, segment networks, restrict lateral movement, and keep reliable backups.

## Detection / troubleshooting
- Look for rapid repeated connections, scanning behavior, identical process/file activity across many hosts, and endpoint alerts occurring in waves.

## Detailed notes captured from the notebook
# Viruses & Worms

# Viruses & Worms
## Virus
- Can't reproduce itself
  - needs you to execute something
- Just running a program can spread a virus
- May / may not create problem
- AVs -> signatures

### Types
- Program virus -> part of app
- Boot sector viruses
- Script viruses
- Macro virus

## Fileless virus
- Very stealthy
  - don't use any memory
  - avoid AV detection
- Operate in memory
  - but never installed
  - RAM
  - adds an autostart to Registry

## Worms (CRARE)
- Malware that self-replicates
  - no external need for transmission medium
  - uses network as transmission medium
  - self propagate & spread quick
- Firewalls, IDS, IPS can mitigate many worm infections
  - however not much help if worm's got inside

Example: **WannaCry worm**
- No? ransomware using exploitable [vulnerability]
- Huge

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
