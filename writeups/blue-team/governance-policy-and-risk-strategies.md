# Security Governance Practice - Policy, Standard, Procedure and Risk Strategies

**Path:** Security+ SY0-701, Domain 5 (5.1 to 5.3)
**Date:** 2026-10-14
**Category:** GRC / Governance and Risk

## Objective
Tell policy, standard and procedure apart with one real example, and give an example of each of the four risk strategies, including how to pick between them using numbers.

## Tools used
None. This one is conceptual, based on Messer's Domain 5 videos.

## Methodology
For policy vs standard vs procedure, the easiest way I found to keep them straight was following one requirement down through all three. I used authentication.

- Policy: "All access to company systems must be protected by strong authentication." Says what and why, written by management, rarely changes.
- Standard: "Passwords are at least 14 characters, no reuse of the last 10, MFA required for all remote access and every admin account, using an authenticator app or hardware key, not SMS." Same requirement but now it's specific and measurable.
- Procedure: how to enrol a new employee in MFA. Helpdesk creates the account, the user signs in for the first time, gets prompted to set up an authenticator app, scans the QR code, types in the six digit code, saves the recovery codes in the password manager, and helpdesk marks it done in the ticket. Step by step, written by the people who do the task.

Guidelines sit next to these but they're optional advice, like "use a passphrase of four random words". An auditor goes top down: is the procedure being followed, does it meet the standard, does the standard satisfy the policy.

Risk strategies, each with an everyday example and a security one:

- Accept: live with it because fixing it costs more than the loss. Everyday: not buying a protection plan for a cheap second hand phone. Security: leaving an old unpatched lab server on an isolated VLAN with nothing sensitive on it, with a named owner signing off and a review date.
- Avoid: stop doing the thing that creates the risk. Everyday: not swimming in a river with a strong current. Security: shutting down a legacy FTP service, or not collecting personal data the business doesn't need in the first place.
- Transfer: push the financial hit onto someone else. Everyday: health or motor insurance. Security: cyber insurance, or letting a payment gateway handle card payments.
- Mitigate: reduce the likelihood or the impact. Everyday: seatbelt and helmet. Security: MFA, patching, segmentation, backups, EDR.

Two things that are easy to get wrong. Transfer doesn't move accountability: insurance pays money, it doesn't cover your reputation, and if you own the data you're still answerable for it even when a vendor caused the breach. And mitigation never gets you to zero. What's left is residual risk, which then gets accepted or partly transferred, so in real life you mix strategies.

To choose between them you can put numbers on it:
```
SLE = cost of one incident
ARO = how many times a year it happens
ALE = SLE x ARO
```
Example: a web server outage costs 50,000 rupees each time and happens about twice a year.
```
ALE now   = 50,000 x 2   = 1,00,000 per year
A failover setup costs 30,000 a year and cuts ARO to 0.5
ALE after = 50,000 x 0.5 = 25,000 per year
```
That removes 75,000 of expected loss a year for a 30,000 cost, so mitigating is worth it. If the same control cost 90,000 a year the answer flips and accepting or insuring makes more sense. Basically: compare what the control costs with how much loss it takes away.

## Detection angle (SOC-relevant)
Most of this turns into detections fairly directly. If the standard says admins need MFA, an admin login with no MFA claim in the identity provider logs is an alert. If it sets lockout rules, repeated failures and lockout events are alerts. If the policy says no shared accounts, one account logging in from two far apart places at the same time is an alert. The procedures are basically the SOC's runbooks, the same playbook vs runbook split as in the incident response writeup.

Risk choices matter for alert handling too. If a risk was accepted, alerts from that asset should be tagged as accepted risk with the review date, not quietly suppressed. Suppressing them silently takes a documented decision and turns it into a blind spot. And transferring risk to a cloud provider or an MSSP doesn't remove the need for your own logs, you still have to be able to say what happened to your data.

## Key takeaway
Policy is what and why, standard is how well, procedure is how. Picking a risk strategy is a cost vs impact call that the business owns and security supplies the numbers for, and transferring a risk never fully transfers the responsibility.
