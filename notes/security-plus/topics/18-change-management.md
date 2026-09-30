# Change Management

## Overview
Change management is a controlled method for modifying technology while managing risk. A mature process records what will change, why it is needed, impact, testing, approval, timing, implementation, validation, and rollback.

## Core concepts
- Request -> assess -> approve -> schedule -> test -> implement -> verify -> document is a common lifecycle.
- Standard changes are repetitive, low-risk, and pre-approved; normal changes require review; emergency changes follow accelerated but documented procedures.
- A rollback plan defines how to return to the previous working state.
- Separation of duties reduces the risk of a single person approving and implementing a sensitive change without oversight.

## Practical examples
- A firewall-rule change request should name the rule, reason, affected systems, implementation window, test plan, approver, and rollback steps.

## Security / mitigation
- Use maintenance windows, backups, peer review, staged rollout, and post-change validation.
- Close the change only after verifying that the intended behavior and security controls still work.

## Detection / troubleshooting
- Unexpected changes outside approved windows, repeated emergency changes, and changes without matching tickets are useful monitoring signals.

## Detailed notes captured from the notebook
# Change Management

# Change Management
## Change management
1. Idea to make multiple groups / [orders]
2. Track changes
3. Verify commercial and evaluated [wording unclear]
4. Have clear policies
5. Makes it easy to implement without [it] [unclear]

## Change approval process
- A formal process
  - To avoid discrepancies, mistakes
- Includes:
  - Purpose
  - Scope
  - Workstream
  - Affected systems, impact
  - Analyze risk
  - Get approval
  - User acceptance

## Ownership
- They own the process
  - But they don't perform the change
- Owner manages the process
  - process updates
  - ensures process is followed & acceptable

## Stakeholders
- Who are impacted by this change
  - they want input on control
- Requires research on what & who this change will impact

## Impact Analysis
- Determine a risk value
- E.g. fire does not fit but breaks something
- slight risk if there is no change

## Test Results
- Sandbox testing env
- Test if update did work
- Test if before deployment
- Confirm the backup plan

## Backout Plans
- A change will work perfectly in test but may bring down network in production
- A change should always have a way to reverse back
  - Sometimes easy / sometimes not
  - Always have backups

## Maintenance Window
- When is this change happening?
  - During holidays, off hours or overnight
  - After work hours / duration

# Standard Operating Procedures
- Change management is critical
- Process must be well-documented
- Sustainable to do all
- Including changes in SOP over time

# Technical Change Management
- Execution of the plan
- No such thing as a simple update
- Often tech team is concerned with TOB change IT [wording unclear]

## Allow / Deny List
- Security policies for control app execution
- Allow / deny list -> control what is allowed and cleared for execution
- Security concerns

## Restricted Activity
- Scope of change is important
- A change control app is not permitted to make any change
- Very little flexibility unless very imp. or simple change

## Downtime
- There might be some unavailable
- Minimize it -> add hours
- On switch to secondary system make update to primary and switch
  - If everything normal users

## Restarts
- It's common to require a restart
- Depends on system

## Legacy Applications
- App long before you arrived
- No longer supported by developer
- You are now the support team
- No one knows how it works
- EOL!!
- May be quirky
- Requires large documentation

## Dependencies
- To complete A, you need to complete B
- Maybe A can require changes
- Gets complicated

## Documentation
- Challenging to keep up with changes
- So documents continuously tie with a change

## Version control
- Track changes to file/data over time
- Easy revert back
- Many opportunities to manage ver[ion]
- Mostly built in OS
- If not, third-party version managing software

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
