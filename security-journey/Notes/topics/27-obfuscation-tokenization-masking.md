# Obfuscation, Tokenization & Data Masking

## Overview
Obfuscation makes code or data harder to understand; tokenization replaces sensitive values with non-sensitive tokens; masking hides all or part of a value for display or handling. These techniques solve different problems and are not interchangeable.

## Core concepts
- Obfuscation aims to increase effort required to interpret information, not to provide strong cryptographic secrecy.
- Tokenization replaces a value with a token that maps to the original in a controlled system.
- Masking may show only part of a value, such as `****1234` for a payment card display.
- Encryption provides confidentiality when the key is protected; tokenization and masking can reduce exposure without requiring the original value everywhere.

## Practical examples
- Logs may store a token instead of a payment card number; support screens may display only the last four digits.

## Security / mitigation
- Keep token vaults and detokenization paths tightly controlled; do not rely on obfuscation as a primary security boundary.

## Detection / troubleshooting
- Watch for repeated detokenization, unusual access to token vaults, or sensitive data appearing in logs where masking should have been applied.

## Detailed notes captured from the notebook
# Obfuscation, Tokenization & Data Masking

# Obfuscation
- Process of making something inside
  - hide info in plain sight
  - E.g. image steganography
- not impossible to understand

**If you know the method, there is no security.**

## Common Tech
1. Network-based -> embed data in TCP packets
2. Use an image -> embed code in image itself
3. Invisible watermark -> E.g. yellow dot on printers
4. Audio steganography / video -> hide inside audio/video

## 5) Tokenization
- Replace sensitive data with a non-sensitive placeholder
- E.g. SSN-123-12-1111 -> 69-16-123 [as written]
- Common with credit card processing
- One time use
- Original data & token are not mathematically related
- Similar to masking
  - no intermediate retrieval actually knows what the data is

## 6) Data masking
- Only showing a part of original data
- E.g. `****` on receipt
- Many diff levels

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
