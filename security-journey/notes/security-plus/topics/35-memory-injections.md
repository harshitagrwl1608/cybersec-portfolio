# Memory Injections

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 63
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

### Page 64
# 1. DLL Injection
- Dynamic link library
  - a windows lib containing class and code
  - used by app
- Attackers inject a path to malicious DLL
  - very popular
  - runs as part of target system
