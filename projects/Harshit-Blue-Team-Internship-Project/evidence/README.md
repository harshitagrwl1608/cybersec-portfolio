# Evidence inventory

Use [../docs/EVIDENCE_REGISTER.md](../docs/EVIDENCE_REGISTER.md) for the full evidence-to-finding mapping and packet references.

- [report/blue_team_assessment_report.pdf](report/blue_team_assessment_report.pdf) - original submitted assessment report. The expanded Markdown analysis in ../docs is newer; this PDF has not been regenerated in the documentation update.
- [capture/testasp_training_capture.pcapng](capture/testasp_training_capture.pcapng) - 68-packet browser capture for login, manual path checks, and search probes.
- [screenshots/](screenshots/) - browser, Wireshark, Gobuster, and SQLMap screenshots supplied for the report.

The packet capture and Wireshark screenshot contain the deliberately invalid dummy form values used for the test. They are not production credentials. Gobuster and SQLMap sessions are represented by their own terminal screenshots; they are not included in the 68-packet capture. No server logs or live SIEM alerts were collected.

Before publishing, review screenshots and the capture for any newly visible secrets or personal data. The screenshots in this package are included as evidence, not reconstructed graphics.
