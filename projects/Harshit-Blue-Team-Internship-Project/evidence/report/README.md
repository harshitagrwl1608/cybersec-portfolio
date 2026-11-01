# Report publication note

The original `blue_team_assessment_report.pdf` has been removed from the current public tree because the report may embed terminal screenshots containing a server-issued ASPSESSIONID value.

The current, reviewed project report is maintained in the Markdown files under `docs/`, especially:

- `docs/EXECUTIVE_SUMMARY.md`
- `docs/FINDINGS.md`
- `docs/EVIDENCE_REGISTER.md`
- `docs/SEVERITY_AND_RISK.md`
- `docs/REMEDIATION.md`
- `docs/METHODOLOGY.md`

A new PDF should be generated from these sanitized materials and checked before publication. Do not restore the original PDF without removing session metadata from embedded images and verifying the result.
