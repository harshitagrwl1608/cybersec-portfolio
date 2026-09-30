# Directory Traversal

## Overview
Directory traversal occurs when an application allows user-controlled paths to access files outside the intended directory. The security boundary is the application's allowed file root; canonicalization and allow-listing help keep requests inside that boundary.

## Core concepts
- Attackers may try path components that move upward in the directory hierarchy, encoded separators, or alternate path representations.
- The impact may include reading configuration files, credentials, source code, or writing files if the application exposes unsafe write functionality.
- The safest design avoids constructing filesystem paths directly from untrusted input and instead maps user identifiers to server-side objects.

## Practical examples
- A download endpoint that accepts a filename directly should not allow arbitrary filesystem traversal outside its storage directory.

## Security / mitigation
- Canonicalize paths, allow-list file identifiers, enforce a filesystem root, run services with minimal privileges, and prevent direct access to sensitive directories.

## Detection / troubleshooting
- Monitor traversal-looking requests, repeated 400/403/404 patterns, access to unexpected files, and reads of configuration or credential files.

## Detailed notes captured from the notebook
# Directory Traversal

- Read / write files outside of website's file directory
- Users should not be able to browse OS folders
- Webserver software with
  - no mapping users from browsing past webserver root
- Web App code vuln.

## Further reading (optional)
[OWASP — Secure Code Review / Path Traversal guidance](https://cheatsheetseries.owasp.org/cheatsheets/Secure_Code_Review_Cheat_Sheet.html)
