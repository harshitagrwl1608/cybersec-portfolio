# Malicious Updates & Automatic Updates

## Overview
Malicious-update attacks compromise the mechanism used to distribute legitimate software updates. Automatic updates are normally protective, but the update channel and signing infrastructure become high-value targets.

## Core concepts
- Attackers may compromise update servers, signing keys, package repositories, build pipelines, or distribution infrastructure.
- Software-supply-chain controls include signed artifacts, trusted repositories, reproducible builds, and verification before execution.
- Automatic updates reduce patch latency but do not eliminate supply-chain risk.

## Practical examples
- A vendor account or build system compromise can cause a malicious version to be distributed as if it were legitimate.

## Security / mitigation
- Verify signatures, restrict build/release access, monitor update provenance, and maintain rollback capabilities.

## Detection / troubleshooting
- Monitor unexpected signer changes, anomalous update sources, sudden fleet-wide version changes, and endpoint detections immediately after updates.

## Detailed notes captured from the notebook
# Malicious Updates & Automatic Updates

## Example: June 2004 Morris [wording]
- Reboot loop
- Error -> reboot server restart

# Malicious updates
- IT is usually designed to keep App. up to date
- Sometimes update may have a security concern
  - Always have backup
  - Use trusted sources

## Downloading & updating
- Install updates from a downloadable file
- Confirm source
- Use developer site directly
- Don't disable your security controls
- Digitally signed only

## Automatic updates
- Usually include security checks
- Digital sign
- Relatively trustworthy

Example: **Sol[ar]Wind[s] Orion** supply-chain attack
- Catastrophic
- Gained access to really sensitive info.

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
