# Linux Security Commands

## Files / permissions
```bash
ls -la
find / -name 'name' 2>/dev/null
grep -Rni 'pattern' /path
chmod 600 file
chmod 644 file
chmod 755 file
chown user:group file
```

**Permission bits:** r=4, w=2, x=1  
`755 = rwx r-x r-x`  
`644 = rw- r-- r--`  
`600 = rw- --- ---`

## Processes / users
```bash
id
who
w
ps aux
top
pgrep -a <name>
kill <PID>
sudo -l
```

## Network
```bash
ip a
ip route
ss -tulpn
ping <host>
dig <domain>
```

## Logs
Common locations:
- `/var/log/`
- `/var/log/auth.log` on Debian/Ubuntu
- `journalctl`
```bash
journalctl -xe
journalctl --since "1 hour ago"
```

## SSH
```bash
ssh user@host
scp file user@host:/path
ssh-keygen -t ed25519
```

Protect private keys; avoid password reuse.