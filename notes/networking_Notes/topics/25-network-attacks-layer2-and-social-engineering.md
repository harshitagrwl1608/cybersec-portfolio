# Network Attacks, Layer-2 Attacks, Social Engineering and Malware

## Detailed concepts, examples, and edge cases

BYOD: bring your own device, often for work; challenge is keeping personal devices off trusted internal networks and limiting access to organizational data. DoS: make a service unavailable by exploiting a vulnerability or consuming resources. Friendly/accidental DoS can come from routing loops or bandwidth/environmental failures.

DDoS: many attacking sources, often a botnet. Reflection/amplification: attacker sends small requests to public services and induces larger responses toward victim; examples can involve DNS/NTP. ANY DNS queries are a historical teaching example and are not universally high-amplification today.

DDoS amplification diagram with many DNS servers responding toward a victim. DNS responses can be larger than requests. VLAN hopping: gaining access to traffic in another VLAN, with switch spoofing/double tagging listed.

Switch spoofing: automatic trunk negotiation can be abused when enabled; disable dynamic negotiation and hard-code access/trunk modes. Double tagging: attacker sends two VLAN tags; native VLAN behavior can strip the first tag and expose the second tag to the next switch.

Double-tagging diagram continues: attacker injects packet from native VLAN, first switch strips native tag, second switch sees inner VLAN tag. MAC flooding: switch MAC address/CAM table can be overloaded; frames may flood when destinations are unknown. Port security can constrain MACs.

Rogue DHCP server can hand out invalid addresses/configuration. Mitigation: DHCP snooping/trusted DHCP interfaces. Rogue AP is an unauthorized wireless AP; regular wireless surveys and 802.1X/NAC can help detect/control access.

Evil twin: malicious AP imitates a legitimate AP and may have stronger signal to attract clients. Defenses include using HTTPS/TLS/VPN and validating network identity. On-path attacks observe/modify traffic; session hijacking and Wi-Fi eavesdropping are examples; encryption reduces exposure.

Social engineering: phishing emails steal credentials or trick users; phishing may look genuine and links can lead to malware. How to identify: generic/personalized wording, poor grammar, unexpected requests, lookalike domains. Shoulder surfing observes a screen from nearby or behind.

Prevent shoulder surfing with screen positioning/privacy controls and awareness. Tailgating/piggybacking: enter building behind authorized person. Prevention: visitor policy, one-person entry at a time, badge checks and similar physical controls.

Dumpster diving: attacker goes through trash/garbage bins to recover sensitive information. Prevention: shredding/burning and secure physical access/disposal. This material emphasizes strings/labels can reveal sensitive details.

Malware: malicious software may spy, steal data, or recruit devices into botnets; can display ads or extort money. Types listed: virus, worm, Trojan, spyware, ransomware, rootkit, logic bomb/backdoor. Infection often involves user action plus a malicious payload/backdoor chain.

For some attacks, user clicks something or a webpage popup/redirect triggers the next stage. This material emphasizes keeping systems updated/aware.

## Denial of Service (DoS)
A DoS condition makes a service, system or network resource unavailable or substantially degraded. Causes include resource exhaustion, malformed input, software vulnerabilities, excessive traffic, connection-state exhaustion or environmental failure.

A DoS can be intentional or accidental. A routing loop, runaway broadcast or device misconfiguration can produce a "friendly" DoS without a malicious attacker.

## Distributed Denial of Service (DDoS)
A DDoS uses multiple distributed sources against a target, often through a botnet of compromised systems. Distribution increases available traffic/connection pressure and makes blocking by a single source IP less effective.

## Reflection and amplification
A reflection attack sends requests to third-party systems with a spoofed victim source address. If the response is larger than the request, the attack gains amplification.

```text
Attacker -- small request --> many reflectors
   victim <--- larger replies -- reflectors
```

UDP-based services are common reflection targets because they are connectionless. DNS, NTP and other protocols have historically been abused.

The older `dig ANY` example is useful for understanding the concept but should not be assumed to represent current universal DNS amplification behavior; modern DNS software and providers often limit or minimize ANY responses.

## VLAN hopping
VLAN hopping attempts to reach traffic in VLANs the attacker should not access.

### Switch spoofing
An attacker tries to make an access interface negotiate trunking so the interface receives traffic for multiple VLANs. Mitigation: explicitly configure host-facing ports as access ports and disable unnecessary dynamic trunk negotiation.

### Double tagging
A frame contains two 802.1Q VLAN tags. Under a vulnerable native-VLAN/trunk arrangement, the first switch may remove the outer/native tag and forward the frame; the second switch may then process the remaining inner tag.

The attack depends on the topology and VLAN configuration and is often one-way. Correct native-VLAN design and explicit trunk/access configuration reduce exposure.

## MAC flooding
A switch learns source MAC addresses in a CAM/MAC table. If the table is overwhelmed with bogus source addresses, the switch may have to treat some destinations as unknown and flood frames within the VLAN. Port security can limit learned MAC addresses and reduce this attack path.

## Rogue DHCP server
A rogue DHCP server can distribute attacker-controlled addressing information such as a malicious gateway or DNS server. On managed switches, DHCP snooping can permit DHCP server replies only on trusted interfaces and build a binding database.

## Rogue access point
A rogue AP is an unauthorized wireless access point attached to a network. Risks include bypassing normal access controls, exposing internal traffic and creating an unmanaged entry point.

## Evil twin
An evil twin is a malicious AP configured to imitate a legitimate wireless network. A client may associate to the rogue AP because its SSID appears familiar. Strong enterprise authentication, certificate validation, VPNs and wireless monitoring reduce risk.

## On-path / man-in-the-middle interception
An on-path attacker positions itself so traffic travels through an attacker-controlled system. Encryption such as TLS or IPsec can protect the data contents, but users can still be targeted through credential theft, certificate errors, endpoint compromise or malicious portals.

## Social engineering

### Phishing
Fraudulent messages designed to trick users into revealing credentials, opening malicious content or performing an unsafe action. Warning signs include unexpected urgency, suspicious domains, unusual attachments/links, requests for credentials and mismatched branding.

### Shoulder surfing
Observing passwords, PINs, screens or sensitive information from nearby.

### Tailgating / piggybacking
Gaining physical access by following an authorized person through a controlled entry.

- **Tailgating:** entering without explicit authorization while following someone.
- **Piggybacking:** the authorized person knowingly or unknowingly lets another person in.

### Dumpster diving
Searching discarded materials for useful information such as documents, labels, passwords or hardware details. Secure shredding/destruction reduces the exposure.

## Malware

- **Virus:** malicious code that attaches to another file/program and typically requires execution of the host content.
- **Worm:** self-propagating malware that spreads without requiring the user to manually copy the program to each target.
- **Trojan:** malicious software disguised as a legitimate application/file.
- **Spyware:** monitors or collects information without appropriate authorization.
- **Ransomware:** encrypts or otherwise blocks access to data/systems to extort payment; modern campaigns may also steal data.
- **Rootkit:** techniques/software designed to maintain privileged stealth or hide malicious components.
- **Logic bomb:** malicious behavior triggered by a specific condition or time.
- **Backdoor:** mechanism that bypasses normal authentication/control, whether intentionally installed for administration or maliciously abused.

## Security principle
No single security control eliminates these threats. Layered defenses include patching, segmentation, identity security, MFA, endpoint protection, secure configuration, logging, backups, user training and incident response.

## Layer-2 attack/defense relationship
```text
Threat                      Mitigation example
------------------------------------------------
Rogue DHCP              →   DHCP snooping
ARP poisoning           →   DAI / static validation
MAC flooding            →   Port security
Switch spoofing         →   Explicit access/trunk config
Evil twin               →   Enterprise auth + monitoring
```

## Verified / corrected technical details

- DNS `ANY` responses are retained as a historical amplification example only; modern authoritative providers often minimize or refuse broad ANY responses, so amplification behavior varies.
- DHCP snooping, DAI and IP Source Guard are related Layer-2 controls but their availability and exact implementation depend on the switch vendor/platform.
- Evil-twin defenses should include certificate-aware authentication where possible; simply "hiding" an SSID is not a security control.

## Verification references

The links below document the verification basis for this file and are optional for study.

- [Cisco — Layer-2 security features (port security, DHCP snooping, DAI, IP Source Guard)](https://www.cisco.com/c/en/us/support/docs/switches/catalyst-3750-series-switches/72846-layer2-secftrs-catl3fixed.html)
