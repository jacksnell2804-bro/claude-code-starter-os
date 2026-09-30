# Git safety

Loaded every session. Git is the undo button for this whole folder. Protect it.

- **Commit often, with clear messages.** A commit is a save point. Before any
  big change, make sure the current state is committed so it can be undone.
- **Explain each git command in one line** the first few times you use it.
- **Stage specific files, not everything.** Prefer `git add <file>` over
  `git add -A` or `git add .`, then show me `git status` before committing.
- **Never** run `git reset --hard`, `git clean -fd`, `git push --force` or
  delete a branch without asking me first. These can destroy work.
- **Big or risky builds go on a branch** (`git switch -c try-new-thing`), so
  `main` always works.
- **Never commit** `.env`, API keys, or large files (videos, big PDFs over
  about 20 MB). Check `git status` for surprises before every commit.
- If something goes wrong with git, stop and explain what happened before
  trying to fix it. A panicked fix is how work actually gets lost.
