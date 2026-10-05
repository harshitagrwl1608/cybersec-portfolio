# IAM & Access Control

## AAA
**Authentication → Authorization → Accounting**

Authentication = identity.  
Authorization = permissions.  
Accounting = activity/audit trail.

## Authentication factors
- **Know:** password/PIN.
- **Have:** token/security key.
- **Are:** biometric.
- **Somewhere:** location.
- **Do:** behavior.

**MFA:** use ≥2 different factor categories; two passwords are not MFA.

## Access-control models
| Model | Key idea |
|---|---|
| DAC | Owner decides |
| MAC | Centrally enforced labels/classification |
| RBAC | Permissions by role |
| ABAC | Policies using attributes/context |
| Rule-based | Explicit rules/conditions |

## Least privilege
Only the permissions necessary, for only as long as necessary.

## Privileged access
PAM = manage/control privileged accounts and sessions.  
JIT/JEA = temporary / limited privileged access.

## Federation / SSO
Federation = trusted identity relationship across services/domains.  
SSO = authenticate once; access multiple authorized applications.

## Kerberos
Ticket-based authentication; strongly associated with Active Directory.  
KDC = AS + TGS.

## Access controls
ACL = rules deciding access.  
NAC = controls network admission.  
Conditional access = uses context such as user/device/location/risk.
