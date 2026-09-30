# SCP — Secure Copy

## 1. Purpose

`scp` copies files between hosts over an SSH transport.

General model:

```text
scp SOURCE DESTINATION
```

The source or destination can be local or remote.

## 2. Upload local -> remote

```bash
scp file.txt username@server:/home/server/
```

Flow:

```text
local file.txt
      |
      | SSH-protected transfer
      v
remote host:/home/server/file.txt
```

## 3. Download remote -> local

```bash
scp username@server:/home/server/file.txt .
```

`.` means the current local directory.

## 4. Copy between two remote hosts

A form often used from a host that can reach both systems is:

```bash
scp user1@server1:/path/file.txt user2@server2:/tmp/
```

## 5. Useful options

```bash
scp -P 2222 file.txt username@server:/tmp/
```

`-P` selects the SSH port for `scp` (capital `P`).

For recursive directory copy:

```bash
scp -r folder/ username@server:/tmp/
```

## 6. Relationship with SSH

`scp` uses SSH for authentication and transport, so credentials/keys, host reachability, and SSH port configuration matter just as they do for `ssh`.

## 7. Single remote command

A separate but closely related operation is:

```bash
ssh username@server 'pwd'
```

The sequence is:

```text
connect -> authenticate -> execute -> return output -> disconnect
```
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

