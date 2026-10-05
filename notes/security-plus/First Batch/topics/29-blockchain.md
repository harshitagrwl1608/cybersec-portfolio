# Blockchain Technology

## Overview
A blockchain is a distributed data structure in which records are grouped into blocks that are linked using cryptographic hashes. Depending on the design, consensus controls who may add blocks and how the network agrees on state.

## Core concepts
- A block normally contains transaction/data records, metadata, and a cryptographic link to earlier state.
- Immutability is a practical property rather than magic: changing historical data generally requires overcoming the network's integrity and consensus mechanisms.
- Permissioned and permissionless blockchains have different trust, identity, and consensus models.

## Practical examples
- Cryptocurrency networks use blockchain-style ledgers to record transactions; enterprise systems may use permissioned ledgers for controlled participants.

## Security / mitigation
- Protect private keys, validate smart contracts, control validator nodes, and monitor for consensus or key-management failures.

## Detection / troubleshooting
- Useful signals include abnormal validator behavior, unexpected wallet/key activity, unauthorized contract changes, and chain reorganizations where relevant.

## Detailed notes captured from the notebook
# Blockchain Technology

# Blockchain Technology
## Blockchain
- A distributed ledger
  - available to everyone
  - keep track of transaction
- Everyone on blockchain maintains the ledger
  - decentralized system
  - records a duplicate to anyone and everyone
- Payment processing
- Digital identification
- Digital voting

# Process
1. A transaction is requested
   - any type
2. Transaction is sent to every computer / node in the decentralized network to be verified

3. Verified transaction is added to a new block of data containing other recently verified transactions
4. A secure code (a hash) is calculated from the previous block of transaction data in the blockchain
   - hash is added to a new block
   - output is updated on network
5. If any block is altered, all blocks in chain are automatically recalculated
   - altered chain won't match the chain stored by rest of network, and will be rejected

## Further reading (optional)
Verified against current security-engineering guidance; see `WEB_VERIFICATION.md` for the external verification set.
