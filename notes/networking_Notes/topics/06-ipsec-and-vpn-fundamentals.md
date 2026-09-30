# IPsec and VPN Fundamentals

## Detailed concepts, examples, and edge cases

ICMP: network control/error messages; not application data transfer; ping uses ICMP Echo. Can report unreachable/time-exceeded information. GRE: tunnel between endpoints and can encapsulate IP inside IP; no built-in encryption. VPN: virtual private network, concentrator may be hardware/software.

IPsec: Layer 3 security for IP; confidentiality/integrity/anti-replay. AH authenticates/integrity; ESP provides encrypted/authenticated payload protection. VPN gateway/concentrator diagram.

IPsec key exchange: agreement on algorithms/keys using IKE. Notes depict IKE and ESP tunnels, with two phases in traditional IKEv1 terminology. IKE uses UDP 500 and NAT traversal uses UDP 4500.

Transport mode vs tunnel mode diagrams. Authentication Header placement and ESP format. ESP provides encrypted payload and integrity/authentication fields; tunnel mode adds a new outer IP header.

## GRE
Generic Routing Encapsulation (GRE) creates a tunnel by encapsulating packets inside another IP packet. GRE can carry traffic through an intermediate IP network, but GRE itself does **not** provide encryption or authentication. It is commonly paired with IPsec when confidentiality is required.

## IPsec
IPsec is a family of protocols and mechanisms used to protect IP traffic. Its goals include confidentiality, integrity, authentication of peers/packets, anti-replay protection and secure key management.

### AH — Authentication Header
AH provides integrity/authentication protection and anti-replay features for IP packets, but it does not encrypt the payload. AH is therefore sensitive to changes in IP header fields and is not NAT-friendly.

### ESP — Encapsulating Security Payload
ESP can provide confidentiality through encryption and can also provide integrity/authentication and anti-replay protection. In modern deployments ESP is the main IPsec data-plane protocol.

### IKE / IKEv2
IKE establishes Security Associations and negotiates algorithms/keys between peers. IKEv2 is the modern Internet-standard key-management protocol for IPsec.

## IKEv1 terminology vs IKEv2
A common example uses the familiar **Phase 1 / Phase 2** model, which is an IKEv1 teaching shorthand:

1. Phase 1 establishes an authenticated secure channel for management.
2. Phase 2 negotiates the IPsec SAs used to protect data.

IKEv2 has a different exchange model, so avoid treating "Phase 1/Phase 2" as the formal structure of IKEv2.

## Transport mode vs tunnel mode

```text
Transport mode:
[ IP header ][ ESP/AH ][ upper-layer data ]

Tunnel mode:
[ New IP header ][ ESP/AH ][ Original IP header ][ data ]
```

- **Transport mode:** primarily protects the upper-layer payload while retaining the original IP header. Common in host-to-host scenarios.
- **Tunnel mode:** encapsulates the entire original IP packet. Common in site-to-site VPN gateways and remote-access VPNs.

## Site-to-site VPN
A site-to-site VPN securely connects two networks across an untrusted network such as the Internet.

```text
LAN A ── VPN Gateway A ═════ encrypted tunnel ═════ VPN Gateway B ── LAN B
```

The gateways can authenticate, establish security associations and encrypt traffic passing through the tunnel.

## Remote-access/client VPN
A client VPN creates a secure tunnel between a user device and an organization's VPN service. Depending on configuration, the VPN can carry all traffic or only selected corporate prefixes.

### Full tunnel vs split tunnel

**Full tunnel:**
```text
Client → VPN → organization gateway → Internet/corporate resources
```
All or nearly all traffic is sent through the VPN according to policy.

**Split tunnel:**
```text
Corporate destinations → VPN
Internet/other destinations → local connection
```
Only selected traffic uses the tunnel. This can reduce VPN bandwidth requirements but changes the security/visibility model.

## GRE over IPsec
A common design is:

```text
Original traffic → GRE encapsulation → IPsec encryption → Internet → decrypt → GRE decapsulation
```

GRE supplies flexible tunneling/routing; IPsec supplies the security.

## NAT traversal
IPsec ESP is an IP protocol rather than a TCP/UDP service, and NAT devices can complicate native ESP. IKEv2 deployments commonly use UDP encapsulation on port 4500 for NAT traversal.

## What a VPN does and does not do
A VPN protects traffic **between VPN endpoints** according to its configuration. It does not automatically protect an already-compromised endpoint, validate every application, or make untrusted user input safe. Authentication, endpoint security, authorization and application controls remain necessary.

## Site-to-site IPsec flow
```mermaid
flowchart LR
A[Site A LAN] --> B[VPN Gateway A]
B --> C{{IKE / Security Association}}
C --> D[[Encrypted ESP tunnel]]
D --> E[VPN Gateway B]
E --> F[Site B LAN]
```

## Verified / corrected technical details

- AH is integrity/authentication and anti-replay, not confidentiality. ESP can provide confidentiality plus integrity/authentication.
- IKEv1 Phase 1/Phase 2 terminology is kept only as a historical shorthand; IKEv2 uses a different exchange model.
- IPsec NAT traversal commonly uses UDP 4500 after IKE negotiation; IKE normally starts on UDP 500.

## Verification references

The links below document the verification basis for this file and are optional for study.

- [IETF RFC 4301 — IPsec Architecture](https://www.rfc-editor.org/rfc/rfc4301)
- [IETF RFC 7296 — IKEv2](https://www.rfc-editor.org/rfc/rfc7296)
