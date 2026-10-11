# Compliance Practice - India's DPDP Act, 2023

**Path:** Security+ SY0-701, Domain 5 (5.4 Compliance)
**Date:** 2026-10-15
**Category:** GRC / Compliance and Privacy

## Objective
Pick one compliance framework that matters in India, say what it requires in two sentences, and work out what a SOC has to do to support it. I went with the DPDP Act because it covers almost any organisation handling Indian residents' personal data, which includes most places I'd apply to for an internship.

## Tools used
Just the sources: the DPDP Act 2023 and the DPDP Rules 2025 from MeitY. No technical tools.

## Methodology
The two sentences:

> The DPDP Act requires organisations that decide why and how personal data is processed (Data Fiduciaries) to collect it only with clear notice and consent for a stated purpose, protect it with reasonable security safeguards, and respect people's rights to access, correct and erase it. It also requires them to report every personal data breach, to affected people without delay and to the Data Protection Board within 72 hours, with penalties up to ₹200 crore for not notifying and up to ₹250 crore for not keeping reasonable safeguards.

The terms, because DPDP uses its own words for things Security+ already has names for:
- Data Principal: the individual, what Security+ calls the data subject
- Data Fiduciary: decides the purpose and means of processing, so the data controller
- Data Processor: processes data for a fiduciary, same as in Security+
- Significant Data Fiduciary: a fiduciary the government notifies as higher risk, with extra duties like a Data Protection Officer in India plus annual audits and impact assessments
- Consent Manager: a registered entity that lets people give, manage and withdraw consent
- Data Protection Board of India: the regulator that takes breach reports and issues penalties

The fiduciary stays accountable even if a processor causes the problem, which is the same "transfer doesn't transfer accountability" point from the risk strategies writeup.

What it asks for, from a security point of view:
- Notice and consent, with an easy way to withdraw it
- Use data only for the stated purpose and delete it once that purpose is done
- Reasonable security safeguards (Section 8(5), Rule 6): encryption or masking, access control, logging and monitoring, backups, and keeping logs for a year to help detect and investigate breaches
- Breach notification (Section 8(6), Rule 7): every personal data breach, no minimum size. Affected people are told without delay and the Board gets an initial notice and then full details within 72 hours (can be extended on request)
- Children's data: verifiable parental consent, no tracking or targeted ads aimed at children
- Rights for individuals: access, correction, erasure, grievance redressal

One thing I noticed is that DPDP treats all personal data the same. There's no "sensitive data" tier with stricter rules, which is different from the data classification levels in Domain 3.

Timeline:
```
Aug 2023   Act passed
Nov 2025   Rules notified, Data Protection Board set up
Nov 2026   Consent Manager registration starts
May 2027   Main obligations enforceable (notice, consent, safeguards,
           breach notification, children's data, SDF duties)
```
The main obligations aren't enforceable yet. The 18 month gap is the time to get ready, and the first step is simply knowing which systems hold personal data.

Penalties (maximums, from the Act's Schedule): ₹250 crore for failing to take reasonable safeguards, ₹200 crore for failing to notify a breach, ₹200 crore for children's data violations, ₹150 crore for Significant Data Fiduciary duties, ₹50 crore for anything else. They're per instance, and one incident can trigger both the safeguards penalty and the notification penalty.

Also worth remembering that DPDP doesn't replace CERT-In's incident reporting directions, which have their own and much shorter deadline. An Indian SOC can owe reports to both.

## Detection angle (SOC-relevant)
The 72 hour clock makes detection speed a legal issue. For a SOC that means a few things.

First, knowing where personal data lives. An asset inventory that tags which systems hold it, because without that nobody can answer "was personal data affected?" in time. Second, logging access to those systems: database audit logs, object storage access logs (S3 GetObject for example), identity provider and IAM logs.

Then alerting on what usually comes before a reportable breach:
- a service account reading far more rows than its baseline from a customer database
- a big outbound transfer from a data-holding server to a new external IP
- a run of failed logins followed by a success on an admin account (the 4625 then 4624 pattern from the logs writeup)
- bulk exports from an admin console outside normal hours

An alert might read: service account svc-reports read 40x its daily baseline from the customers DB, followed by a 6 GB outbound transfer to an unrecognised IP. That should immediately raise "was this personal data?", because the answer decides whether the 72 hour clock is running.

After that the evidence has to be good enough to write the report. The Board wants nature, extent, timing, cause and mitigation, which is the same timeline work as the digital forensics and incident response writeups. A clean timeline and chain of custody are what make a 72 hour report possible.

## Key takeaway
DPDP turns breach detection into a deadline. Being able to say fast which personal data was touched, when and how is now a compliance requirement, and failing to notify is a separate penalty from the breach itself.
