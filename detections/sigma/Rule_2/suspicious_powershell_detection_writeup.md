# Sigma Rule #2 — Suspicious PowerShell (Encoded Command)

My second Sigma rule. Instead of repeated authentication failures, this one
detects a suspicious **process execution**: PowerShell launched with an
**encoded command**.

Encoding is not automatically malicious — administrators and legitimate tools
use it too. It is interesting for detection because it hides the real command
from a quick look and can slip past simple rules that match specific command
strings.

ATT&CK mapping: Execution — PowerShell (T1059.001), Defense Evasion —
Obfuscated Files or Information (T1027).

## The Rule

The rule matches **process-creation** events and requires both:

1. `Image` ends with `\powershell.exe` or `\pwsh.exe`
2. `CommandLine` contains PowerShell's encoded-command flag

```text
New process created
        ↓
Is it powershell.exe / pwsh.exe?
        ↓
Does the command line use the encoded-command flag?
        ↓
      ALERT
```

Severity is **medium**: an encoded command is suspicious but not proof of
malicious activity.

### Log source requirement

The rule uses the generic `process_creation` category. It needs a source that
records the **command line**:

- Sysmon EventID 1, or
- Windows Security EventID 4688 **with** "Include command line in process
  creation events" enabled. This is **off by default**, so on a default Windows
  install the rule would never see the command line.

### Matching the flag correctly

PowerShell accepts any unambiguous prefix of `-EncodedCommand`: `-e`, `-ec`,
`-en`, `-enc`, and so on (and `/` instead of `-`). My first version only
matched ` -enc ` and ` -encodedcommand `, which missed `-e` and `-ec` entirely.
The current rule uses a regex that accepts every valid prefix, and requires a
space, `:` or end-of-line afterwards so that cmdlet parameters such as
`-Encoding` do not match.

## Manual Walkthrough

Sample events checked by hand (and run against the regex to confirm):

| # | Command line | Result | Why |
|---|---|---|---|
| 1 | `powershell.exe Get-Process` | No alert | PowerShell, but no encoded flag |
| 2 | `powershell.exe -enc SQBFAFgA...` | **Alert** | PowerShell + encoded flag |
| 3 | `cmd.exe -enc something` | No alert | Flag present, but process is `cmd.exe` |
| 4 | `powershell.exe -ec SQBFAFgA...` | **Alert** | Abbreviation (missed by my first version) |
| 5 | `powershell.exe -e SQBFAFgA...` | **Alert** | Shortest abbreviation |
| 6 | `powershell.exe -nop -enc` (end of line) | **Alert** | End-of-line handled |
| 7 | `powershell.exe -Command "Get-Content x -Encoding UTF8"` | No alert | `-Encoding` is not the encoded-command flag |
| 8 | `powershell.exe -ep bypass -File run.ps1` | No alert | `-ep` is ExecutionPolicy, not an encoded flag |

Samples 1 and 3 show why both conditions are required: PowerShell alone is
everyday admin activity, and `-enc` alone can appear in unrelated processes.

## Limitations

- **Unicode dashes.** PowerShell also accepts en/em dashes in place of `-`; the
  rule does not match those.
- **Other obfuscation.** Concatenated strings, `-ep bypass` with a script file,
  or downloading a payload do not use `-EncodedCommand` and are not covered.
- **Command line must be logged** (see above) or the rule is blind.
- **Renamed binaries.** Matching on `Image` misses a copy of PowerShell renamed
  to something else; the `OriginalFileName` field would catch that (Sysmon).

## False Positives

Administrators using encoded commands for automation, security or management
tools, and deployment scripts can all trigger it. An alert should be
investigated in context, for example by decoding the Base64 payload and checking
the parent process and user, rather than treated as automatically malicious.

## What I Learned

A good detection does not have to look for something directly malicious; it can
flag behavior that is unusual and worth investigating. Writing this rule also
taught me to check a rule against the **tool's real behavior** (PowerShell's
accepted abbreviations, default audit settings) rather than only against the
examples I first thought of.

> **Detect PowerShell process creation when the command line contains an
> encoded-command argument.**
