# `grep`, Redirection, Pipes, and Background Commands

## 1. `grep`

`grep` searches input for lines matching a pattern.

Basic form:

```bash
grep [options] "pattern" [file ...]
```

Example:

```bash
grep "Linux" notes.txt
```

It prints lines containing a match.

### Useful options

```bash
grep -i "Linux" file.txt   # ignore case
grep -n "Linux" file.txt   # show line numbers
grep -c "Linux" file.txt   # count matching lines
grep -v "Linux" file.txt   # print non-matching lines
grep -l "Linux" *.txt       # print only names of matching files
grep -w "cat" *.txt        # whole-word matching
```

Recursive search:

```bash
grep -r "linux" Projects
```

Case-sensitive vs case-insensitive matching is controlled separately; `-i` is useful when capitalization should not matter.

### Search specific file types recursively

For a tree of C++ files, use:

```bash
grep -R --include='*.cpp' 'main' .
```

This is more precise than `grep -r 'main' *.cpp` for recursive searches.

## 2. Regex example from the notes

```bash
grep '^.*1' file.txt
```

In basic regular expressions:

- `^` means start of line.
- `.` matches a single character.
- `*` repeats the preceding pattern zero or more times.
- `1` matches the literal character `1`.

Thus the expression matches a line that can have any characters before a `1`, with the `1` somewhere on the line.

## 3. Pipes `|`

A pipe connects the standard output of one command to the standard input of the next:

```bash
command1 | command2
```

Example:

```bash
ps aux | grep ssh
```

The important model is:

```text
command 1 stdout (fd 1)
          |
          v
       pipe `|`
          |
          v
command 2 stdin (fd 0)
```

By default, a pipe connects stdout to stdin. It does not automatically merge stderr into the pipeline.

## 4. Output redirection `>`

```bash
echo "Linux is broad" > notes.txt
```

- If `notes.txt` does not exist, it is created.
- If it exists, its previous contents are replaced (truncated) before the new output is written.

## 5. Append redirection `>>`

```bash
echo "Ubuntu is good" >> notes.txt
echo "My name" >> notes.txt
```

This appends to the end instead of truncating the file.

## 6. File descriptor view

Linux commonly uses:

```text
0 -> stdin
1 -> stdout
2 -> stderr
```

Therefore:

```bash
command >out.txt       # stdout to file
command 2>err.txt      # stderr to file
command &>all.txt      # Bash: stdout + stderr to file
```

## 7. Background execution with `&`

```bash
command &
```

runs the command asynchronously so the interactive shell can accept another command while it is running.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

