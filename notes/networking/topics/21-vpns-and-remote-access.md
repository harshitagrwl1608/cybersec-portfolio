# VPNs and Remote Access

## Detailed concepts, examples, and edge cases

VPN overview: encrypted/private data across public networks; concentrator encrypts/decrypts and can be integrated with a firewall. Client-to-site and site-to-site VPN diagrams show protected tunnels over Internet. On-demand client software connects to VPN concentrator.

Clientless VPN uses an HTTPS browser interface and comprehensive API support; split tunnel vs full tunnel. Full tunnel sends all traffic through VPN; split tunnel sends only selected traffic, configured by VPN client/policy.

Remote access: SSH TCP 22; RDP for Remote Desktop; VNC uses Remote Frame Buffer protocol; API integration; console access for physical/OOB management; jump box gives secure access through one controlled server.

In-band management uses normal network addressing/path. Out-of-band management is a separate physical/network path used when the production network is unavailable; notes highlight cable/console access.

## VPN overview
A Virtual Private Network creates a protected logical path across an untrusted or public network. The security properties depend on the VPN protocol, authentication method, algorithms and configuration.

## Client-to-site VPN
A remote client establishes a tunnel to the organization's VPN concentrator/gateway.

```text
Corporate LAN ==== VPN Gateway ═════ Internet ═════ Remote Client
                                      encrypted tunnel
```

This is commonly used for remote workers who need access to internal resources.

## Site-to-site VPN
Two network gateways establish an encrypted tunnel so hosts in each site can communicate as though a protected logical link exists between the networks.

```text
Site A LAN -- Gateway A ═════ Internet ═════ Gateway B -- Site B LAN
```

## VPN concentrator
A VPN concentrator is a purpose-built or virtualized system that handles many simultaneous VPN sessions, including authentication, tunnel setup, encryption/decryption and policy enforcement.

## Full tunnel vs split tunnel

- **Full tunnel:** the client's general traffic is sent through the organization's VPN/security stack.
- **Split tunnel:** only traffic destined for selected corporate networks uses the VPN; other traffic uses the local Internet path.

Split tunneling can reduce centralized bandwidth use but changes the inspection and traffic-control boundary.

## Clientless / browser-based VPN
A clientless remote-access portal can expose selected internal applications through a web browser. It is often useful when a full network tunnel is unnecessary. Modern deployments may use application-specific zero-trust access instead of extending an entire Layer-3 network to the user.

## Remote-access mechanisms

- **SSH:** secure CLI access over TCP 22.
- **RDP:** Windows remote desktop; commonly TCP/UDP 3389.
- **VNC:** remote framebuffer protocol; security depends on transport and deployment.
- **Console access:** local physical/serial/USB management path that can work when network connectivity is unavailable.
- **Jump box/bastion host:** hardened intermediate system used to reach protected management interfaces.
- **In-band management:** management travels across the normal production network.
- **Out-of-band management:** management uses a separate physical/logical management path.

## Security principles for remote access
Use strong authentication, MFA where possible, device posture checks when appropriate, least privilege, restricted management networks, logging, encryption, session timeouts and regular credential/key rotation.

## Remote-access VPN
```mermaid
flowchart LR
A[Remote client] --> B[VPN gateway]
B --> C[Identity / MFA / policy]
C --> D[Internal resource]
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [IETF RFC 4301 — IPsec Architecture](https://www.rfc-editor.org/rfc/rfc4301)
- [IETF RFC 7296 — IKEv2](https://www.rfc-editor.org/rfc/rfc7296)
- [NIST SP 800-207 — Zero Trust Architecture](https://csrc.nist.gov/pubs/sp/800/207/final)
