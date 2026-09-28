# Firewall — UFW for Lab

**Source pages:** added notes PDF, pages 7–9.

## UFW
- UFW → uncomplicated firewall.
- Enable firewall with default rules:

```bash
sudo ufw enable
```

- Allow outgoing.
- Deny incoming.

## 1. Allow / deny

### a) Allow by port / optional protocol
```bash
sudo ufw allow <port>/<optional:protocol>
```

Examples:
```bash
sudo ufw allow 53/tcp
sudo ufw deny 22/tcp
```

### Delete a rule
```bash
sudo ufw delete <port>/<optional:protocol>
```

- Simply write the rule to delete.

Example:
```bash
sudo ufw delete 53/tcp
```

### b) Services
- `/etc/services`

```bash
sudo ufw allow <service_name>
sudo ufw deny smtp
```

## Advanced syntax

### 1) Allow by IP / subnet
```bash
sudo ufw allow from <IP-Addr>
```

### 2) Allow by specific port, IP addr, protocol
```bash
sudo ufw allow from <target> to <destination> port <portnumber> proto <protocol-name>
```

Example in source notes:
```bash
sudo ufw allow from 192.168.1.2 ... any port 22 proto tcp
```
**[One short segment of this handwritten example is unclear.]**

## Advanced example
- Block access to port 22 from `192.168.1.2` & `192.168.1.3`, but allow all other `192.168.1.x` IPs to access port using TCP.

```bash
sudo ufw deny from 192.168.1.2 to any port 22
sudo ufw deny from 192.168.1.3 to any port 22
sudo ufw allow from 192.168.1.3/24 to any port 22 proto tcp
```

## Note
If you want to remove a rule:
1. **Best — delete it**
   - Keeps rules table clean.
2. **Deny**
   - Adds deny rule above allow.
