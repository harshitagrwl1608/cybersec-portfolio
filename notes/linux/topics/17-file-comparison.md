# Comparing Files: `diff`, `cmp`, `comm`, and `git diff`

## 1. `diff`

`diff` compares files line by line.

```bash
diff file1 file2
```

No output normally means the files are identical for the comparison mode being used.

In normal diff output, `<` identifies content associated with the first file and `>` the second file.

Useful mode:

```bash
diff -u file1 file2
```

Unified diff is especially readable because it shows added/removed lines with context.

## 2. `cmp`

`cmp` compares files byte by byte.

```bash
cmp file1 file2
```

For identical files, there is normally no output and the exit status is zero. When bytes differ, it reports the first differing byte and line (where applicable to the implementation).

## 3. `comm`

`comm` compares **two sorted files** line by line.

```bash
comm file1 file2
```

Its three default output columns are:

```text
1 -> lines only in file1
2 -> lines only in file2
3 -> lines common to both
```

The input should be sorted consistently for meaningful results:

```bash
sort file1 -o file1
sort file2 -o file2
comm file1 file2
```

Suppress columns with:

```bash
comm -1 file1 file2
comm -2 file1 file2
comm -3 file1 file2
```

For example, only common lines:

```bash
comm -12 file1 file2
```

## 4. `git diff`

In a Git repository:

```bash
git diff
```

shows working-tree changes not currently staged.

Other comparisons can compare commits, branches, or specific paths, e.g.:

```bash
git diff main..dev
git diff HEAD -- file.txt
```

## 5. Choosing the tool

```text
Need line-level edits?       -> diff / git diff
Need first byte difference?  -> cmp
Need sorted set comparison?  -> comm
Need Git-aware changes?       -> git diff
```
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

