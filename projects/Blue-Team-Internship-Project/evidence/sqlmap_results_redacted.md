# SQLMap results (redacted summary)

This file summarizes the visible results from the original SQLMap terminal evidence. The original screenshots have been removed from the current public repository because the terminal output included a server-issued ASPSESSIONID value. No session-cookie value is reproduced here.

## Command used

```bash
sqlmap -u 'http://testasp.vulnweb.com/showforum.asp?id=0' --dbs --batch --threads=1
```

## Observed results

- Target parameter: GET `id` on `showforum.asp?id=0`.
- SQLMap reported the parameter vulnerable to boolean-based blind SQL injection (WHERE/HAVING clause).
- SQLMap also reported time-based blind SQL injection.
- Back-end DBMS identified by SQLMap: Microsoft SQL Server.
- The terminal output identified Microsoft SQL Server 2014.
- Database names shown in the captured results: `acuforum`, `acuserservice`, `master`, `model`, `msdb`, and `tempdb`.
- The test was stopped at database-name enumeration. No table names or row contents were dumped.

## Evidence and limitations

The above is a redacted transcription of the visible result lines from the original terminal screenshots. The screenshots are intentionally not included in the public repository because they exposed a server-issued session identifier. The packet capture does not contain the SQLMap terminal session, so EV-04 is supported by the preserved result summary rather than a raw terminal image.

The result demonstrates SQLMap's reported injection detection and database-name enumeration against the intentionally vulnerable training application. It does not establish that customer records were viewed, extracted, altered, or compromised.
