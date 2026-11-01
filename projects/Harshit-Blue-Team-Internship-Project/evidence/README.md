# Evidence inventory

- `report/blue_team_assessment_report.pdf` - final human-readable assessment report.
- `capture/testasp_training_capture.pcapng` - 68-packet browser capture for login, manual path checks, and search probes.
- `screenshots/` - browser, Wireshark, Gobuster, and SQLMap screenshots supplied for the report.

The packet capture and Wireshark screenshot contain the deliberately invalid dummy form values `blue_team_lab_user` and `invalid_test_only_1`. They are not production credentials. The Gobuster and SQLMap sessions are represented by their own terminal screenshots; they are not included in the 68-packet capture. No server logs or live SIEM alerts were collected.

Before publishing, review screenshots for any newly visible secrets or personal data. The screenshots in this package are included as evidence, not reconstructed graphics.
