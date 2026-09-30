# `more`, Shell Escapes, and Vim

## 1. `more`

`more` is a terminal pager. Instead of sending a whole file to the terminal at once, it displays the content a screen at a time.

Example:

```bash
more book.txt
```

or:

```bash
cat book.txt | more
```

Useful controls commonly include:

```text
Enter -> advance by a line
Space -> advance by a page
q     -> quit
```

## 2. Running a shell command from `more`

The notes demonstrate the `!` escape:

```text
more text.txt
!ls
```

This asks the pager to execute a shell command and then returns to the pager.

The conceptual model is similar to:

```text
pager
  |
  +--> start a shell for a command
          |
          +--> fork/exec shell command
          |
          +--> return to pager
```

## 3. `bash -c`

The notes also show:

```bash
bash -c 'ls'
```

This launches Bash and asks it to execute `ls` as a command string.

After the command finishes, that Bash process exits.

## 4. Security implication

Pagers and editors that can execute shell commands are important in privileged environments. If an application launches a pager/editor with elevated privileges, the ability to spawn another shell can create a serious security boundary problem.

The important principle is:

```text
program has elevated privileges
        |
        +--> embedded shell escape
               |
               v
         command execution with those privileges
```

Only test such behavior in systems you are authorized to assess.

## 5. Vim escape

The notes mention pressing `v` in some pager workflows to open the current file in the editor, then Vim commands such as:

```vim
:!command
```

or starting a shell from the editor interface. Exact behavior depends on the pager/editor configuration.

## 6. Terminal size

A terminal's dimensions affect how much output a pager displays per screen. The pager therefore uses the terminal size to decide page boundaries.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

