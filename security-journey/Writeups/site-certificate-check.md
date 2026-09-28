# Website Certificate Check

**Path:** CompTIA Security+ (SY0-701) / PKI / Certificates
**Date:** 2026-09-11
**Category:** PKI / Digital Certificates

## Objective
Inspect a website certificate and record its issuer, expiry, and signature algorithm.

## Tools used
- Web browser
- Website certificate viewer

## Methodology
1. Open the target website in a browser.
2. Click the **padlock** or connection/security indicator.
3. Open the certificate/details view.
4. Record:
   - **Issuer:** Google Trust Services
   - **Expiry / Valid until:** Sat, 19 Dec 2026 21:31:25 GMT
   - **Signature algorithm:** ECDSA with SHA-256
5. Confirm that the values correspond to the certificate currently presented by the site.

### Certificate details observed

| Field | Value |
|---|---|
| Common Name | `chatgpt.com` |
| Issuer | Google Trust Services |
| Issuer Common Name | `WE1` |
| Issuer Country | `US` |
| Valid from | 20 Sep 2026 20:31:28 GMT |
| Valid until | 19 Dec 2026 21:31:25 GMT |
| Public Key Algorithm | Elliptic Curve |
| Key Size | 256 bits |
| Signature Algorithm | ECDSA with SHA-256 |
| Certificate Version | 3 |
| Certificate Policy | Domain Validation |

### Screenshot evidence


> The screenshots used for this check show the certificate details above.

!(image)[./screenshots/certificate_01.png]

!(image)[./screenshots/certificate_02.png]

!(image)[./screenshots/certificate_03.png]

## Detection angle (SOC-relevant)
Certificate monitoring can surface expired certificates, unexpected issuers, weak/deprecated signature algorithms, hostname mismatches, or certificate changes that require investigation. Relevant telemetry can come from browser/security logs, TLS inspection, certificate-monitoring systems, or proxy logs.

## Key takeaway
The browser certificate view provides a direct way to verify who issued a site's certificate, its validity period, and the signature algorithm used.
