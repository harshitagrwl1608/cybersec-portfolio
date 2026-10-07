# Application Attacks

## Overview
Application attacks target software logic, input handling, memory safety, authentication, or session behavior. Many are prevented through secure development practices and correct use of frameworks and platform security controls.

## Core concepts
- Injection changes how an interpreter processes input.
- Buffer overflows exploit unsafe memory handling.
- Replay and authentication/session attacks reuse or manipulate valid identity state.
- Input validation, output encoding, parameterization, and secure session management address common application risks.

## Practical examples
- OWASP guidance treats SQL injection, XSS, CSRF, and unsafe file handling as important classes of application security problems.

## Security / mitigation
- Threat model applications early, perform secure code review and testing, use secure framework defaults, and patch dependencies.

## Detection / troubleshooting
- Application logs, WAF alerts, database anomalies, error spikes, and suspicious request patterns can help detect attacks.

## Detailed notes captured from the notebook
1. **Injection Attack**
   - Code injection
   - Enabled because of bad programming
   - Validation, etc
   - E.g. HTML, XSS, SQL, etc.
2. **Buffer Overflows**
   - More info than what is allowed
   - Dump responses to other ones
   - Devs need to perform bounds checking
   - Very difficult
   - useful if found a buffer repeatable
3. **Replay Attack**
   - Main diff -> get info
   - auth as someone else
   - usually on-path + replay attack

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
