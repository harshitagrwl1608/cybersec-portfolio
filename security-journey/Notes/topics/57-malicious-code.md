# Malicious Code

## Overview
Malicious code is attacker-controlled software or script logic introduced to perform unauthorized actions. It can exploit a software flaw, abuse a legitimate interpreter, or act as a payload after another attack gains execution.

## Core concepts
- Malicious code can execute through scripts, macros, binaries, injected code, or memory-resident techniques.
- Examples include ransomware payloads, browser scripts, command shells, and web application code injection.
- Secure coding, application control, patching, and endpoint protection all reduce exposure.

## Practical examples
- A malicious document macro or script can act as an initial execution mechanism, while later code performs persistence or data theft.

## Security / mitigation
- Use allow-listing, macro/script restrictions, patch management, endpoint monitoring, and user awareness.

## Detection / troubleshooting
- Process-tree anomalies, script interpreters launched by unusual parents, unsigned binaries, and suspicious command-line arguments are useful signals.

## Detailed notes captured from the notebook
# Malicious Code

# Malicious Code
## Exploiting a system
- Many techniques
- do not require much technical knowledge
- There are still ways to get into a well-secured system
  - exploit with malicious code
  - backdoor into a bridge
- Attackers may use any opportunity they come

### Protection
- anti malware
- firewall
- Anti updates & patches
- Secure computing habits

Example: **WannaCry ransomware**
- executable exploited a vuln in Windows SMB
- arb. code execution

## ii) British Airways XSS
- 22 lines of malicious JS loaded on website
- [rest of line unclear]

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
