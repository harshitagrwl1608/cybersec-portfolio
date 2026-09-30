# Race Conditions

## Overview
A race condition occurs when the result depends on the timing or ordering of concurrent operations. In security-sensitive code, an attacker can exploit the gap between checking a condition and using the checked resource.

## Core concepts
- Time-of-check/time-of-use (TOCTOU) flaws are a common race-condition pattern.
- Concurrency, shared resources, files, locks, and permission checks are frequent areas of risk.
- Atomic operations, proper synchronization, locks, and transactional design reduce race windows.

## Practical examples
- A program checks that a file is safe, but the file is replaced before the program actually opens it.

## Security / mitigation
- Minimize time between authorization checks and use, use atomic APIs, and synchronize shared state.

## Detection / troubleshooting
- Look for repeated failed operations, unexpected state changes, duplicate transactions, and unusual concurrency-related errors.

## Detailed notes captured from the notebook
# Race Conditions

# Race Condition
- A programming command running happens at same time
- Bad if unexplained

### Example: Time-of-check to Time-of-use (TOCTOU)
- Check the system
- When do you use the results of your last check
- Sometimes might happen in btw that change value

### Example
Imagine 2 people using same bank account. Deposits are updated real-time but withdrawals are not, so the 2nd person might run into problem if one withdraws money while its not updated and 2nd one thinks he still got all.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
