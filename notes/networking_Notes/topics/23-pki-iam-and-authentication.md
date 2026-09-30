# PKI, IAM, AAA and Authentication Technologies

## Detailed concepts, examples, and edge cases

Security concepts: data in transit crosses the network and needs protection. Data at rest is stored and should be encrypted/access-controlled. PKI includes policies, procedures, hardware, software, people, certificates and key management.

Digital certificate: public-key credential signed by a CA. Web/browser trust chains connect certificates to trusted CAs. Self-signed certificate requires local trust configuration. IAM: manage identities and access so the right person gets the right access at the right time.

Identity lifecycle management, access controls, authentication/authorization, identity governance. Least privilege limits permissions. RBAC assigns access through roles. Geographic restrictions can allow/restrict access based on network/location.

AAA framework: identification (claim identity), authentication (prove identity), authorization (what access is allowed), accounting (record activity). SSO provides one authentication event for multiple assigned services subject to session limits.

RADIUS: common AAA protocol. LDAP: directory protocol; X.500 distinguished names use CN, OU, O, L, ST, C, DC attributes. SAML: security assertion markup language for federated authentication. Notes include examples of directory entries.

X.500 hierarchy: directory information tree with root/container/user branches. SAML flow diagram: resource/service provider, client/browser, authentication server/identity provider exchanging assertions/tokens.

TACACS/TACACS+: centralized access control and remote authentication; TACACS+ is newer. MFA adds additional factor(s). TOTP uses a secret + time-derived code and is often used as an OTP method; synchronization/time drift matters.

## Data in transit vs data at rest

- **Data in transit:** moving across a network or communication channel.
- **Data at rest:** stored on disk, flash, database, backup or other persistent medium.

Security controls differ. Data in transit is commonly protected with TLS, IPsec or SSH; data at rest can use full-disk, volume, database/file encryption plus access control and key management.

## PKI
Public Key Infrastructure is a collection of policies, procedures, hardware/software and trust relationships used to manage public-key identities and digital certificates.

### Certificate authority
A Certificate Authority (CA) digitally signs certificates, binding an identity or domain name to a public key according to the CA's validation policy.

### Certificate chain

```text
Root CA (trusted by OS/browser)
        |
   Intermediate CA
        |
  Server certificate
        |
   Web server identity
```

A client validates the chain, certificate validity dates, name constraints, signatures and other policy requirements before trusting the certificate.

### Self-signed certificate
A certificate signed by its own key is not automatically trusted by clients. It can be appropriate for internal/test environments when the trust anchor is explicitly installed, but it is not equivalent to a publicly trusted CA-issued certificate.

## Web of trust
A web-of-trust model distributes trust among users/peers rather than relying on one hierarchical CA. OpenPGP is a classic example.

## IAM
Identity and Access Management covers identity lifecycle, account provisioning/deprovisioning, authentication, authorization, role/group membership, access reviews and auditing.

## Identity lifecycle

```text
Joiner → identity created → roles assigned → access used
                                  ↓
                           periodic review
                                  ↓
Leaver → account disabled → credentials revoked → resources recovered
```

The most important operational goal is that access follows the user's current role and disappears when it is no longer justified.

## RBAC
RBAC assigns permissions to roles. Users receive roles according to job function. RBAC simplifies administration when many users share common permission sets.

## AAA

1. **Identification:** the subject claims an identity, e.g. username.
2. **Authentication:** the subject proves the identity.
3. **Authorization:** the system decides what actions/resources are permitted.
4. **Accounting/Auditing:** activity and access events are recorded.

## SSO
Single Sign-On allows a user to authenticate to an identity provider and then access multiple integrated services without independently entering a password for every service. Security still depends on strong authentication, token/session handling and service-side authorization.

## RADIUS
RADIUS is a centralized AAA protocol commonly used for network access. Standard ports are UDP 1812 for authentication/authorization and UDP 1813 for accounting.

RADIUS commonly communicates from network access servers such as switches, wireless controllers and VPN gateways to a centralized authentication service.

## LDAP and X.500 naming
LDAP provides directory access. X.500 Distinguished Names identify directory entries using attributes such as:

- `CN` — Common Name
- `OU` — Organizational Unit
- `O` — Organization
- `L` — Locality
- `ST` — State/Province
- `C` — Country
- `DC` — Domain Component

## SAML
Security Assertion Markup Language is used for federated identity. An Identity Provider authenticates the user and issues an assertion that a Service Provider consumes according to trust relationships.

## TACACS+
TACACS+ is commonly used for centralized AAA of network-device administration. It uses TCP port 49 and separates authentication, authorization and accounting more granularly than traditional RADIUS designs.

## MFA
Multi-factor authentication combines at least two different factor categories:

1. something you know;
2. something you have;
3. something you are.

Two passwords are still one factor category.

## TOTP
Time-based One-Time Password uses a shared secret and a moving time counter. A typical authenticator app generates a short-lived numeric code. The exact time step and validation window are protocol/policy choices; many systems use 30-second steps.

## Certificate trust chain
```text
Root CA
  ↓ signs
Intermediate CA
  ↓ signs
Leaf / Server Certificate
  ↓ proves binding
Hostname / service public key
```

## Verification references

The links below document the verification basis for this file and are optional for study.

- [NIST SP 800-207 — Zero Trust Architecture](https://csrc.nist.gov/pubs/sp/800/207/final)
