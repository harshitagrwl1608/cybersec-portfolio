# Mini Change Request

**Path:** CompTIA Security+ (SY0-701) / Change Management
**Date:** 2026-09-09
**Category:** Change Management

## Objective
Create a small change request containing what is changing, why it is needed, the rollback plan, and the approver.

## Tools used
- Change request/ticketing system
- Configuration management record

## Methodology
### Change
**What:** Update the home router firmware to the latest vendor-supported version.

### Why
- Apply current security fixes.
- Maintain supported software.
- Reduce exposure to known vulnerabilities.

### Scope / impact
- Router will reboot during the maintenance window.
- Internet connectivity may be unavailable briefly.
- No intentional change to existing firewall policy.

### Rollback plan
1. Export/save the current router configuration before the change.
2. If the update causes a problem, restore the saved configuration.
3. If the vendor supports firmware rollback, return to the previously working supported firmware version.
4. Verify connectivity and firewall behavior after rollback.

### Approver
**Approver:** `ME`

### Validation
After the change, verify Internet access, DNS resolution, Wi-Fi connectivity, firewall rules, and router management access.


## Detection angle (SOC-relevant)
For SOC/operations records, retain the change ticket, approval, timestamps, configuration backup, firmware version before/after, and post-change validation results. Unexpected configuration changes outside an approved window can be an indicator worth investigating.

## Key takeaway
A useful change request records not only the intended change but also why it is needed and how to recover safely.
