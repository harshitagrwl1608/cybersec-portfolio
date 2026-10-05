# Network Troubleshooting

## Method
**Identify → Theory → Test → Evaluate → Plan → Implement → Verify → Document**

## Identify
What is broken? Who/what is affected? When did it start? What changed? Can it be reproduced?

## Local checks
```bash
ip a
ip route
ss -tulpn
ping <host>
traceroute <host>
dig <domain>
```

Windows: `ipconfig /all` · `ping` · `tracert` · `nslookup` · `netstat -ano`

## OSI troubleshooting cue
Physical/link → IP/routing → transport/ports → DNS/application → authentication/policy.

## Test discipline
Use the smallest useful test. Record the original state. Change one thing at a time. Define success/rollback before implementation.

## Verify
Reproduce the original test, confirm the user's workflow, check for side effects, then document cause + fix + evidence.

**Golden rule:** diagnose from evidence; do not make unrelated changes.