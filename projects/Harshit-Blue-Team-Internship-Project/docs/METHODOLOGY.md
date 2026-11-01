# Methodology

## 1. Scope and authorization

The task named `testphp.vulnweb.com`, which refused connections in the assessment environment. The approved alternative `testasp.vulnweb.com` was used for the exercise. It is presented as a deliberately vulnerable training site. Checks were limited to that host and the assigned scenarios.

Three invalid dummy login submissions were used. SQLMap was limited to the specified forum identifier and database-name enumeration (`--dbs`); no table dumps or record retrieval were performed. No production accounts or customer data were used.

## 2. Work performed

### Authentication and transport

- Opened the login page and submitted three invalid dummy logins.
- Captured the browser traffic in Wireshark.
- Examined frame 22, a form-encoded `POST /Login.asp` over HTTP.
- Expanded the HTTP form decoder to verify that the dummy username and password were visible in clear text.

### Directory discovery

- Manually requested `/admin/` and `/backup/`; both returned 404.
- Ran Gobuster v3.8.2 with the common `dirb` wordlist, five threads, and ASP/TXT/BAK extensions.
- The completed scan processed 18,452 entries. It found common files and paths, including several 301 directory redirects, 200 responses for common ASP pages, and a 403 response for `/cgi-bin/`.
- A discovered path was treated as an item to review, not as proof of directory listing or sensitive content exposure.

### SQL injection

- Used the task's forum URL: `showforum.asp?id=0`.
- Ran SQLMap and observed boolean-based blind and time-based blind injection indications on the `id` parameter.
- SQLMap identified Microsoft SQL Server and enumerated six database names: `acuforum`, `acuserservice`, `master`, `model`, `msdb`, and `tempdb`.
- Stopped at database-name enumeration. No tables or records were dumped.

### Reflected XSS

- Entered a simple SVG event-handler probe in the search field on the training site.
- The browser displayed an alert, confirming script execution in the test context.
- Captured the request/response in Wireshark and a browser screenshot with the alert visible. The input was not saved to the site.

## 3. Evidence handling

- The pcapng file contains 68 packets from the browser-based checks.
- The Gobuster and SQLMap screenshots are separate terminal evidence; those tool sessions are not contained in the 68-packet capture.
- Screenshots in `evidence/screenshots/` are included as the original submitted captures.
- The form values are dummy values. They are recorded in the screenshot to demonstrate the cleartext transport finding.

## 4. Limitations

There was no access to application server logs, database audit logs, WAF telemetry, or a live SIEM. Detection ideas in this project are therefore recommendations, not observed alerts. The login-rate-limit assessment used only three failed attempts. The directory scan identified paths, but did not demonstrate a directory index or prove that the returned content was sensitive. The SQLMap test enumerated database names but did not establish that records were exposed.
