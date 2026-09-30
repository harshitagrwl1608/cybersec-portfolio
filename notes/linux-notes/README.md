# Linux Notes — Standalone Topic Notes (Pages 1–47)

This repository is a **self-contained digital reconstruction of the Linux notes**.

## Design rule for this revision

Every file under `topics/` is intended to stand on its own. A reader should be able to open a single topic `.md` file and understand the topic, examples, command syntax, diagrams, and important caveats **without opening source images**.

The topic files therefore:

- contain the full topic content in Markdown;
- contain ASCII/Mermaid diagrams where the handwritten notes included flows or structures;
- contain normalized command examples;
- include explicit corrections where the handwritten form conflicts with current command behavior;
- do not link to or embed source-page images.

## Topics

1. Linux overview and basic terminal commands
2. File operations and shell operators
3. `find`
4. `grep`, redirection and pipes
5. SSH basics
6. SCP
7. `ls -l` and permissions
8. Linux filesystem hierarchy
9. DIRB / web content enumeration
10. Text processing and encoding
11. ROT13 and `hexdump`
12. Magic bytes and `tar`
13. SSH public/private keys
14. Netcat
15. OpenSSL `s_client`, standard streams and `/dev/null`
16. `chmod`
17. File comparison
18. Remote commands and SetUID
19. Cron
20. Shell globbing and `shopt`
21. Loops and `seq`
22. `more`, shell escapes and Vim
23. Git basics and cloning
24. Git history, branches and recovery
25. Git objects
26. Git object inspection and push
27. Bash special parameters
28. Environment variables

## Reference material

`reference/source-pages/` contains the original page scans for audit/comparison only. **Nothing in `topics/` depends on those scans.**
