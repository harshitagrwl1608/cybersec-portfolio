# Wireless Attacks & Jamming

## Overview
Wireless attacks exploit radio communication, wireless authentication, management frames, or RF availability. Deauthentication attacks abuse management-frame behavior, while jamming attempts to make the channel unusable.

## Core concepts
- Protected Management Frames (PMF) reduce exposure to forged management frames; IEEE 802.11w introduced protected management frames and WPA3 requires PMF.
- Jamming reduces the signal-to-noise ratio so legitimate communication fails; reactive jammers transmit in response to detected activity.
- Wireless attacks often depend on proximity because the attacker must reach the RF environment.

## Practical examples
- With PMF disabled, forged deauthentication/disassociation frames are easier to use against a client in range.

## Security / mitigation
- Use WPA2/WPA3 with appropriate PMF settings, strong authentication, channel planning, and RF monitoring.
- Do not treat hidden SSIDs or MAC filtering as primary security controls.

## Detection / troubleshooting
- Look for bursts of deauthentication/disassociation frames, sudden drops in signal quality, RF interference, and repeated client reconnects.

## Detailed notes captured from the notebook
# Wireless Attacks & Jamming

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

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
