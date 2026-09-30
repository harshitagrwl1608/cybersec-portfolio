# Inspecting Git Objects and Pushing a File

## 1. `git cat-file -t`

```bash
git cat-file -t <hash>
```

Reports the type of the Git object named by the object ID.

Possible object types include:

```text
blob
tree
commit
tag
```

## 2. `git cat-file -p`

```bash
git cat-file -p <hash>
```

Pretty-prints an object's content in a type-aware form.

For example:

- a blob prints file contents;
- a tree prints tree entries;
- a commit prints commit metadata and references.

## 3. Object immutability model

Git uses content-addressed objects. Once an object exists, changing the underlying content creates a different object rather than mutating the existing one in place.

```text
content
  |
  v
object ID
  |
  v
stored object
```

Change content:

```text
new content
  |
  v
new object ID
```

## 4. Complete file-to-push workflow

The notes give this high-level sequence:

```bash
git switch <branch>
echo "Hello" > file.txt
git add file.txt
git commit -m "Add file.txt"
git push origin <branch>
```

Flow:

```mermaid
flowchart LR
    A[Working tree<br/>file.txt] -->|git add| B[Index]
    B -->|git commit| C[Local commit]
    C -->|git push origin branch| D[Remote repository]
```

## 5. What actually happens during push

`git push` negotiates objects with the remote and updates the requested remote reference when the push is accepted. It is the **commit and reference state** that matters, not whether the file remains staged locally.

Example:

```bash
git push origin main
```

means “update the `main` branch on `origin` from my local `main` reference, subject to Git's fast-forward/non-fast-forward rules and server policy.”
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

