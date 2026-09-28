# Authentication & Authorization

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 7
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

### Page 8
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
