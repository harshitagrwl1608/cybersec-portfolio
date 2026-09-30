# Memory Injections

## Overview
Memory-injection vulnerabilities involve modifying or redirecting data/code in process memory so that unintended instructions execute or protections are bypassed. They often depend on unsafe memory handling, weak validation, or compromised process context.

## Core concepts
- Examples include code injection into process memory, unsafe DLL/module loading, and other attacks that alter execution state.
- Modern mitigations include DEP/NX, ASLR, control-flow integrity, memory-safe languages, and exploit mitigations provided by the OS and compiler.
- Memory corruption and memory injection are related but not identical; the latter focuses on getting attacker-controlled code/data into a memory-resident execution path.

## Practical examples
- An attacker may attempt to inject code into a running process after gaining an initial foothold.

## Security / mitigation
- Use memory-safe development where possible, secure loading paths, least privilege, endpoint protections, and current OS/firmware patches.

## Detection / troubleshooting
- Monitor suspicious process injection telemetry, unusual memory-permission changes, unsigned modules, and security-tool alerts.

## Detailed notes captured from the notebook
# Memory Injections

# Memory Injections
## Finding malware
- Malware runs in memory
  - hides somewhere
  - creates its own process and injects into a legitimate one
- Memory contains various target processes
  - DLLs
  - Threads / buffers
  - Memory management

# Memory injection
- Add code into memory of an existing process
  - hide malware
- Get access to data in the process
  - same rights & perms

# 1. DLL Injection
- Dynamic link library
  - a windows lib containing class and code
  - used by app
- Attackers inject a path to malicious DLL
  - very popular
  - runs as part of target system

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
