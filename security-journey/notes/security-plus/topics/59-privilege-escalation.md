# Privilege Escalation

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 112
# Privilege Escalation
- Gain high level access
  - exploit any vuln
- Check access capabilities
- High-priority vul not patched
- Horizontal privilege escalation
  - lower vs same-level-user & access??

## Prevention
- Quick patch
- AVD
- Data Execution Prevention
  - only data is exec area on RAM
- Address space layout randomization
  - E.g. prevent attacker guessing at a known memory addr

Example: **CVE: 2023-29336**
- Windows elevation of privilege
- reach highest level access (highest)
