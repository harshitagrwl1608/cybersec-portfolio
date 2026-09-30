# Text Processing, `sort`, `uniq`, `grep`, `strings`, and Base64

## 1. `sort`

Sorts lines of text.

```bash
sort file-name
```

Common variants:

```bash
sort -n numbers.txt      # numeric sort
sort -r file.txt         # reverse order
sort -f file.txt         # ignore case when comparing
```

## 2. `uniq`

`uniq` removes or reports **adjacent** duplicate lines. This is why sorting is often used before `uniq` when duplicates can appear in arbitrary order.

```bash
sort file.txt | uniq
```

Count repeated adjacent entries:

```bash
sort file.txt | uniq -c
```

`uniq -u` outputs only lines that are **not repeated adjacent duplicates** (i.e., unique occurrences in the adjacent groups), not simply “all distinct values” from an unsorted file.

## 3. `grep '^.*1'`

The notes use:

```bash
grep '^.*1' file.txt
```

Breakdown:

```text
^  -> start of line
.  -> any single character
*  -> zero or more of the preceding item
1  -> literal digit 1
```

Therefore this expression matches lines containing a `1` after zero or more preceding characters.

## 4. `strings`

```bash
strings file.bin
```

Displays sequences of printable characters found in binary data. It is useful when a file contains readable strings inside an otherwise non-text format.

## 5. Base64

Base64 is an **encoding**, not encryption. It represents binary data as printable ASCII characters.

Encode a file's contents:

```bash
base64 file-name
```

Decode Base64:

```bash
base64 -d encoded.txt
```

Save output to another file:

```bash
base64 file-name > encoded.txt
base64 -d encoded.txt > decoded.bin
```

Because Base64 is reversible and does not provide secrecy, a Base64-encoded password is not protected from someone who can read the data.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

