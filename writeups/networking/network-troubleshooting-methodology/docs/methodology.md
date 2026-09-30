# Network Troubleshooting Methodology

## Overview

Troubleshooting is a structured process for identifying the cause of a problem, testing explanations, safely applying a fix, verifying the result, and recording what was learned.

Mental model:

> **Identify → Hypothesize → Test → Evaluate → Plan → Implement → Verify → Document**

The process is iterative. When a theory is disproved, return to theory generation instead of forcing the original explanation to fit the evidence.

## 1. Identify the problem

Collect:

- Device/host involved
- User(s) affected
- Time the issue began
- Exact symptoms
- Error messages
- Frequency and reproducibility
- Network location
- Recent maintenance or changes

Ask:

- Can another device reproduce it?
- Can the same user reproduce it?
- Does it happen on another network?
- Does it happen every time or intermittently?
- **What has changed since it was working?**

Separate symptoms from causes.

Example:

```text
Symptom:
    "Website does not open."

Possible causes:
    DNS failure
    Routing failure
    Firewall block
    Application outage
    TLS/certificate issue
    Local browser problem
```

## 2. Establish a theory

Create a probable-cause theory.

Start with obvious, high-probability causes. Use the OSI model as a checklist and apply top-down, bottom-up, or divide-and-conquer reasoning depending on the evidence.

## 3. Test the theory

Use:

- Controlled tests
- Minimal changes
- Comparison with a known-good system
- Logs
- Configuration inspection
- Connectivity tests
- Packet captures where appropriate
- Service/application tests

When practical, change one meaningful variable at a time.

## 4. Evaluate the result

Ask:

> **Does the evidence support the theory?**

If no, return to theory generation. If yes, move to planning.

## 5. Establish a plan of action

Before changing a system:

- Record the current state.
- Identify affected users/services.
- Estimate impact.
- Choose the smallest safe change.
- Back up configuration where appropriate.
- Define rollback.
- Decide how success will be measured.

## 6. Implement the plan

Apply the selected fix and record what changed and when. Escalate when the issue is outside the support boundary or requires specialist/vendor involvement.

## 7. Verify full system functionality

A fix is not complete merely because one symptom disappeared.

Test:

- Original failure condition
- Related functionality
- Relevant user workflows
- Relevant test cases
- Connectivity
- Performance where applicable
- Dependent services

## 8. Document findings

Record:

- Original symptoms
- Scope
- Timeline
- Evidence collected
- Theories considered
- Tests performed
- Results
- Root/probable cause
- Changes made
- Rollback information
- Verification performed
- Final outcome

Documentation is useful for future troubleshooting, forensics, and creating/updating a formal knowledge base.
