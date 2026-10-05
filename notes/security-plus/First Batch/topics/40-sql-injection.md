# SQL Injection

## Overview
SQL injection occurs when untrusted input changes the structure or meaning of a database query. The risk is greatest when applications construct SQL by concatenating user-controlled input.

## Core concepts
- Attackers may manipulate authentication logic, data retrieval, filtering, or other database operations.
- The primary defense is parameterized queries/prepared statements.
- Additional layers include safe ORM use, allow-list validation for non-parameterizable SQL fragments, least-privilege database accounts, and appropriate monitoring.

## Practical examples
- A classic teaching payload is `' OR 1=1 --`, which attempts to terminate a quoted string, add an always-true condition, and comment out the remainder of a query in dialects where `--` starts a comment.

## Security / mitigation
- Use prepared statements, stored procedures with safe parameter handling, least privilege, secure error handling, and input validation as defense in depth.

## Detection / troubleshooting
- Look for database errors, unusual query patterns, repeated parameter-manipulation attempts, web-application firewall alerts, and anomalous database access.

## Detailed notes captured from the notebook
# SQL Injection

# SQL Injection
## Code injection
- Adding your own info into data stream
- Enabled because of bad programming
- No proper input/output checks
- Types: many
  - e.g. HTML, SQL, XML, LDAP etc.

## 1. SQL injection
- SQL = Structured Query Language
  - database management system language
- SQL injection
  - Put your own SQL requests into an existing app
  - Your app shouldn't allow this
  - Validate input
  - Often executed with browser

# Building a SQL injection
Example:
`SELECT * FROM users WHERE name = '' AND username='';`
- for a user -> name = 'harshit'

If it is more value:
`SELECT * FROM inputs WHERE name='harry' OR '1'='1';`
- Always true -> returns all data

Could provide real control over DB:
- Get all data
- Delete
- DOS etc.

## Further reading (optional)
[OWASP — SQL Injection Prevention](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
