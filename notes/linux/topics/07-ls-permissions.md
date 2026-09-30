# `ls -l` and Linux Permission Strings

## 1. Long listing

```bash
ls -lh
```

A long listing typically contains columns such as:

```text
permissions  links  owner  group  size  date/time  name
```

The first field is the **file mode / permission string**.

## 2. Permission string structure

Example:

```text
-rwxr-xr--
```

Break it into:

```text
- | rwx | r-x | r--
  |     |     |
  |     |     +---- others
  |     +---------- group
  +---------------- owner
```

The first character is the file type:

```text
-  regular file
d  directory
l  symbolic link
```

The next nine characters are three groups of three:

```text
rwx  owner/user permissions
r-x  group permissions
r--  other permissions
```

## 3. Meaning of `r`, `w`, `x`

For a regular file:

- `r` — read file contents.
- `w` — modify/write file contents.
- `x` — execute the file as a program/script (subject to other controls).

For a directory, `x` means **search/traverse** the directory; `r` and `w` have directory-specific meanings.

## 4. Numeric form

Each permission has a value:

```text
r = 4
w = 2
x = 1
```

Add the bits for each class:

```text
rwx = 4+2+1 = 7
rw- = 4+2   = 6
r-x = 4+1   = 5
r-- = 4
-wx = 2+1   = 3
-w- = 2
--x = 1
--- = 0
```

Example:

```text
-rwxr-xr--
   7  5  4
```

so the regular permission portion is `754`.

## 5. Important distinction: file type vs permissions

For:

```text
-rw-r--r--
```

`-` is the file type, while `rw-r--r--` contains the access bits.

A leading `s` or `t` may also appear in the execute positions when special bits such as setuid, setgid, or the sticky bit are set.

## 6. Reading a complete example

```text
-rwxr-x---
```

means:

```text
regular file
owner  -> read + write + execute
 group -> read + execute
 others-> no permissions
```
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

