# Web Verification Record

The source notes were re-checked against current documentation on 2026-09-30. The purpose of this file is to document the verification sources; the topic files are written to be understandable without opening this file.

## GNU Bash

- Bash Reference Manual — special parameters, positional parameters, environment, filename expansion, shell behavior.
  https://www.gnu.org/software/bash/manual/
- Special parameters: `$*`, `$@`, `$#`, `$?`, `$-`, `$$`, `$!`, `$0`.
  https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html
- Environment / inherited name-value pairs.
  https://www.gnu.org/software/bash/manual/html_node/Environment.html

## GNU Findutils / grep / coreutils

- GNU Findutils manual — `find`, `-size`, `-empty`, `-delete`, `-exec`.
  https://www.gnu.org/software/findutils/manual/
- GNU grep manual.
  https://www.gnu.org/software/grep/manual/
- Coreutils / Linux command manuals for file and text utilities.
  https://www.gnu.org/software/coreutils/manual/

## OpenSSH / networking tools

- OpenBSD `ssh-keygen` manual — key generation and public/private key files.
  https://man.openbsd.org/ssh-keygen
- OpenBSD `nc` manual — TCP/UDP connections, listening, transfer and port scanning.
  https://man.openbsd.org/nc
- OpenSSL `s_client` documentation — generic SSL/TLS client and `-connect host:port`.
  https://docs.openssl.org/master/man1/openssl-s_client/
- Kali Linux DIRB documentation — URL content discovery and options such as `-N`, `-o`, `-u`, `-X`.
  https://www.kali.org/tools/dirb/

## Linux permissions / filesystem

- Linux `chmod` manual — symbolic/octal modes, setuid/setgid/sticky bits.
  https://man7.org/linux/man-pages/man1/chmod.1.html
- Linux Filesystem Hierarchy Standard reference.
  https://refspecs.linuxfoundation.org/fhs/

## File comparison

- Linux `diff` manual.
  https://man7.org/linux/man-pages/man1/diff.1.html
- Linux `comm` manual — sorted-file requirement and three output columns.
  https://man7.org/linux/man-pages/man1/comm.1.html

## Git

- Git core data model — objects, refs, index, reflogs.
  https://git-scm.com/docs/gitdatamodel
- `git clone`.
  https://git-scm.com/docs/git-clone
- `git add` / index (staging area).
  https://git-scm.com/docs/git-add
- `git reset`.
  https://git-scm.com/docs/git-reset
- `git reflog`.
  https://git-scm.com/docs/git-reflog
- `git switch`.
  https://git-scm.com/docs/git-switch
- `git cat-file`.
  https://git-scm.com/docs/git-cat-file
- `git push`.
  https://git-scm.com/docs/git-push
- `git fsck`.
  https://git-scm.com/docs/git-fsck
- Git user manual section on reflogs, object database, blobs, trees, commits and tags.
  https://git-scm.com/docs/user-manual

## Important corrections made during verification

1. `chmod 600` means `rw-------`, not `rwx------`.
2. `git push` does not push “whatever is in the index”; `git add` stages content for a commit, and `git push` transfers commits/objects and updates remote refs.
3. `git restore file` restores the working tree from the index by default; restoring from an older commit needs `--source=<commit>` (or the older `checkout <commit> -- file` form).
4. `git log --oneline --all` is the correct form; `git --log ...` is not.
5. `comm` expects sorted input for the standard line-comparison model.
6. `grep -r 'main' *.cpp` is not the same as recursive filtering of all `.cpp` files under a tree; `grep -R --include='*.cpp' 'main' .` is the clearer recursive form.
7. `uniq` works on adjacent duplicates, so `sort | uniq` is the common pattern for unsorted input.
8. A basic `nc` file-transfer example is listener `nc -l PORT > received` plus sender `nc HOST PORT < file`; the receiver command was corrected accordingly.
9. `openssl s_client` is a TLS diagnostic client, not literally “encrypted netcat”.
10. `$-` in Bash is the current shell option-flag string, not the previous command's last argument.
11. `$*` and `$@` differ especially inside double quotes; `"$@"` expands positional arguments as separate words.
12. `/tmp` is temporary storage but is not guaranteed to be physically backed only by RAM.
13. Modern Linux distributions may merge `/bin` and `/sbin` into `/usr` paths, while retaining the traditional path names for compatibility.
14. Current OpenSSH commonly defaults `ssh-keygen` to Ed25519 when no type is specified; older notes using `id_rsa` are still a valid RSA example.
