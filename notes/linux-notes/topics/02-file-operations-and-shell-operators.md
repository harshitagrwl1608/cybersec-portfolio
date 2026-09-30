# File Operations and Shell Operators

This file covers the file/directory commands and command-list operators introduced in the notes.

## 1. `&&` — conditional next command

```bash
cd Downloads && ls
```

The command after `&&` runs only when the command before it succeeds (exit status `0`).

Flow:

```text
Command 1
   |
   +-- success (0) --> run Command 2
   |
   +-- failure       --> do not run Command 2
```

## 2. `||` — fallback command

```bash
cd Downloads || ls
```

The command after `||` runs only when the preceding command fails (non-zero status).

```text
Command 1
   |
   +-- success --> skip Command 2
   |
   +-- failure --> run Command 2
```

## 3. `;` — sequence commands unconditionally

```bash
cd Downloads ; ls ; pwd
```

Each command is attempted in sequence regardless of the previous exit status.

## 4. `rm`

Removes files. With recursive mode it can remove directories and their contents.

```bash
rm file.txt
rm -r folder_Name
rm -f file.txt
rm -rf folder_Name
```

- `-r` / `--recursive` — remove directories recursively.
- `-f` / `--force` — do not prompt for confirmation for cases where `rm` would normally prompt; suppress some errors for nonexistent files.
- `-rf` — recursive + force. This is destructive; verify the path before running it.

## 5. `mv`

Moves or renames files/directories.

```bash
mv source destination
mv note.txt Documents/
```

Conceptually:

```text
note.txt  --->  Documents/note.txt
```

Unlike `cp`, the source name is not left behind after a normal successful move.

### Renaming with `cp` vs `mv`

```bash
cp file1.txt file2.txt
```

Afterward both files normally exist.

```bash
mv file1.txt file2.txt
```

Afterward `file2.txt` is the new name and `file1.txt` is gone (subject to overwrite/backup behavior and permissions).

## 6. `mkdir`, `rmdir`, `touch`

### Create a directory

```bash
mkdir folder
```

Create parents too when needed:

```bash
mkdir -p a/b/c
```

### Remove an empty directory

```bash
rmdir folder
```

`rmdir` is intended for empty directories. For non-empty trees, `rm -r` is required.

### Create a file or update its timestamp

```bash
touch file
```

If the file does not exist, `touch` creates an empty file. If it exists, it normally updates its access/modification times instead of clearing its contents.

## 7. `cat`

Prints file contents to standard output.

```bash
cat file.txt
cat passwords.txt
```

For binary data, the terminal output may look unreadable; use tools such as `file`, `hexdump`, or `xxd` when a textual view is not appropriate.

## 8. `;`, `&&`, and `||` together

Example:

```bash
cd Downloads && echo "entered" || echo "could not enter"
```

The `&&` and `||` forms are based on command exit status. This is why checking the status of the previous command is central to shell control flow.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

