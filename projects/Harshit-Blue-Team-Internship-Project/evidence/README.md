# Evidence inventory

Use [../docs/EVIDENCE_REGISTER.md](../docs/EVIDENCE_REGISTER.md) for the full evidence-to-finding mapping and packet references.

- [capture/testasp_training_capture.pcapng.gz](capture/testasp_training_capture.pcapng.gz) - 68-packet browser capture, sanitized and gzip-compressed.
- [sqlmap_results_redacted.md](sqlmap_results_redacted.md) - redacted summary of SQLMap test results; original screenshots containing server-issued session metadata are not published.
- [screenshots/](screenshots/) - browser, Wireshark, Gobuster, and XSS screenshots supplied for the report.
- [report/README.md](report/README.md) - explains why the original PDF was withdrawn from the public tree.

The packet capture's repeated ASPSESSIONID value was replaced with a same-length placeholder in all 12 occurrences. TCP checksums were recalculated for the affected packets; the 68-packet count, frame numbering, timestamps, and non-cookie packet bytes were preserved. The login form values remain deliberately invalid dummy values and are not production credentials.

The original PDF assessment report and SQLMap terminal screenshots were removed from the current public tree because they may expose session metadata. The Markdown project documents are the current review record. Earlier commits may still contain original artifacts; a history rewrite is required to purge those old versions completely.
