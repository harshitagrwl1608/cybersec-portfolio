# John the Ripper: Basics — TryHackMe

**Category:** Password Auditing & Cracking

## Objective
Learn John the Ripper's core workflow — identifying hash formats,
running dictionary/rule-based attacks, and cracking protected archives
and SSH key passphrases — in an authorized lab context.

> Use only on passwords, hashes, keys, archives, and systems you are
> explicitly authorized to test.

## Tools Used
John the Ripper, `zip2john`, `rar2john`, `ssh2john`

## Methodology

### What Is John the Ripper?
A password-auditing and recovery tool used to test hash strength,
wordlist coverage, and password-policy resilience in authorized security
labs. Typical tasks: identifying hash formats, testing wordlists, applying
mutation rules, auditing Linux password hashes, testing protected
archives, and auditing password-protected private keys.

### Basic John Syntax
```bash
john --wordlist=wordlist.txt hash.txt      # dictionary attack
john --show hash.txt                       # display recovered passwords
john --format=<format> hash.txt            # force a specific hash format
john --list=formats                        # list supported formats
```

### Automatic Format Detection
John can often auto-identify a hash format, but this isn't always
reliable — a sensible workflow is: identify the format (using dedicated
hash-ID tools if ambiguous) → confirm the correct John format string →
run the wordlist/rules attack.

### Wordlists
```bash
john --wordlist=/path/to/wordlist.txt hash.txt
```
A targeted wordlist (based on likely words, names, dates, or known policy
patterns) consistently outperforms blind brute force when there's any
signal about the target's password habits.

### Rules
Rules transform each wordlist entry into likely variants — e.g. `password`
→ `Password` → `password1` → `Password1` → `p@ssword`. John supports
custom rule configurations for this. Rules matter most when you have some
knowledge of the target's password policy (e.g. "must include a digit").

### Single Crack Mode
Uses account-associated information (username, GECOS fields) to generate
candidates directly, without a separate wordlist:
```bash
john --single hashfile
```
E.g. a username of `mark` might generate candidates like `mark`, `Mark`,
`mark1`, `Mark123` — the exact set depends on John's internal rules.

### Custom Rules
Custom rule sections can be defined in John's config, e.g.:
```
[List.Rules:Password]
```
Operations include appending/prepending characters, case changes,
character substitution, and positional transforms — character classes
like `[0-9]` constrain what gets appended. Check syntax against the
installed version with `john --list=rules`.

### ZIP Archives
```bash
zip2john protected.zip > ziphash.txt
john --wordlist=wordlist.txt ziphash.txt
john --show ziphash.txt
```

### RAR Archives
```bash
rar2john protected.rar > rarhash.txt
john --wordlist=wordlist.txt rarhash.txt
john --show rarhash.txt
```

### SSH Private-Key Passphrases
```bash
ssh2john id_rsa > sshhash.txt
john --wordlist=wordlist.txt sshhash.txt
john --show sshhash.txt
```
The exact converter command/package name can vary by distro.

### Windows Password Hashes
```bash
john --format=NT hash.txt
```
Windows auth data often uses NTLM-family formats. Don't guess a format
string from memory — confirm with `john --list=formats` on the installed
version. (Tools like `mimikatz` are commonly referenced for *obtaining*
Windows credential material in the first place — strictly authorized-lab
use only.)

### GPU vs CPU
GPU-oriented cracking is extremely fast for many hash types; John can use
CPU and, depending on build/hash type, GPU/OpenCL acceleration. Memory-hard
password hashing schemes (Argon2id, scrypt — see the Hashing Basics
writeup) specifically exist to blunt the GPU-parallelism advantage.

### Troubleshooting Checklist
1. Verify the hash format is actually correct
2. Check `john --list=formats`
3. Confirm the source file was converted correctly (`zip2john`/`rar2john`/`ssh2john`)
4. Try a more appropriate/targeted wordlist
5. Add rules if the password is likely a mutation of a common word
6. Double check it's actually a password hash and not some other digest
7. Inspect John's output for format/parsing errors

## Detection Angle
- **Repeated authentication failures against a hash/credential store** —
  the network-facing equivalent of an offline John attack is an online
  brute-force, which is exactly what account lockout policies and SIEM
  brute-force detection rules are designed to catch (ties back to the A07
  Authentication Failures notes elsewhere in this repo).
- **Presence of tools like John, hashcat, mimikatz, or converted hash
  files (`*.john`, `ntds.dit` dumps)** on an endpoint is a strong
  post-compromise indicator worth alerting on in an EDR/SIEM rule — these
  aren't tools normal user workstations should have.
- The existence of **weak, crackable password hashes in a breach or
  extraction** is itself a finding — password audits using tools like
  John are a legitimate defensive practice (testing your own org's hash
  dumps against common wordlists to find weak accounts before an
  attacker does).

## Key Takeaway
John's entire workflow reduces to one loop: get the hash into a format
John understands, pick candidates that match what you know about the
target, and let math do the comparison. The real skill isn't the tool
syntax — it's correctly identifying the hash format and choosing a
wordlist/rule strategy that actually fits the target's likely password
habits, since brute force alone against a modern KDF is often
computationally hopeless.
