# Linux Shell & Git

## Shell basics
```bash
pwd
ls -la
cd /path
cp source dest
mv source dest
rm file
mkdir dir
touch file
cat file
```

## Search / text
```bash
find /path -name '*.conf'
grep -Rni 'pattern' /path
sort file
uniq -c file
strings file
diff a b
```

## Pipes / redirection
`cmd1 | cmd2` = pipeline.  
`>` = overwrite output.  
`>>` = append.  
`2>` = stderr redirect.  
`&` = background.

## Permissions
`r=4, w=2, x=1`
`755 = rwx r-x r-x` · `644 = rw- r-- r--` · `600 = rw- --- ---`

## SSH / SCP
```bash
ssh user@host
ssh user@host 'command'
scp file user@host:/path
ssh-keygen -t ed25519
```
Private key must be protected; common SSH key file permissions should be restrictive.

## Useful security commands
```bash
id
who
ps aux
ss -tulpn
sudo -l
journalctl
ip a
ip route
```

## SetUID / cron
SetUID executable = runs with file owner's effective privileges. Investigate unexpected privileged binaries.

Cron = scheduled task mechanism; inspect jobs and scripts for unauthorized persistence.

## Shell behavior
Globbing: `*` any string, `?` one character, `[]` character set.

`$()` = command substitution.  
`$?` = previous exit status.  
`$0` = script name.  
`$#` = argument count.  
`$@` = positional arguments.

`PATH` controls executable lookup; untrusted writable PATH entries can become a security problem.

## File identification
Magic bytes identify actual file format; don't trust filename extension alone.

`hexdump` helps inspect raw bytes.  
`tar` archives files without itself providing encryption.

Base64 / ROT13 / hex = encoding/representation, not encryption.

## Git security
Git objects: **blob → file contents; tree → directory snapshot; commit → history metadata; tag → named reference**.

`HEAD` = current reference.  `reflog` = local reference movement history.  `.git/objects` = object database.

Useful recovery: `git reflog`, `git show`, `git restore`, `git diff`.

**Do not commit secrets.** History can retain sensitive material even after deletion.