# [Passive Reconnaissance] — TryHackMe

**Path:** Jr Penetration Tester
**Date:** 2026-08-08
**Category:** Reconnaissance — Passive (OSINT)

## Objective
Learn to gather information about a target without directly interacting with
it — no packets hit the target, so nothing to detect on their end.

## Tools used
- whois, RDAP, nslookup, dig
- frameworks like DNSDumpster, CT Logs, Shodan

## Methodology
- Used whois and rdap commands(rdap is better on modern systems) to passively discover domain query reports for a given domain.
- used dig(Domain Information Groper) with flags such as -A, AAAA, CNAME, MX, SOA, TXT
  to discover server information (Use dig over nslookup)
- Extended beyond the room's tools to also check dnsdumpster (subdomain/mail server mapping) and Shodan(search engine for publicly accessible networks) — both stay fully passive since neither sends anything to the target directly


**RDAP Command Execution**
  
![RDAP command execution](Network_Reconnaissance_01_01.png)

**Dig command execution**

![Dig command execution](Network_Reconnaissance_01_02.png)
![Dig command execution](Network_Reconnaissance_01_03.png)


## Detection angle (SOC-relevant)
This is the one room where there's nothing to detect on the target's side —
passive recon never touches the target directly, only third parties like
registrars and public DNS servers.

## Key takeaway
These tools can easily be used to discover potential information about a target without any knowledge to target.
