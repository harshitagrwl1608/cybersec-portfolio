# Windows Brute Force Detection — Sigma Rule

I wrote this Sigma rule to detect a possible brute-force login attempt on Windows.
The idea is simple: first identify failed Windows logons, then look for repeated
failures from the same source IP against the same user in a short period of time.

The rule uses Windows Security logs and looks for `EventID: 4625`, the event
Windows generates by default for a failed logon. I exclude machine accounts
(usernames ending in `$`) and empty/loopback source addresses (`-`, `::1`,
`127.0.0.1`) so the detection focuses on useful authentication activity.

The rule file contains two parts:

1. **`windows_failed_logon`** — the building block. It matches a single failed
   logon. It is informational only; one failed logon is normal.
2. **The correlation rule** — takes those events, groups them by `TargetUserName`
   and `IpAddress`, and raises a **high-severity** alert when a group has
   **at least 5 failures within 2 minutes**.

ATT&CK mapping: Credential Access — Brute Force (T1110, T1110.001 Password Guessing).

## Walking through some sample logs

I checked the logic by hand against a few made-up events. This is a **manual
walkthrough on sample events**, not a test against real telemetry.

### Sample 1 — a normal failed login

```text
Time: 10:01:10
EventID: 4625
TargetUserName: alice
IpAddress: 192.168.1.50
```

The event ID is `4625`, the username does not end in `$`, and the source IP is
not `-`, `::1` or `127.0.0.1`, so it becomes a `windows_failed_logon` event.

It is only **one** failure, and the correlation needs 5 in 2 minutes.
**Result: no alert.**

### Sample 2 — repeated failures from the same source

```text
10:01:10  4625  alice  192.168.1.50
10:01:24  4625  alice  192.168.1.50
10:01:41  4625  alice  192.168.1.50
10:02:03  4625  alice  192.168.1.50
10:02:18  4625  alice  192.168.1.50
```

All five match the base rule and share the same `TargetUserName` and
`IpAddress`, so they fall in one correlation group. The first event is at
10:01:10 and the fifth at 10:02:18 — 68 seconds, inside the 2-minute window.

**Result (sliding-window reading): high-severity alert.**
See the window caveat below — this depends on the backend.

### Sample 3 — failures split between different IPs

```text
10:05:10  4625  alice  192.168.1.50
10:05:20  4625  alice  192.168.1.50
10:05:35  4625  alice  192.168.1.50
10:05:40  4625  alice  192.168.1.75
10:05:55  4625  alice  192.168.1.75
```

Grouped by user + IP: `alice + .50` → 3, `alice + .75` → 2. Neither reaches 5.
**Result: no alert.** This also shows how the rule can be dodged — an attacker
rotating source IPs stays under the per-IP count.

### Sample 4 — filters (machine account and empty source)

```text
10:20:01  4625  WS01$   192.168.1.60     <- machine account
10:20:03  4625  bob     -                <- empty source
10:20:05  4625  bob     127.0.0.1        <- loopback
```

None of these become `windows_failed_logon` events, so they never reach the
correlation. **Result: no alert**, no matter how many repeat.

### Sample 5 — boundary and slow cases

```text
Four failures in 90 seconds, same user + IP          -> 4 < 5, no alert
Five failures spread over 4 minutes, same user + IP  -> never 5 inside 2 min, no alert
```

## Limitations

- **Window semantics are backend-defined.** When I converted the rule to Splunk
  with `sigma-cli`, it produced `bin _time span=2m | stats count by ...`. That
  uses **fixed 2-minute buckets**, not a sliding window. Sample 2's events land
  3 in the 10:00–10:02 bucket and 2 in the 10:02–10:04 bucket, so that query
  would **not** fire on it; the same 68-second burst starting at 10:00:10 would.
  A production version needs a sliding window (for example `streamstats` with a
  time window in Splunk).
- **Password spraying is missed.** One source trying one or two passwords against
  many accounts never reaches 5 for any single user + IP pair.
- **Distributed attempts are missed.** Many source IPs against one account never
  reach 5 for any single IP (Sample 3 is a small version of this).
- **No success correlation.** The strongest signal is failures followed by a
  successful logon (`4624`) from the same source. This rule does not look for it.
- **Threshold is a guess.** 5 failures / 2 minutes should be tuned against the
  environment and its account-lockout policy.

## What I learned

A single failed login is normal. The useful detection comes from the **pattern**:
repeated failures against the same account from the same source in a short time.
The manual walkthrough also showed why `group-by` matters (without it, unrelated
failures get mixed into one alert) and, just as important, where a rule can be
evaded or behave differently depending on the backend.

The rule is `experimental` and can produce false positives: a user repeatedly
typing a wrong password, an application using an old password, or a misconfigured
service. Those cases need analyst investigation and tuning — that is where a SOC
analyst separates true from false positives.
