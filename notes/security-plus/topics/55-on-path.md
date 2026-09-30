# On-Path Attacks

## Overview
An on-path attacker positions themselves between two communicating parties so traffic can be observed, altered, or redirected. ARP spoofing is one local-network technique; malicious proxies and compromised browser processes are other forms.

## Core concepts
- A successful attack depends on intercepting traffic and, for useful manipulation, defeating or bypassing end-to-end integrity/authentication protections.
- HTTPS/TLS protects application traffic when certificate validation is correct, even if lower-layer traffic is intercepted.
- Browser/on-path malware can be especially dangerous because it may operate after traffic has already been decrypted by the browser.

## Practical examples
- On a local network, ARP poisoning can make a victim send traffic to an attacker's MAC address before the attacker forwards it.

## Security / mitigation
- Use encrypted end-to-end protocols, certificate validation, secure Wi-Fi, network segmentation, and ARP/DHCP protections where available.

## Detection / troubleshooting
- Monitor ARP-table changes, duplicate IP/MAC mappings, unexpected gateway MAC addresses, certificate warnings, and unusual local traffic paths.

## Detailed notes captured from the notebook
# On-Path Attacks

# On-path Attacks
- Attacker walks without you knowing it
- Can redirect your traffic
  - then pass to destination
  - E.g. ARP poisoning

## On-path browser attack
- middleman used on the same computer as the victim
  - formerly man-in-the-browser
  - malware / trojan does all of proxy
- Huge advantage to attacker
  - everything encrypted
  - everything looks normal
- NOW IT IS JUST WARNING!! for sensitive info.!

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
