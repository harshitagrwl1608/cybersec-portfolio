# `chmod` and Permission Modes

## 1. Purpose

`chmod` changes file mode bits (permissions and special bits).

General syntax:

```bash
chmod [OPTION]... MODE FILE...
```

Two major modes are used:

- **symbolic** — `u+rwx`, `g-w`, `o=rx`, etc.
- **numeric/octal** — `755`, `640`, `600`, etc.

## 2. Permission classes

```text
u -> user/owner
g -> group
o -> others
a -> all
```

Basic permissions:

```text
r = read
w = write
x = execute (or search for directories)
```

## 3. Octal permissions

Each permission bit has a value:

```text
r = 4
w = 2
x = 1
```

Add them per class:

```text
7 = rwx
6 = rw-
5 = r-x
4 = r--
3 = -wx
2 = -w-
1 = --x
0 = ---
```

Example:

```bash
chmod 755 script.sh
```

means:

```text
owner  = rwx
 group = r-x
 others= r-x
```

Binary view:

```text
7   5   5
111 101 101
```

## 4. SSH private-key example

A private key should not be readable by other users. A common setting is:

```bash
chmod 600 ~/.ssh/id_ed25519
```

That is:

```text
owner  = rw-
group  = ---
others = ---
```

So `600` is **not** `rwx------`; execute is not included.

## 5. Symbolic forms

```bash
chmod u+x script.sh
chmod g-w file.txt
chmod o-rwx private.txt
chmod a+r file.txt
```

The operators are:

```text
+ -> add bits
- -> remove bits
= -> set exactly the specified bits for the selected classes
```

## 6. Special bits preview

A fourth leading octal digit can represent special bits:

```text
4 -> setuid
2 -> setgid
1 -> sticky bit
```

For example:

```bash
chmod 4755 program
```

sets setuid plus `755`-style permissions, subject to filesystem and system policy.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

