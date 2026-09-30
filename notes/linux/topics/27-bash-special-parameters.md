# Bash Special Parameters

Bash provides special parameters that report information about the current shell, process, command status, and script arguments.

## 1. Core parameters

| Parameter | Meaning | Example/typical value |
|---|---|---|
| `$0` | Name used to invoke the shell/script | `bash`, `./script.sh` |
| `$$` | PID of the current shell | `12345` |
| `$?` | Exit status of the most recently executed command | `0` for success, non-zero for failure |
| `$!` | PID of the most recently backgrounded asynchronous job | `5678` |
| `$#` | Number of positional parameters | `3` |
| `$*` | Positional parameters expanded as one word when quoted, with IFS separation | `file1 file2` |
| `$@` | Positional parameters; when quoted, expands as separate words | `file1` `file2` |
| `$1`, `$2`, ... | First, second, ... positional arguments | `hello`, `world` |
| `$-` | Current shell option flags | e.g. `himBH` (varies) |

## 2. `$0`

For a script:

```bash
./script.sh one two
```

inside the script:

```bash
echo "$0"
```

may print:

```text
./script.sh
```

It is not “the first user argument”; `$1` is the first positional argument.

## 3. `$$`

```bash
echo "$$"
```

The special parameter itself is:

```bash
echo "$$"
```

It expands to the PID of the current Bash shell. In a subshell, Bash documents special behavior: `$$` remains the invoking shell's PID, while `$BASHPID` gives the current Bash process ID.

## 4. `$?`

```bash
true
echo "$?"
```

prints `0`.

Example failure:

```bash
false
echo "$?"
```

prints a non-zero status (normally `1` for `false`).

Important: reading `$?` with another command changes what the “previous command” is, so capture it immediately when needed.

## 5. `$!`

Example:

```bash
sleep 30 &
echo "$!"
```

`$!` expands to the PID of the most recently backgrounded asynchronous job.

## 6. `$#`

For:

```bash
./script.sh file1 file2 file3
```

`$#` is `3`.

## 7. `$1`, `$2`, ...

A small script:

```bash
#!/usr/bin/env bash
printf 'first=%s second=%s\n' "$1" "$2"
```

Run:

```bash
./script.sh hello world
```

The first argument is in `$1`; the second is in `$2`.

## 8. `"$*"` vs `"$@"`

Inside double quotes:

```bash
"$*"
```

expands to a single word containing the positional arguments separated using the first character of `IFS`.

```bash
"$@"
```

expands each positional argument as a separate word.

A common safe loop is:

```bash
for arg in "$@"; do
    printf '%s\n' "$arg"
done
```

## 9. `$-`

The handwritten notes incorrectly describe `$-` as “last argument of previous command”. In Bash, `$-` actually expands to the shell's **current option flags**.

For example, after starting Bash with different options, the output can contain letters representing enabled shell behaviors. The exact string depends on how the shell was invoked and which options are active.

## 10. Special-parameter flow

```text
script.sh arg1 arg2
       |
       +--> $0 = script name
       +--> $1 = arg1
       +--> $2 = arg2
       +--> $# = number of args
       +--> $@ / $* = all args

command -> exit status -> $?
background job -> PID -> $!
shell process -> PID -> $$
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

