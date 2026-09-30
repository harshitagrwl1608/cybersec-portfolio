# Threat Actors

## Overview
Threat actors are the people, groups, or organizations that conduct or enable cyber attacks. Classifying them helps estimate capability, resources, motivation, and likely target selection.

## Core concepts
- Nation-state actors often have significant resources and intelligence objectives.
- Organized cybercrime groups typically pursue financial gain.
- Hacktivists use attacks to promote political or ideological causes.
- Insiders misuse legitimate access intentionally or accidentally.
- Script kiddies often rely on publicly available tools and exploits without deep original capability.
- Other categories may include competitors, brokers, and terrorist/extremist actors depending on the threat model.

## Practical examples
- A financially motivated criminal group may target payment data; an insider may already have legitimate access and therefore requires different controls.

## Security / mitigation
- Use layered controls rather than assuming one actor type.
- Apply least privilege, segmentation, MFA, monitoring, and secure backups.

## Detection / troubleshooting
- Threat-intelligence indicators, authentication anomalies, unusual tooling, data-access spikes, and infrastructure reuse help identify actor behavior.

## Detailed notes captured from the notebook
# Threat Actors

# Threat Actors
- Entities responsible for an event that has an impact on safety characteristics
- Why is attack happening?
- What is goal?

## Attributes of threat actors
- Potential / external
- Resources and funding
- Level of sophistication / capability of attacker

There can be a lot of motivations of the actor.

# 1. Nation states
- External
- Enormous resources
- Constant attack
- Very high sophistication & capability
- Many possible motivations
  - data exfiltration
  - revenge, espionage, etc.
- E.g. Stuxnet worm

# 2. Unsophisticated attackers
- May act pre-cursor without any knowledge of what's happening
- Don't troubleshoot script
- Motivated by hunt
  - inspiration, political etc.
- Internal / external
- Not very sophisticated
- Not much funding - personal basic resources

# 3. Hacktivist
- Attack with political purpose
- Often external policy [possibly “external publicity”]
- Can be extremely sophisticated
  - very specific attacks
  - DDoS, website etc.
- Funding may be limited

# 4. Insider Threat
- Motivated by revenge, financial gain
- Extensive resources
- Already has network access
- Med. level sophistication
  - however, he has institutional knowledge
  - what / where / when to hit!!

# 5. Organised Crime
- Usually motivated by money
- Highly sophisticated
- Mostly external
- Organised hackers; one person + more
- Professionals
- Lots of capital to fund

# 6. Shadow IT
- A group/person working around internal IT org
- People -> build their own thing
- Control form [unclear]
- Limited resources
- Medium sophistication of security
- Internal

# Threat Vectors
- Method used by attacker
- A lot of work goes into finding new / exploiting vectors

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
