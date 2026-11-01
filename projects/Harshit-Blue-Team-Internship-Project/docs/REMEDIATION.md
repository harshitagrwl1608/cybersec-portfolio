# Remediation plan

This plan addresses the observations in [FINDINGS.md](FINDINGS.md). It is written for the owner of a comparable application, not as permission to retest any system. Apply changes in a test environment first and obtain authorization before validation.

## Priority order

| Priority | Finding | Why it comes first |
|---|---|---|
| P1 - Urgent | F-02 SQL injection | Database-level injection was reported by SQLMap and six database names were enumerated. |
| P1 - Urgent | F-01 HTTP login | Authentication form values were transmitted without TLS. Real credentials on this route would be exposed to network observation. |
| P2 - High | F-03 Reflected XSS | Unencoded reflection and browser-side script execution were demonstrated. |
| P3 - Hardening | F-04 Directory discovery | No sensitive exposure was shown, but discovered paths should be reviewed. |
| P3 - Validate | F-05 Authentication throttling | The current sample cannot determine whether controls are sufficient. |

## F-01 - Enforce HTTPS for authentication

**Actions**
1. Serve the login page, form submission, registration, password reset, and all authenticated routes only over HTTPS.
2. Redirect HTTP to HTTPS before accepting any credentials; do not render a login form on HTTP.
3. Enable HSTS after confirming HTTPS is correctly configured for every relevant hostname.
4. Set session cookies with Secure, HttpOnly, and an appropriate SameSite attribute.
5. Disable obsolete TLS versions and use a maintained TLS configuration.

**Retest / acceptance criteria**
- Loading the login route over HTTP redirects to HTTPS before the user can submit credentials.
- The form action and all authentication POST requests use HTTPS.
- Session cookies carry Secure and HttpOnly; the selected SameSite value is appropriate for the application.
- A packet capture on the client side does not expose form values in plaintext.

## F-02 - Remove SQL injection

**Actions**
1. Replace query-string concatenation with parameterized database commands. For classic ASP/ADO, use parameterized Command objects and bind the id value using the correct database type.
2. Validate the identifier against the expected type and range; input validation is an additional control, not a replacement for parameterized queries.
3. Run the application using a database account with only the permissions required by the application. Avoid application access to administrative/system databases where it is not needed.
4. Return generic user-facing errors. Do not expose SQL errors, query text, connection details, or stack traces.
5. Log application and database errors securely with request correlation IDs; protect logs from public access.
6. Review other query parameters and endpoints that use the same database access patterns.

**Retest / acceptance criteria**
- An approved test against the formerly vulnerable parameter no longer produces boolean/time-based injection behavior.
- The application handles malformed identifiers with controlled validation errors.
- Database permissions prevent unnecessary access to unrelated databases and tables.
- Application responses do not disclose SQL errors or internal query details.

## F-03 - Remediate reflected XSS

**Actions**
1. Apply context-aware output encoding wherever user-controlled input is inserted into HTML, attributes, URLs, or JavaScript contexts.
2. Prefer safe DOM APIs such as textContent for plain text. Avoid inserting untrusted values through innerHTML or equivalent unsafe sinks.
3. If rich HTML is a business requirement, use a maintained allowlist-based sanitizer and define the permitted markup and attributes.
4. Deploy a restrictive Content Security Policy as defense in depth. Prefer nonces or hashes and avoid unsafe-inline where practical.
5. Review other reflected and stored input paths, not only the search page.

**Retest / acceptance criteria**
- The harmless SVG test string is rendered as text or safely encoded.
- No script or event handler executes in the browser.
- The response uses the expected encoding for the output context.
- CSP is tested for compatibility and does not rely on it as the only XSS control.

## F-04 - Review discovered paths

**Actions**
1. Confirm directory listing is disabled on all public web roots.
2. Remove obsolete backups, development files, temporary exports, source files, and configuration artifacts from the web root.
3. Restrict administrative routes by authentication and network policy where appropriate.
4. Review the actual content behind all paths that returned 200 or 301; do not infer exposure from the status code alone.
5. Minimize server/version banners and keep exposed components patched.

**Retest / acceptance criteria**
- No unnecessary backup, configuration, or administrative content is publicly accessible.
- Directory listing is disabled.
- Expected public routes continue to work and restricted routes enforce access control.

## F-05 - Validate authentication protections

**Actions**
1. Apply bounded rate limits by account and source, with safeguards for shared NATs and distributed attempts.
2. Use progressive delays or risk-based challenges where appropriate; avoid easy denial of service through permanent account lockouts.
3. Enable MFA for sensitive accounts and monitor MFA failures and suspicious recovery flows.
4. Alert on repeated failures, password-spray patterns, and failures followed by success.
5. Document the thresholds, suppression logic, and incident response steps.

**Retest / acceptance criteria**
- A controlled, authorized test confirms that configured thresholds trigger the intended response.
- Controls work across both single-source and distributed patterns, without disrupting normal users.
- Authentication, MFA, and lockout events are visible to the SOC.

## Operational ownership

For a real deployment, assign an application owner to F-02 and F-03, an infrastructure/platform owner to F-01, and an application/security owner to F-04 and F-05. Track each action with an owner, due date, change reference, retest evidence, and residual-risk decision. Do not mark a finding closed solely because a configuration change was made; close it after the retest criteria are met.
