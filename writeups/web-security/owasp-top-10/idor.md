# IDOR — Insecure Direct Object Reference
 
## Definition
Some kind of reference that an application uses **internally** to locate
objects/records. If the application lets a user directly supply that
reference — without checking whether they're actually permitted to access
it — that's an IDOR.
 
## Why It's So Simple
- No need for sophisticated tools
- No real "hacking" or hijacking involved
- Just change the URL/parameter → **boom, you're in**
 
## The Root Cause
**The server doesn't authenticate the reference itself** — it just
assumes an authenticated user can access *any* object ID, rather than
checking whether *this* user is allowed to access *that specific* ID.
 
---
 
## In Practice, IDs Leak Through
- Shared URLs
- API responses that reference another user's object
- JS files
- CSV reports
 
## The core question
Does the server actually enforce authorization on every request, or does
it just render whatever ID it's given?
 
## Where IDOR Is Located
 
### i) Background Requests
Async HTTP requests — found using browser DevTools' Network tab or
Burp Suite. You can spot a background request like:
```
/api/v1/customer?id=15
```
If the `id` parameter isn't properly validated against the logged-in
user's session, it can be exploited by simply changing the number.
 
### ii) JS Files
Reviewing a site's JavaScript files can reveal endpoints the developer
didn't intend/expect users to discover or interact with directly.
 
### iii) Parameter Mining
Parameters that the frontend UI never actually sends, but that were
introduced during development and never removed from the backend.
 
Example: `/user/details` might silently accept and return a full user
profile even without an `id` parameter being supplied at all — meaning
the endpoint's access logic was never properly scoped.
 
---
 
## When IDs Aren't Plain Numbers
 
Not every IDOR target is a simple sequential integer. Three common
variations:
 
### i) Encoded IDs
IDs can always be decoded — encoding is not the same as security.
 
**Most common: Base64**
- Noticeably longer than the original value
- Usually ends with `=` (padding character)
 
**Simple to decode:**
```bash
echo <value> | base64 -d
```
 
**Workflow:** change → re-encode → replace in the request.
 
### ii) Hashed IDs
A fixed-length string of hexadecimal characters. However, if the input
being hashed is sequential/predictable, the hashing process can simply be
reproduced for any target object.
 
**Example (MD5 hashing):**
```
123 → 202cb926ac59075b964b07152d234b70
```
 
Reproducing the hash depends on knowing (or guessing) the hashing
algorithm being used.
 
**CrackStation:** a database of billions of precomputed hash-value pairs
— useful for reversing common/weak hashes instantly.
 
**Encountering a hashed ID — what to do:**
1. Check the length to identify the likely algorithm:
 
   | Algorithm | Length |
   |-----------|--------|
   | MD5 | 32 chars |
   | SHA-1 | 40 chars |
   | SHA-256 | 64 chars |
 
   Tools: `hashid` / `hash-identifier` on Linux.
 
2. Once the algorithm is known, try comparing against predictable,
   sequential, or otherwise known input values to reproduce a target hash.
 
### iii) Unpredictable UUIDs
No relationship to anything — effectively random, not derivable through
guessing or pattern analysis.
 
**Testing approach:**
- Create two accounts
- Try swapping one account's UUID into the other's requests, to check
  whether the server actually authenticates/authorizes the UUID or just
  trusts whatever is supplied
 
**If that's not possible:** you'd need to actually obtain the target
user's real UUID some other way (e.g. via one of the leak vectors listed
above — shared URLs, API responses, JS files, CSV exports) since it can't
be guessed or brute-forced like a sequential ID.
