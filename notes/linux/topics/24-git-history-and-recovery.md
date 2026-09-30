# Git History, Branches, Recovery, and Everyday Commands

## 1. Git as a history system

Imagine:

```text
Commit A
  |
  +-- README.md
  +-- password.txt
  |
  v
Commit B
  |
  +-- README.md
  +-- password.txt deleted
```

Deleting `password.txt` in a later commit does not erase its earlier committed content from history automatically. If the earlier object still exists and is reachable, it can be inspected or recovered.

## 2. Important `.git` components

The notes list:

```text
HEAD
config
objects
refs
logs
index
```

### `HEAD`

Names the commit/branch state currently checked out. In a normal branch checkout, it often resolves through a symbolic reference such as:

```text
HEAD -> main
```

### `objects`

Stores Git objects such as blobs, trees, commits, and tag objects.

### `refs`

Stores names/pointers to objects, including branches and tags.

### `logs`

Contains reflog information for reference updates in the local repository.

### `index`

The staging area: a snapshot of what the next commit should record.

## 3. Commits

A commit records metadata and points to a tree describing the project state. It normally contains:

- author information
- committer information
- timestamp information
- message
- parent commit(s)
- a tree object representing the committed directory state

## 4. Index / staging area

The correct model is:

```mermaid
flowchart LR
    A[Working tree changes] --> B[git add]
    B --> C[Index / staging area]
    C --> D[git commit]
    D --> E[New commit]
    E --> F[git push]
```

`git add` copies selected content into the index. `git commit` records the staged snapshot. `git push` transfers Git objects and updates remote refs; it does **not** mean “push only the files currently in the index”.

## 5. SHA/object IDs

Git identifies objects by cryptographic object IDs. Historically and in many repositories this is SHA-1; Git also supports repositories using SHA-256 object formats.

Example:

```bash
git show a34f96bd...
```

The abbreviated hash can identify an object when it is unambiguous in the repository.

## 6. Reflog

`git reflog` records local movements of references such as branch tips.

```bash
git reflog
```

Example history concept:

```text
HEAD moved A -> B
HEAD moved B -> C
reflog remembers these local ref movements
```

This makes reflogs useful after a destructive-looking operation such as a reset, provided the relevant reflog entry and object are still available.

## 7. Recovery example

Suppose the branch was moved backwards:

```bash
git reset --hard HEAD~1
```

Find the previous position:

```bash
git reflog
```

Then inspect the old commit and, when appropriate, move a ref back to it:

```bash
git show <old-hash>
git reset --hard <old-hash>
```

`--hard` is destructive to current working-tree/index contents that are overwritten, so it should be used only when that loss is intended.

## 8. Recover a deleted file

Inspect an older commit:

```bash
git show <old-commit>:password.txt
```

Or restore a file from an old commit into the working tree:

```bash
git restore --source=<old-commit> -- password.txt
```

Older Git workflows may use:

```bash
git checkout <old-commit> -- password.txt
```

## 9. `git status`

```bash
git status
```

Shows the relationship between the working tree, index, and current branch. It helps answer:

- what branch am I on?
- what files changed?
- what is staged?
- what is untracked?

## 10. Branches

```bash
git branch
```

Lists local branches.

```bash
git branch -r
```

Lists remote-tracking branches.

```bash
git branch -a
```

Lists both local and remote-tracking branches.

A branch is essentially a movable reference to a commit, not a separate copy of every file.

## 11. `git log`

```bash
git log
```

Shows commit history for the current revision traversal.

Useful options:

```bash
git log --oneline
git log --graph
git log --all
```

- `--oneline` — compact one-line entries.
- `--graph` — ASCII graph for branching/merging.
- `--all` — include histories reachable from all refs being considered, not only the current branch.

The corrected syntax is:

```bash
git log --oneline --all
```

not `git --log ...`.

## 12. `git show`

```bash
git show
```

shows the object named by `HEAD` by default (commonly the latest commit on the current branch).

Specific commit:

```bash
git show <hash>
```

Specific file from a commit:

```bash
git show <hash>:path/to/file
```

List a commit's tree:

```bash
git ls-tree -r <hash>
```

## 13. Switching and detached HEAD

```bash
git switch main
```

switches branches.

To inspect an old commit without attaching `HEAD` to a branch:

```bash
git switch --detach <hash>
```

The older `git checkout <hash>` form also produces a detached HEAD for a raw commit.

## 14. Restore

```bash
git restore file.txt
```

restores the working-tree copy from the index by default. To restore from a particular commit:

```bash
git restore --source=<commit> -- file.txt
```

## 15. `git diff`

```bash
git diff
git diff A B
git diff main dev
```

compares Git states/versions and shows line-oriented changes.

## 16. Search Git data

```bash
git grep password
```

searches tracked content in the working tree/revisions according to the command options.

Search commit messages:

```bash
git log --grep=login
```

## 17. File/commit commands from the notes

```bash
git add <file>
git mv old new
git rm <file>
git commit
git commit -m "message"
```

## 18. `fetch` vs `pull`

```bash
git fetch
```

updates remote-tracking information and downloads objects; it does not integrate those changes into the current branch by itself.

```bash
git pull
```

fetches and then integrates the fetched changes according to the configured pull behavior (commonly merge or rebase). It is therefore more than “download only”.

## 19. Tags

```bash
git tag
```

lists tags.

Example:

```bash
git tag v1.0
```

Inspect:

```bash
git show v1.0
```

Tags provide stable names for commits/other objects, unlike a branch which normally moves as new commits are made.

## 20. `git fsck`

```bash
git fsck
```

checks object connectivity/validity and can report dangling or unreachable objects depending on the options and repository state.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

