# Bash Loops and `seq`

## 1. `for` loop structure

The notes introduce:

```bash
for i in [numbers]
do
    [command]
done
```

A complete example:

```bash
for i in 1 2 3 4 5
do
    echo "$i"
done
```

Output:

```text
1
2
3
4
5
```

Loops are useful whenever a task must be repeated, including automation and authorized security testing.

## 2. Command substitution with `$()`

The notes show:

```bash
$(seq 1 5)
```

`$(...)` is **command substitution**: the shell runs the command and substitutes its standard output into the surrounding command (subject to word splitting and glob expansion rules).

Example:

```bash
for i in $(seq 1 5)
do
    echo "$i"
done
```

Here `i` receives each whitespace-separated value produced by `seq`.

## 3. `seq`

Generate a sequence of integers:

```bash
seq 1 5
```

produces:

```text
1
2
3
4
5
```

### Width option

```bash
seq -w 0 1000
```

`-w` pads numbers with leading zeroes so outputs have equal width where possible:

```text
0000
0001
...
0999
1000
```

## 4. Loop over files

If a directory contains `a.txt`, `b.txt`, and `c.txt`:

```bash
for file in /directory/*
do
    printf '%s\n' "$file"
done
```

For only text files:

```bash
for file in /directory/*.txt
do
    printf '%s\n' "$file"
done
```

Quoting `"$file"` is important when filenames contain spaces or wildcard characters.

## 5. Destructive example from the notes, made safer

The handwritten example uses `rm -rf` inside a file loop. A safer teaching pattern is to list first and delete only after checking the expansion:

```bash
for file in /directory/*.txt
do
    printf 'Would remove: %s\n' "$file"
done
```

Once the expansion is confirmed, a controlled delete can be added. `nullglob` is useful when the pattern might match nothing.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

