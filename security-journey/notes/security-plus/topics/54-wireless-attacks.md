# Wireless Attacks & Jamming

**Combined source pages:** See INDEX.md. **Later-notes source PDF:** page(s) are listed in INDEX.md.

### Page 105
# Wireless Attacks
- Wireless deauthentication attack
  - you may not be able to stop it

## 802.11 management frames
- Wrong? / management frames [security]
- Original wireless standard did not have protection
  - sent in clear
  - no auth / validation
- easy deauth attack

## UPDATE
- 802.11w
- Some management frames (some) are encrypted

### Radio Frequency (RF) Jamming
- DoS
- transmission wireless signals
  - decrease signal to noise ratio
- Sometimes it is unintentional
  - microwave, etc.
- Jamming -> intentional

### Page 106
# Wireless Jamming
- Many diff types
  - don't send any legitimate valid data
  - send data unintentionally
  - Reactive jamming -> only when something occurs
- Needs to be close
  - CATCH
  - RF jamming
  - directional antenna, attenuator
- `PMF = 0 (disabled)` -> susceptible to deauth attack
  - `=1 (being used)`
  - `=2 (required)`
