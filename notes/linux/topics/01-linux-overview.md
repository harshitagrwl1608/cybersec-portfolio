# Linux Overview and Basic Terminal Commands

## 1. Linux as an operating system

The notes describe Linux as **lightweight, fast, and terminal-based**. A terminal provides a text interface for interacting with the operating system by entering commands.

This topic introduces the basic commands used to identify the current user and navigate the filesystem.

## 2. `echo`

`echo` prints text to standard output.

```bash
echo "Text_print"
echo "Hello World"
```

Output:

```text
Hello World
```

Text inside double quotes is printed after shell expansion rules are applied. For a literal example, `echo 'Hello World'` is also valid in Bash.

## 3. `whoami`

Shows the effective username of the current shell session.

```bash
whoami
```

Typical use: confirm **which user account you are currently operating as**.

## 4. `ls`

Lists directory contents.

```bash
ls
ls -l
ls -a
ls -h
ls -la
```

- `-l` — long format: permissions, owner, group, size, timestamps, name.
- `-a` — include hidden names (entries beginning with `.`).
- `-h` — make sizes human-readable where size output is shown.
- `-la` — long format + hidden entries.

`ls -lh` is a common combination because it gives long-format information with human-readable sizes.

## 5. `cd`

Changes the shell's current working directory.

```bash
cd /path/Directory
cd Downloads
cd ~/Downloads
```

Special forms:

```bash
cd       # normally go to your home directory
cd ~     # explicitly go to your home directory
cd ..    # go to the parent directory
cd -     # go to the previous working directory
```

### Absolute and relative paths

An **absolute path** starts from `/` (the root of the filesystem):

```text
/home/harshitgarg/Downloads/folder
```

A **relative path** is interpreted from the current working directory:

```bash
cd Downloads
```

### Path symbols

```text
.      current directory
..     parent directory
~      current user's home directory
/      filesystem root
```

Therefore:

```text
Downloads       -> Downloads below the current directory
./Downloads     -> same idea, explicitly relative
~/Downloads     -> Downloads below the home directory
../Downloads    -> Downloads below the parent directory
/Downloads      -> Downloads directly below the filesystem root
```

## 6. `pwd`

Prints the current working directory.

```bash
pwd
```

## 7. `cp`

Copies files or directories.

Basic file form:

```bash
cp filename /path/to/destination/
```

Example:

```bash
cp note.txt Documents/
```

After the command, the original remains and a copy exists in `Documents/`.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

