# IAM & Access Control

## Identity lifecycle
**Approved request → identity proofing → provision account/role → authenticate → authorize → review → deprovision.**

Provisioning creates accounts/permissions. Deprovisioning promptly disables access when a person leaves or no longer needs it. Revoke tokens, certificates, sessions, and device access where applicable; retain audit records per policy.

## AAA
**Authentication → Authorization → Accounting**

Authentication = identity.  
Authorization = permissions.  
Accounting = activity/audit trail.

## Authentication factors
- **Know:** password/PIN.
- **Have:** token/security key.
- **Are:** biometric.
- **Somewhere / behavior:** context signals that can inform risk decisions; not automatically a distinct factor in every framework.

**MFA:** use at least two different factor categories; two passwords are not MFA. Passkeys/FIDO2 security keys can provide phishing-resistant authentication when correctly implemented.

## Access-control models
| Model | Key idea |
|---|---|
| DAC | Owner decides |
| MAC | Centrally enforced labels/classification |
| RBAC | Permissions by role |
| ABAC | Policies using attributes/context |
| Rule-based | Explicit system-defined rules/conditions |

## Least privilege & privileged access
Only the permissions necessary, for only as long as necessary.  
PAM = manage/control privileged accounts and sessions.  
JIT/JEA = temporary / limited privileged access.

## Federation / SSO protocols
- **SSO:** one authentication session can access multiple trusted applications; each app still applies authorization.
- **SAML:** signed assertions commonly used for enterprise browser SSO.
- **OAuth 2.0:** delegated authorization; not an authentication protocol by itself.
- **OpenID Connect (OIDC):** identity/authentication layer built on OAuth 2.0.
- **Federation:** trusted identity relationship across domains/organizations; validate issuer, audience, signature, expiry and claims.

## Directories and Kerberos
LDAP = query/update directory information. X.500 = directory information model/tree.  
Kerberos = ticket-based authentication, common in Active Directory. KDC = AS + TGS.

## Access controls
ACL = rules deciding access.  
NAC = controls network admission.  
Conditional access = uses context such as user/device/location/risk.