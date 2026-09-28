# Certificate Revocation & OCSP

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 47
# Wildcard Certificates
- Lists / adds identification info
- Allows a cert to support many different domains
- Wildcard domain -> certificate based on name of the server
- Wildcard domain will apply to all server names in domain
- E.g. `*.bingt2dev.live` [as written]

# Key Revocation
- Certificate Revocation List (CRL)
- Replacing all compromised cert.
- April 2014 - CVE-2014-0160
  - Heartbleed
  - OpenSSL flaw

### Page 48
## OCSP stapling
- Online Certificate Status Protocol
  - Provides security for OCSP checks
- Checking each cert manually to whether or not it is in revocation list of CA is not scalable (efficient)
- Instead have the cert holder verify their own status instead on centralized server
- Stapler is still standard, it can be [wording unclear]

Example commands from notes:
`nmap -p 443 --script ssl-enum-ciphers <domain>`
`openssl s_client -connect <domain>:443 -servername <domain>`
`# only cert`

### Page 49
# Getting revocation details into the browser
- Browser itself can handle all check with OCSP stapling
- msgs usually sent to OCSP responder via HTTP
  - more efficient than downloading CRL
- Many browsers don't support OCSP same way / don't implement it properly
  - worth checking
