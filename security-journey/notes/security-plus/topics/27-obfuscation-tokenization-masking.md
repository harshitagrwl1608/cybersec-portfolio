# Obfuscation, Tokenization & Data Masking

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 37
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

### Page 38
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
