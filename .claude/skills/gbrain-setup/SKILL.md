---
name: gbrain-setup
description: Installs G-Brain (garrytan/gbrain), creates a local keyless brain, loads this repo into it, connects it to Claude Code as an MCP server, and proves memory survives a new session. Use when the user says "set up g-brain", "set up gbrain", "install my memory", "connect my brain", or when /mcp does not list gbrain.
---

# G-Brain setup

Background for the user: `docs/gbrain.md`. The official guide, which wins
if anything below has drifted, is:
https://github.com/garrytan/gbrain/blob/master/docs/tutorials/connect-coding-agent.md
Fetch and skim it before starting.

**The one rule that matters (PGLite, the local option used here):** only ONE
process can have the brain open at a time. So do every terminal `gbrain`
step BEFORE connecting it to Claude Code. After it is connected, use the
MCP tools (`sync_brain`, `remember`, `search`), not the terminal, while any
Claude session is open.

Explain each step in one line before running it. Stop and report if any
step fails; do not improvise around an error.

## Step 0, Check what is already there

```bash
claude mcp list                                # is gbrain already connected?
command -v bun || echo "bun not installed"     # expected on a fresh machine
command -v gbrain || echo "gbrain not installed"
```

"Not installed" is the normal starting point, not a failure: go to Step 1.
If gbrain IS installed, also run `gbrain engine status --json` and
`gbrain sources list`. If a brain already exists, reuse it. Never
re-initialise over an existing brain. If `gbrain` is already connected in
`/mcp` (for example from another project), do not run terminal `gbrain`
commands here (they would hit the one-process lock). Instead, use the MCP
`sources_list` tool to check that a source called `mybrain` exists and points
at this repo's main folder. If it does, jump to Step 5 using the MCP
`remember` and `recall` tools. If it does not, ask the user to close every
Claude session, then run Step 4 in a plain terminal, then reopen Claude.

## Step 1, Install Bun (the runtime G-Brain needs)

- macOS / Linux: `curl -fsSL https://bun.sh/install | bash`
- Windows (PowerShell): `powershell -c "irm bun.sh/install.ps1 | iex"`

Then open a NEW terminal (so the `bun` command is found) and check
`bun --version`.

## Step 2, Install G-Brain

```bash
bun install -g github:garrytan/gbrain#latest-stable
gbrain --version
```

Install from GitHub exactly like this. An unrelated package with the same
name exists on npm.

If it errors during postinstall, follow the recovery hint it prints (or the
"If bun install -g hits a postinstall error" section of
`docs/INSTALL.md` in the gbrain repo), then run `gbrain doctor`.

## Step 3, Create the brain (local, free, no API key)

```bash
gbrain init --pglite --no-embedding
```

- PGLite is a database that lives in a folder on this computer. No server,
  no account, no cost.
- `--no-embedding` means keyword search only for now. It works well and is
  free. Semantic ("meaning") search needs an OpenAI or Voyage API key and can
  be added later, see `docs/gbrain.md`.
- It prints a search-mode / cost table. Show it to the user and confirm
  they want the free keyless mode before going on.

## Step 4, Load this repo into the brain

The repo must be committed first (sync reads git). Run `git status`. If
anything is uncommitted, show it, commit only files the user agrees to (by
name), and stop if the commit fails for any reason other than "nothing to
commit".

Register the **main checkout** of the repo (the folder they cloned, on the
`main` branch), never an Orca worktree or another branch. Check with
`git branch --show-current` (must say `main`) and
`git rev-parse --show-toplevel` (use that path).

```bash
gbrain sources add mybrain --path "$(git rev-parse --show-toplevel)"
gbrain sync --source mybrain --no-embed --no-pull
gbrain search "goals"
```

`--no-pull` is required: it tells G-Brain to read the local files as they are
instead of pulling from GitHub first. Dot-folders like `.claude/` are skipped
on purpose. The search should return `context/goals`. Then confirm the mapping with
`gbrain sources list`: `mybrain` must point at this folder. The `handoff`
and `wiki` skills sync `mybrain`, so if `sources add` refuses, stop and fix
that (read the error; `gbrain sources --help`) rather than working around it.

## Step 5, Save and read back a test memory

```bash
gbrain remember "My G-Brain setup test phrase is amber-orbit-<random 4 digits>" --entity projects/gbrain-setup --provenance "setup test, <today>" --json
gbrain recall projects/gbrain-setup --json
```

The recall must return the exact phrase. Note the phrase.

## Step 6, Connect it to Claude Code (for every project)

```bash
claude mcp add gbrain -s user -- gbrain serve
claude mcp list
```

`-s user` means it works in every folder, not just this one.

## Step 7, Prove it in a NEW session

Tell the user: type `/exit`, start `claude` again in this folder, then ask
"what is my G-Brain setup test phrase?". It must come back via a G-Brain
tool call (they will see `gbrain` in the tool line). An answer from the same
conversation proves nothing; only a fresh session proves memory.

Then update `context/connections.md`: G-Brain connected, PGLite, keyless,
source `mybrain`, date.

## Troubleshooting

| Symptom | Fix |
|---|---|
| `gbrain: command not found` | open a new terminal; check `~/.bun/bin` is on PATH |
| `/mcp` shows gbrain failed | run `gbrain doctor` in a terminal with Claude closed |
| "locked" / "another process holds the brain" | another Claude session or `gbrain` command has it open. Close it. Never delete `.gbrain-lock` |
| PGLite `RuntimeError: Aborted()` | `gbrain pglite-repair --dry-run`, then `--yes` |
| Want G-Brain in several parallel agents (Orca) | PGLite is one-at-a-time. See "Level up" in `docs/gbrain.md` |


---

## Self-improvement loop

Run this ONCE, when a run of this skill has actually finished. Not on every
turn, not mid-run, and not when the run was abandoned partway.

Ask three questions:

1. Did any step fail, need a workaround, or take more than one attempt?
2. Did the user correct, reject, or rewrite anything this skill produced?
3. Did you learn something a future run of this skill would need to know?

**If all three are no, say nothing at all.** Do not report "no improvements
needed". Silence is the correct output for a clean run.

If any is yes, propose exactly ONE edit: the section to change, the replacement
wording, and the specific failure it prevents. Then stop and wait for a yes.
Never edit this file without one.

If the lesson would have applied to any task rather than just this one, it
belongs in the standing rules (`.claude/rules/`), not in this skill. Say that
instead of patching this file.
