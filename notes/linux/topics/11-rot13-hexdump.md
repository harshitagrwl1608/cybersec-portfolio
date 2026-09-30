# ROT13 and `hexdump`

## 1. ROT13

ROT13 replaces each letter with the letter 13 positions away in the alphabet. Applying it twice returns the original text:

```text
ROT13(ROT13(x)) = x
```

Examples:

```text
A -> N
B -> O
b -> o
n -> a
```

ROT13 is not encryption because it has no secret key and is trivial to reverse.

### Linux `tr` example

```bash
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
```

The two character ranges define the translation table.

## 2. `hexdump`

`hexdump` provides a hexadecimal representation of file bytes. A byte is shown as two hexadecimal digits.

Basic form:

```bash
hexdump file
```

Canonical display:

```bash
hexdump -C file.txt
```

The `-C` form shows hexadecimal bytes alongside an ASCII representation, making it useful for examining headers and binary data.

### Options from the notes

```bash
hexdump -C file.txt | head
hexdump -s 100 file.txt
hexdump -n 64 file.txt
```

- `-C` — canonical hex + ASCII format.
- `-s 100` — skip the first 100 bytes.
- `-n 64` — read/display the first 64 bytes.

## 3. Why hex views matter

The first bytes of many file formats contain a distinctive signature. Inspecting them can help identify what the file actually is, even when the filename extension is misleading.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

