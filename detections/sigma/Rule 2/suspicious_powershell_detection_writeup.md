# Sigma Rule #2 — Suspicious PowerShell Command Execution

For October 2, I worked on my second Sigma rule. This time, instead of looking for repeated authentication failures like the previous rule, I wanted to detect a suspicious process execution.

The idea I went with was **PowerShell being launched with an encoded command**.

Encoding does not automatically mean that something is malicious. Administrators and legitimate tools can use encoded PowerShell commands too. The reason it is interesting from a detection point of view is that encoding can hide the actual command from a quick inspection. This can make suspicious commands harder to recognize and can sometimes help bypass simple rules that look for specific command strings.
We can fine tune the rule to ignore positives based on who is executing the command i.e ignore in case there is a administrator or a automated script etc or the input command could be decoded and validated before being executed.

## The Rule

The rule looks for Windows Security process-creation events (`EventID 4688`)
EventID 4688 is a Windows process creation event. The rule then checks whether the newly created process is PowerShell and whether its command line contains an encoded-command argument.
The rule first checks whether the newly created process is PowerShell (`powershell.exe` or `pwsh.exe`). It then checks whether the command line contains `-enc` or `-encodedcommand`.

Both conditions have to match for the rule to generate an alert.

The rule is set to **medium severity** because an encoded PowerShell command is suspicious, but it is not proof of malicious activity by itself.

The actual YAML rule I wrote is the uploaded `Suspicious PowerShell - Encoded Command` rule.

## How the Detection Works

The process part of the rule uses:

    EventID: 4688

and checks the `NewProcessName` field for:

    \powershell.exe
    \pwsh.exe

The second selection looks at the command line for:

    -enc
    -encodedcommand

The final condition is:

    selection_process and selection_encoded

So, in simple terms:

    New process created
            ↓
       Is it PowerShell?
            ↓
    Does it use an encoded command?
            ↓
          ALERT

The Windows Security log source and these process fields are defined directly in the rule.

## Manual Walkthrough

I tested the logic manually using a few sample events.

### Sample 1 — Normal PowerShell

```text
EventID: 4688
NewProcessName: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
CommandLine: powershell.exe Get-Process
```

The event is `4688`, so it is a process-creation event.

The process is PowerShell, so `selection_process` matches.

However, the command line does not contain `-enc` or `-encodedcommand`.

**Result: No alert.**

This is important because the rule should not alert every time someone legitimately uses PowerShell.

---

### Sample 2 — Encoded PowerShell

```text
EventID: 4688
NewProcessName: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
CommandLine: powershell.exe -enc SQBFAFgA...
```

Again, the event is `4688`.

The process is PowerShell, so the first selection matches.

This time the command line also contains `-enc`, so `selection_encoded` matches too.

Both selections are therefore true.

**Result: Alert.**

This is the main behaviour the rule is designed to detect.

---

### Sample 3 — Encoded argument, but not PowerShell

```text
EventID: 4688
NewProcessName: C:\Windows\System32\cmd.exe
CommandLine: cmd.exe -enc something
```

The event is still `4688`, and the command line contains `-enc`.

But the newly created process is `cmd.exe`, not PowerShell.

Therefore `selection_process` does not match.

**Result: No alert.**

This shows why the rule requires both conditions instead of simply searching for the string `-enc`.

## Why I Chose This Detection

I did not want to make the rule simply detect every PowerShell process because PowerShell itself is a legitimate Windows administration tool.

The interesting behaviour is the combination of:

**PowerShell + encoded command**

An encoded command can make the underlying PowerShell instructions less obvious during an initial investigation. At the same time, I kept the severity at medium because legitimate administrators, security tools, and deployment systems can also use encoded commands.

The rule therefore works better as a **suspicious activity signal that an analyst can investigate**, rather than as proof that an attack occurred.

## False Positives

There are several legitimate situations that could trigger this rule. The rule itself lists administrators using encoded commands for automation, security or management tools using encoded PowerShell scripts, and automated deployment scripts as possible false positives.

That means an alert should be investigated in context instead of being treated as automatically malicious.

## What I Learned

The main thing I learned from this rule is that a good detection does not necessarily look for something that is directly malicious. It can look for behaviour that is **unusual or worth investigating**, in simple words - a anomaly.

I also understood why conditions are important. Searching only for `powershell.exe` would generate a lot of normal activity, while searching only for `-enc` could match unrelated processes. Combining the two makes the detection more focused.

For this rule, the logic is:

> **Detect PowerShell process creation when the command line contains an encoded-command argument.**

This gave me a practical example of using multiple selections and combining them with a Sigma condition.
