# Buffer Overflows

## Overview
A buffer overflow occurs when software writes more data into a memory region than the allocated buffer can safely hold. The excess may overwrite adjacent data or control information and can cause crashes or code execution.

## Core concepts
- Stack and heap overflows are common categories.
- Bounds checking and memory-safe languages reduce the risk.
- Exploit mitigations include ASLR, DEP/NX, stack canaries, control-flow protections, and sandboxing.

## Practical examples
- An input field expecting 32 bytes but receiving uncontrolled data may overwrite adjacent memory if the program lacks proper bounds checking.

## Security / mitigation
- Validate lengths, use safer APIs, compile with exploit mitigations, and patch vulnerable components promptly.

## Detection / troubleshooting
- Crashes, anomalous process termination, exploit-protection alerts, and suspicious child-process creation can be indicators.

## Detailed notes captured from the notebook
# Buffer Overflows

# Buffer Overflows
- Overwrite a buffer of memory -> spills over into other memory areas
- So developers need to perform bounds checking
- It is NOT a simple exploit!!
  - may be tough
  - time consuming
  - require just right [copying], right data at right place
- A good buffer overflow should be repeatable

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
