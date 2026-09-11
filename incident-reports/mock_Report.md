# Incident Report: Suspicious After-Hours Login — Unrecognized IP

**Reported by:** Harshit
**Date of incident:** 2026-09-08
**Severity:** Medium
**Status:** Resolved

## Executive Summary
A successful login to user account jdoe@corp.local occurred from an 
unrecognized external IP address outside the user's normal working 
hours, following 3 failed attempts. The account was contained within 
minutes of detection and confirmed compromised. No lateral movement 
was found. Resolved via password reset and MFA re-registration.

## Timeline (UTC)
| Time | Event |
|---|---|
| 03:47 | SIEM alert triggered — failed-login threshold rule (3 failures) |
| 03:49 | Successful authentication logged from same source IP |
| 03:52 | Alert reviewed by analyst, investigation opened |
| 03:58 | Account temporarily disabled pending verification |
| 04:10 | User contacted via known-good channel (phone) |
| 04:15 | User confirmed they did not initiate the login |
| 04:20 | Password reset enforced, MFA re-registered, account re-enabled |

## Indicators of Compromise (IOCs)
- Source IP: 203.0.113.45 (geolocated outside user's normal region)
- Login timestamp outside user's typical active hours (03:xx UTC vs. usual 09:00–18:00 local)
- User-Agent string inconsistent with user's known device fingerprint

## Detection
Flagged by a SIEM alert rule monitoring failed-login thresholds 
(3+ failures followed by a success). Confirmed via manual log review 
cross-referencing source IP geolocation and login time against the 
user's normal baseline.

## Root Cause / Attack Path
Likely credential compromise (exact vector unconfirmed — password 
reuse or phishing suspected but not verified in this mock scenario). 
Attacker authenticated successfully on the 3rd attempt, suggesting 
either a correctly guessed/leaked password or a low-volume brute-force 
attempt that stayed under a stricter lockout threshold.

## Impact
Single user account briefly compromised. No evidence of lateral 
movement, data access, or privilege escalation found in subsequent 
log review. No other accounts or systems affected.

## Remediation & Recovery
- Account disabled immediately upon flagging
- Active session tokens revoked
- Source IP added to watchlist
- Password reset enforced
- MFA re-registered on a verified device
- Account re-enabled after user verification

## Recommendations
- Lower the failed-login threshold before lockout (3 attempts allowed 
  a guess/brute-force to succeed)
- Add geolocation-based conditional access rules to flag or block 
  logins from atypical regions automatically, not just alert
- Enforce MFA account-wide if not already mandatory (would have 
  blocked this regardless of password compromise)

## Appendix
[Placeholder — attach cropped/redacted screenshot of the SIEM alert 
and log entries here once available]

**This is a fictional/mock scenario used as a reusable template.
Real incident reports for THM SOC Level 1 alerts will follow this
same structure.**
