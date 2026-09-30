# [Common Attacks] — TryHackMe
 
**Path:** Cyber Security 101 / Jr Penetration Tester
**Date:** 2026-08-22
**Category:** Network Security — Attack Techniques
 
## Objective
Understand a cluster of common network-layer attacks and disruption techniques:
Denial of Service (DoS), VLAN hopping, MAC flooding, social engineering, and
malware — what each one does, how it's carried out, and how it's typically
defended against or detected.
 
## Tools used
- This was more of a theory focused room explaining different attack tactics
  
## Methodology
 
### Denial of Service (DoS)
- These type of attacks involve crashing down a web server by overflooding the network with millions of requests being generated so quick that server is not able to respond to all and eventually the service crashes
- It involves exploiting a vulnerability of get the system offline
- Methods
   - A friendly DOS such as switch -loop on a network without STP enabled
   - Distributed DOS using botnets to launch an army of computers to bring a service down i.e botnets
   - DDOS reflection and amplification by exploiting internet protocols into aiding the attack eg- a dig ANY <domain_Name> query requires just 28 bytes of data but receives about 1300 bytes of response from server leading to hight resource usage with comparitively low attacking requirements.

 
### Phishing
- This type of attack generally involves tricking users into giving up their credentials through genuine looking websites by masking links or introducing malware using malicious links.
- this can be through any way ie through sms, mails, calss etc.
- Involves creating a false sense of urgency for target to make the victim act rashly 
 
### VLAN Hopping
- It involves gaining access to another VLAN inside a network - HOP to another vlan
   - Switch Spoofing - getting a trunk connection by spoofing a switch (Exploiting no authentication in trunk negotiations)
   - Double Tagging - crafting packets that have more than 1 VLAN tag (exploiting native VLAN config)
 
### Social Engineering
- Social Engineering is all about tricking a person into giving up his credentials that could be potentially misused or tricking the persons aides like his family, company, ISP etc into granting access to target accounts
- This is done by getting info of target through any means- active or passive including following target
- Then using that info to either gain trust of target or his aides into giving up his credentials
- then using those credentials into gaining access to potentially harmful information
- this type of engineering is only limited to attackers imagination and social skills
 
### Malware and Ransomware
- A malicious software designed to steal credentials, disrupt services, gain access by privleage escalations and running commands and scripts without permission
- these can be sent in any form eg- a usb stick, files, executables, links etc
- However they always require some type of user intervention in form of clicking a link, opening a file, executing some program etc.
- Types- VIRUS, trojan horse, worm , bloatware, keylogger, ransomware, rootkit etc
- a specific type ransomware involves encrypting a users data and files and demanding ransom(cryptocurrency) in exchange of decryption key.

### MAC FLooding
Explained in [writeup](./arp-poisoning.md)
 
## Detection angle (SOC-relevant)
- **DoS:** Sudden traffic volume spike from one or few sources; SIEM alert on
  requests-per-second threshold breach per source IP.
- **VLAN hopping:** Unexpected trunk negotiation attempts (DTP frames) from
  an access port; switch logs showing a port trying to become a trunk.
- **Social engineering / malware:** Mostly detected downstream — unusual
  process spawns, outbound connections to unfamiliar domains, or EDR/AV
  signature hits after the initial human-layer compromise already happened.
## Key takeaway
- There are so many techniques available that it becomes really difficult to play safe always
- as these methods generally involve taking advantage of any vulnerability it is necessary to always keep your systems up to date with right configurations.
 
