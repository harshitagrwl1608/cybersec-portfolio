# Environment Variables and Shell Expansion

## 1. What an environment variable is

An environment passed to a process is a collection of name/value strings such as:

```text
NAME=value
```

Child processes normally inherit the environment of the process that launched them.

Bash turns inherited environment entries into shell variables and can export variables to child processes.

## 2. Common variables shown in the notes

| Variable | Typical meaning | Example from the notes |
|---|---|---|
| `HOME` | user's home directory | `/home/harshit` |
| `USER` | current login/user name | `harshit` |
| `SHELL` | user's configured shell | `/bin/bash` |
| `PATH` | directories searched for commands | `/usr/local/bin:/usr/bin:/bin` |
| `PWD` | current working directory | `/home/harshit` |
| `LANG` | locale/language environment | `en_US.UTF-8` |

Values vary by machine, distribution, session, and configuration; the examples above are illustrations.

## 3. Read a variable

```bash
echo "$HOME"
echo "$USER"
echo "$SHELL"
echo "$PATH"
```

You can also inspect the environment with:

```bash
printenv
```

or:

```bash
env
```

## 4. Shell variable vs environment variable

A variable in Bash is not automatically exported just because it exists:

```bash
NAME=value
```

To put it in the environment of child processes:

```bash
export NAME
```

or:

```bash
export NAME=value
```

Then a child process can inherit it.

## 5. Substitution before command execution

Bash performs expansions before the command is executed. For example:

```bash
USER_NAME=HARSHIT
echo "$USER_NAME"
```

Bash expands `$USER_NAME` first and effectively executes a command that receives the resulting text.

Model:

```mermaid
flowchart LR
    A[Shell input:<br/>echo $USER_NAME] --> B[parameter expansion]
    B --> C[expanded command:<br/>echo HARSHIT]
    C --> D[execute]
```

## 6. `PATH`

`PATH` is a colon-separated list of directories. When a command such as `grep` is typed without a pathname, the shell searches the directories in `PATH` for an executable with that name.

Inspect it:

```bash
echo "$PATH"
```

Find the command chosen by the shell:

```bash
command -v grep
```

## 7. Changing and unsetting variables

```bash
export DEMO=hello
printf '%s\n' "$DEMO"
unset DEMO
```

A variable that is unset no longer has a value in the shell.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

