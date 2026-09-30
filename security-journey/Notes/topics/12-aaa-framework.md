# AAA Framework

## Overview
AAA stands for Authentication, Authorization, and Accounting. The three steps answer different questions: who are you, what are you allowed to do, and what did you do?

## Core concepts
- Authentication verifies identity.
- Authorization determines permitted actions/resources after identity is established.
- Accounting records activity for auditing, billing, or investigation.
- AAA can be implemented locally or through centralized services such as RADIUS/TACACS+ depending on the environment.

## Practical examples
- A VPN may authenticate a user with MFA, authorize access to a specific network, and log session start/stop and resource use.

## Security / mitigation
- Apply least privilege and separation of duties.
- Centralize logs where possible and protect them from tampering.
- Review privileged access regularly.

## Detection / troubleshooting
- Useful evidence includes login success/failure, authorization denials, privilege changes, session duration, and administrative actions.

## Detailed notes captured from the notebook
# AAA Framework

# Authentication, Authorization and Accounting

## AAA Framework
1. **Identification**
   - Who are you?
   - Username
2. **Authentication**
   - Prove who you say you are
   - Password / other methods
3. **Authorization**
   - What access do you have
4. **Accounting**
   - Resources used
   - What, when logs

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
