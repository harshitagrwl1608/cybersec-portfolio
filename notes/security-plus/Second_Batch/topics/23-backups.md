# Backups, Recovery, Replication and Journaling
**Source provenance:** Handwritten lecture notes from Professor Messer’s free CompTIA Security+ **SY0-701** training course.
**Professor Messer course alignment:** 3.4 – Resiliency and Recovery → Backups
**Coverage:** source pages 63–65

## Why backups matter
The notes call backups **incredibly important** and connect them directly to recovery. Planning should cover:
- How much data is stored.
- Backup type.
- Storage media.
- Storage location.
- Backup/recovery software.
- Time required.

## Onsite vs. offsite
### Onsite
- No Internet/data-transfer requirement.
- Immediate availability.
- Generally lower cost.

### Offsite
- Requires transferring data.
- Data may be available after a disaster at the primary site.
- Recovery from a remote location can be more expensive.

The notes state that organizations often use both.

## Frequency
Backup frequency should match how quickly data changes. Examples include daily, weekly, or monthly schedules. Different data types may need different frequencies.

## Encryption
Protect backup data with encryption so that stolen backup media does not immediately expose the data. Backup/recovery keys must be protected as well. The notes emphasize that cloud/offsite backups remain security-sensitive.

## Snapshots
The notes describe VM snapshots as fast captures that can save system/configuration state and then create another snapshot later so only changes are represented. They are useful for quick recovery/rollback but should not be the only backup strategy.

## Recovery testing
A backup is not enough; test whether it can actually restore the required system/data. Recovery testing simulates disaster and verifies restoration.

## Replication
Replication continuously/near-real-time copies data to multiple locations. It is useful for recoverability but should be separated conceptually from independent backup copies.

## Journaling
Journaling records writes/changes so that a system can recover consistent state after an interruption. The notes describe data being written to a journal before final database/log changes and updating the journal after successful writes.
