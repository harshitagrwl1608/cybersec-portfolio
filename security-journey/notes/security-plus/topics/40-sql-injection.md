# SQL Injection

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 70
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

### Page 71
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
