# Sep 15 — SQL Injection Payload Explained

**Path:** CompTIA Security+ (SY0-701) / Application Attacks / Injection  
**Date:** 2026-09-15  
**Category:** SQL Injection

## Objective
Explain the payload `' OR 1=1 --` in my own words and connect it to SQL injection.

## Tools used
- Web application / SQL injection lab
- SQL-aware testing environment

## Methodology
The payload:

```sql
' OR 1=1 --
```

In my own words:

- The first `'` attempts to close the application's existing string value in the SQL statement.
- `OR 1=1` adds a condition that is always true.
- `--` starts a SQL comment in many SQL dialects, which can cause the remainder of the original query to be ignored.

The basic idea is to change the meaning of the application's intended SQL query so that the attacker-controlled input affects the query logic rather than being treated only as ordinary data.

This is an **injection attack** caused by unsafe handling of application input. Parameterized queries / prepared statements are a standard defensive approach because user input is treated as data rather than executable SQL syntax.

```text
Payload: ' OR 1=1 --
Purpose: demonstrate how crafted input can alter SQL query logic.
```

## Detection angle (SOC-relevant)
Relevant telemetry can include unusual database query patterns, repeated authentication failures followed by unexpected successful responses, anomalous application requests, web-application firewall alerts, and database errors associated with suspicious input.

## Key takeaway
SQL injection happens when untrusted input is allowed to influence SQL syntax. The payload above works by attempting to terminate the original string, add an always-true condition, and comment out the remaining query.
