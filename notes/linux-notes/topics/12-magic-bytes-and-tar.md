# Magic Bytes / File Signatures and POSIX `tar`

## 1. Magic bytes

Many file formats begin with recognizable byte sequences. These are commonly called **magic bytes**, **magic numbers**, or file signatures.

A filename such as `picture.txt` does not guarantee that the file is actually text. The header bytes and internal structure are more reliable clues.

## 2. Signatures listed in the notes

| Leading bytes (hex) | Typical format |
|---|---|
| `89 50 4E 47` | PNG image |
| `FF D8 FF` | JPEG image |
| `50 4B 03 04` | ZIP archive |
| `1F 8B` | gzip-compressed data |
| `42 5A 68` | bzip2-compressed data |
| `FD 37 7A 58 5A` | XZ-compressed data |
| `7F 45 4C 46` | ELF binary |
| `23 21` | often a text script starting with `#!` (shebang) |
| `25 50 44 46` | PDF |
| `52 61 72 21` | RAR archive (`Rar!`) |
| `4F 67 67 53` | Ogg container |
| `49 44 33` | ID3 metadata header, common in MP3 files |

These signatures identify common formats; real-world files can have variants and additional headers.

## 3. Inspecting signatures

```bash
hexdump -C file | head
```

For a more direct file-type guess, Linux also provides:

```bash
file file
```

The notes focus on hex inspection because it exposes the raw bytes themselves.

## 4. `tar`

`tar` creates and extracts archive files. A tar archive itself is not compression; compression is often layered on top (`tar.gz`, `tar.xz`, etc.).

Create a tar archive:

```bash
tar -cf archive.tar folder/
```

Extract it:

```bash
tar -xf archive.tar
```

Useful forms:

```bash
tar -tf archive.tar     # list contents
tar -czf archive.tar.gz folder/   # tar + gzip
tar -xzf archive.tar.gz             # extract tar.gz
tar -cJf archive.tar.xz folder/     # tar + xz
tar -xJf archive.tar.xz             # extract tar.xz
```

## 5. Practical identification flow

```text
unknown file
   |
   v
inspect first bytes with hexdump -C
   |
   v
recognize signature
   |
   +--> PNG/JPEG -> image tools
   +--> ZIP       -> unzip
   +--> gzip      -> gzip/gunzip or tar -xzf when it is a tarball
   +--> bzip2     -> bzip2/bunzip2
   +--> XZ        -> xz or tar -xJf for tar.xz
   +--> ELF       -> executable/binary analysis
   +--> PDF       -> PDF reader
```
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

