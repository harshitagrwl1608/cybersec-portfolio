# Authentication & Authorization

## Overview
Authentication establishes who or what a subject is; authorization decides what that authenticated subject may access. Keeping the two concepts separate makes access decisions easier to reason about and audit.

## Core concepts
- Authentication factors commonly include something you know, have, are, somewhere you are, or something you do.
- MFA combines two or more different factor types.
- Authorization should follow least privilege and need-to-know.
- Access-control models include DAC, MAC, RBAC, and ABAC; the choice depends on the environment and policy.

## Practical examples
- A student may authenticate with password + authenticator app but be authorized only to read a particular course system.

## Security / mitigation
- Use MFA for sensitive accounts, short-lived sessions/tokens, role-based access, and regular access reviews.

## Detection / troubleshooting
- Monitor impossible travel, repeated failures, privilege elevation, unusual role assignments, and access outside normal patterns.

## Detailed notes captured from the notebook
# Authentication & Authorization

# Authenticating systems
- How to identify whether a system is part of network?
- System can't type a password.
  - Where is a work? It is? [wording unclear in scan]
- Use digitally signed certs
  - Access to VPN from auth. devices
  - Manag[e] software can validate

## Certificate authentication
- Needs a trusted CA
- Certificate for any system signed by that CA
- Use that for auth.

# Authorization Models
- User auth.
  - Know what access they have
  - Time to apply an auth model
- Scalable for multiple many users
  - Put an auth model in the middle
  - Defined by role, org, etc.

## No Auth Model
- Difficult to determine why a user may exist
- Not scalable
- Manual for each user

## Using an auth model
- Create a group with mapped perms
- Scalable

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
