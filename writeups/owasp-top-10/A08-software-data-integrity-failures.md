# A08 — Software or Data Integrity Failures
 
## Definition
Occurs when an application relies on code, updates, or data that it
*assumes* is safe — without actually verifying its authenticity,
integrity, or origin.
 
**Common manifestations:**
- Trusting software updates without verification
- Loading scripts or config files from untrusted sources
- Failing to validate data before using/executing it
 
## Mitigation
**Establish trust boundaries.** Never assume code or updates are
legitimate by default — verify with checksums.
