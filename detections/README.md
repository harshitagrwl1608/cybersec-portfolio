# Detection Content

Detection rules are separated by technology.

## Sigma

Technology-agnostic detection logic intended for conversion into a SIEM/query language.

| Rule | Detects | Log source | ATT&CK | Status |
|---|---|---|---|---|
| [Windows brute force](sigma/Rule_1/windows_brute_force_detection_writeup.md) | 5+ failed logons for the same user + source IP within 2 minutes (EventID 4625) | Windows Security | T1110 | Experimental, manual walkthrough |
| [Encoded PowerShell](sigma/Rule_2/suspicious_powershell_detection_writeup.md) | PowerShell started with `-EncodedCommand` or any abbreviation | Process creation with command line (Sysmon 1 / Security 4688) | T1059.001, T1027 | Experimental, manual walkthrough |
| [SSH connection](sigma/ssh-connection-detected.yml) | Inbound TCP to port 22 (visibility baseline) | Network | T1021.004 | Experimental |

Both Windows rules were validated with `sigma-cli` (parse/lint) and converted to Splunk to
inspect the generated query. They have **not** been run against real telemetry.

## Snort

Packet/network detection rules for Snort.

## Testing standard

A rule should not be described as "tested" unless the test was actually run against
representative telemetry and the observed result is documented. "Manual walkthrough"
means hand-made sample events were traced through the rule logic.
