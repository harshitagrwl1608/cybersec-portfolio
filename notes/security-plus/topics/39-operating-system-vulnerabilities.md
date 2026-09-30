# Operating System Vulnerabilities

## Overview
Operating-system vulnerabilities arise from flaws in kernels, drivers, system services, security boundaries, or default configurations. They may enable privilege escalation, code execution, information disclosure, or denial of service.

## Core concepts
- Keep supported operating systems patched.
- Reduce attack surface by disabling unused services and enforcing secure configuration baselines.
- Use application control, endpoint security, and least privilege to limit impact when a vulnerability is exploited.

## Practical examples
- A local user might exploit an unpatched kernel vulnerability to obtain administrator/root privileges.

## Security / mitigation
- Patch according to risk, prioritize internet-facing and actively exploited issues, and use compensating controls when immediate patching is impossible.

## Detection / troubleshooting
- Unexpected privilege changes, kernel/security alerts, suspicious crashes, and exploitation attempts in logs can be useful signals.

## Detailed notes captured from the notebook
# Operating System Vulnerabilities

# Operating System Vulnerability
## Operating system vulnerabilities
- It is a foundational computing platform
  - everyone has it
  - big TARGET
- OS are remarkably complex
  - millions of lines of code
  - vulns just sit there until discovered
- Usually OS have regular patch updates

## Best Practices
- Always update
- For home
  - get backup & do it
- For large env.
  - get test done

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
