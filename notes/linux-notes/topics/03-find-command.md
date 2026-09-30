# `find` — Search the Filesystem by Conditions

## 1. Purpose

`find` searches a directory tree and evaluates tests such as **name, type, size, timestamps, permissions, owner, and emptiness**. It can also perform actions on the matches.

General model:

```bash
find [where-to-search] [conditions/tests] [actions]
```

Example:

```bash
find ~/Downloads -name "*.pdf"
```

This recursively searches below `~/Downloads` for names that match the shell pattern `*.pdf`.

`.` means the current directory:

```bash
find . -name "file.txt"
```

## 2. Find by name

```bash
find . -name "fileName"
find . -name "*.pdf"
```

- `-name` is case-sensitive on typical Linux filesystems.
- `-iname` performs case-insensitive name matching.

## 3. Find by type

```bash
find . -type f
find . -type d
```

Common values:

```text
f -> regular file
d -> directory
l -> symbolic link
```

## 4. Find by size

```bash
find . -size +100M
```

Meaning of the size test:

```text
+100M -> larger than the requested size unit
-100M -> smaller than the requested size unit
100M  -> matches that unit value after find's size rounding rules
```

GNU `find` supports suffixes such as `c` (bytes), `k` (KiB), `M` (MiB) and `G` (GiB). The unit is not simply “megabytes” in the decimal 1,000,000-byte sense.

## 5. Find by modification time

```bash
find . -mtime -7
```

`-mtime` works in 24-hour periods and is rounded for the test. `-mtime -7` means the modification time is less than seven full 24-hour periods old; it is not a calendar-date comparison.

Related tests include:

```bash
find . -mmin -60
```

for minutes rather than days.

## 6. Find empty files/directories

```bash
find . -empty
```

This matches an empty regular file or an empty directory.

## 7. Find and delete

```bash
find . -name "*.pdf" -delete
```

This directly deletes each match. It is powerful and should be previewed first by running the same `find` without `-delete`.

## 8. `-exec`

General form:

```bash
find ... -exec command {} \;
```

`{}` is replaced with the current matching pathname. `\;` terminates the `-exec` action.

Example from the notes:

```bash
find . -name "*.pdf" -exec ls -lh {} \;
```

Another example:

```bash
find . -name "*.txt" -exec grep "Linux" {} \;
```

Flow:

```text
find walks the tree
      |
      +--> matching file A --> command A uses {}
      |
      +--> matching file B --> command B uses {}
      |
      +--> ...
```

`-exec ... \;` runs the command separately for each match. GNU `find` also supports `-exec ... +` to pass multiple matches to each invocation.

## 9. Search recursively with `grep`

A recursive content search can also be done directly:

```bash
grep -r "Linux" .
```

For a safer filename-filtered recursive search, GNU grep supports `--include`:

```bash
grep -R --include='*.cpp' 'main' .
```

The commonly written form `grep -r "main" *.cpp` matches `*.cpp` in the current directory before `grep` starts recursion; it is therefore not equivalent to “recursively search every `.cpp` file below this tree”.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

