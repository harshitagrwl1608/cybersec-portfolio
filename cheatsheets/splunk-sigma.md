# Splunk & Sigma Quick Reference

## Sigma vs. SPL
**Sigma** describes log-detection logic in a vendor-agnostic YAML format. **SPL** is Splunk's Search Processing Language. Conversion does not guarantee detection: log sources, fields, time semantics, and backend support still matter.

## Rule fields to recognize
- `logsource`: required telemetry (product, service, or category).
- `detection`: named selections plus a `condition`.
- `falsepositives`: expected benign matches.
- `level` / `status`: severity / maturity.
- `tags`: classifications such as MITRE ATT&CK mappings.

## YAML → Splunk SPL
From the repository root, create an isolated Python environment and install the tools:

```bash
python3 -m venv .venv-sigma
source .venv-sigma/bin/activate
python -m pip install --upgrade pip
python -m pip install sigma-cli
sigma plugin install splunk
```

Convert a rule:

```bash
sigma convert --target splunk --pipeline splunk_windows -o output.spl rule.yml
```

Keep referenced building-block/correlation rules together when required. Inspect the generated query and validate that its field names and source mappings match the actual Splunk data. A hand-written query used for synthetic fixtures is **not automatically the same** as Sigma CLI output.

## Two repo detection patterns
- **Windows brute-force:** Event ID `4625`; group by `TargetUserName` + `IpAddress`; threshold is **5 or more failures in 2 minutes**. Machine accounts ending in `$` and empty/loopback sources are excluded. False positives include mistyped passwords and stale service credentials.
- **Encoded PowerShell:** process creation where `Image` ends with `powershell.exe` or `pwsh.exe`, and `CommandLine` contains `-EncodedCommand` or an accepted abbreviation such as `-e`, `-ec`, or `-enc`. It is a review signal—not proof of malware.

## Useful Windows telemetry
- Security `4625` = failed logon; `4624` = successful logon; `4688` = process creation.
- Sysmon `Event ID 1` = process creation. Security `4688` needs command-line auditing enabled to provide the command line.

## Test before relying on a rule
1. Confirm events are being collected and parsed.
2. Validate YAML and run the converter.
3. Check field mappings and the selected index/sourcetype.
4. Test positive **and** benign/negative cases.
5. Tune threshold and false positives; record limitations.
6. Test with representative telemetry before calling it production-ready.

**Window caveat:** SPL using `bin _time span=2m` uses fixed two-minute buckets; a burst crossing a bucket boundary can be missed even when its events are within 120 seconds. A rolling-window design needs different logic.

## Current portfolio status
The two Windows rules are **experimental**. The writeups describe synthetic-fixture testing and Sigma conversion checks, **not validation against live Windows telemetry**. Rule 2's fixture query reports 3 positive and 4 negative cases; Rule 1's walkthrough observed its positive case, while negative-case evidence should be recorded separately.

## Source files
- [Sigma rules and walkthroughs — Rule 1](../detections/sigma/Rule_1/)
- [Sigma rules and walkthroughs — Rule 2](../detections/sigma/Rule_2/)
- [Sigma CLI → Splunk writeup](../detections/sigma/Rule_1/windows_brute_force_detection_writeup_with_splunk.md)
- [Encoded PowerShell Splunk writeup](../detections/sigma/Rule_2/suspicious_powershell_detection_writeup_with_splunk.md)