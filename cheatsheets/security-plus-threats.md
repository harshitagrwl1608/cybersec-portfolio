# Security+ Threats & Attacks

## Threat actors
| Actor | Typical cue |
|---|---|
| Nation-state | Espionage, strategic objectives, high resources |
| Organized crime | Financial gain |
| Hacktivist | Ideological/political |
| Insider | Legitimate access + misuse |
| Script kiddie | Existing tools/exploits |
| Shadow IT | Unauthorized technology/service |

## Threat vectors
Phishing · malicious attachment/link · exposed service · stolen credentials · removable media · supply chain · wireless · physical access · web application.

**Vector ≠ exploit:** vector = path; exploit = technique abusing a weakness.

## Social engineering
| Attack | Cue |
|---|---|
| Phishing | Email/message |
| Smishing | SMS |
| Vishing | Voice |
| Spear phishing | Targeted phishing |
| Whaling | Executive/high-value target |
| Pretexting | Fabricated believable story |
| Impersonation | Pretend to be trusted person |
| Elicitation | Extract information through conversation |
| Watering hole | Compromise site a target group visits |
| Tailgating | Follow an authorized person into secured area |

## Malware
Virus = needs host/user action.  
Worm = self-propagates.  
Trojan = malicious software disguised as legitimate.  
Ransomware = encrypts/locks data for extortion.  
Spyware = covertly collects information.  
Rootkit = hides privileged malicious activity.  
Botnet = compromised devices under common control.  
Fileless malware = relies heavily on memory/legitimate tools.

## Common attack distinctions
- **DoS:** availability attack; one/few sources.
- **DDoS:** distributed sources.
- **MITM/on-path:** intercept/alter communication.
- **Replay:** reuse captured valid authentication/data.
- **Privilege escalation:** gain higher rights.
- **SQL injection:** manipulate backend SQL via input.
- **XSS:** inject script executed in victim's browser.
- **CSRF:** trick authenticated browser into unwanted action.
- **Directory traversal:** access unintended filesystem paths.
- **Buffer overflow:** overwrite memory beyond intended bounds.
- **Race condition:** outcome depends on timing/order.
- **Zero-day:** vulnerability with no vendor fix available at the time of exploitation/disclosure.

## Indicators
Impossible travel · unusual login time · concurrent sessions · DNS changes · abnormal bandwidth/CPU · unexpected file-hash changes · missing/altered logs · unusual read activity · security tools/updates blocked.
