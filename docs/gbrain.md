# G-Brain: long-term memory

## What it is

G-Brain ([garrytan/gbrain](https://github.com/garrytan/gbrain), open source)
is a memory layer for AI agents. It does two things:

1. **Indexes your files.** Everything in this repo (context, notes,
   decisions, second brain) goes into a searchable database. Claude can
   search it instead of opening files one by one, and can find things from
   any project folder, not just this one.
2. **Stores facts.** When you say "remember that I chose topic X for my
   essay because...", Claude saves that as a fact with a date and source.
   Next week, in a brand new session, it can recall it.

Without it, Claude only knows what is in the current chat plus the files it
happens to open. With it, Claude has a memory that builds up over the degree.

## How it connects

```
You  ->  Claude Code  --(MCP)-->  gbrain serve  -->  your brain (a local database folder)
                                                         ^
                                     gbrain sync --------+---- this repo's markdown files
```

- **MCP** (Model Context Protocol) is the standard way tools plug into Claude.
  `gbrain serve` is an MCP server; Claude starts it automatically each session.
- **PGLite** is the database used here. It lives in a folder in your home
  directory. No server, no account, no cost.
- **Keyless mode** means keyword search, no API key needed. Good enough to
  start.

## Setup

In Claude, say: **"set up g-brain"**. The `gbrain-setup` skill does it step
by step and explains each part. It takes about 10 minutes. Manual version:

```bash
# 1. Bun (the runtime G-Brain needs)
curl -fsSL https://bun.sh/install | bash                 # Mac / Linux
# powershell -c "irm bun.sh/install.ps1 | iex"           # Windows

# 2. G-Brain itself (from GitHub, NOT npm)
bun install -g github:garrytan/gbrain#latest-stable

# 3. A local brain, free, no key
gbrain init --pglite --no-embedding

# 4. Load this repo (run inside the repo, after committing)
gbrain sources add mybrain --path "$(git rev-parse --show-toplevel)"   # the main folder, on main
gbrain sync --source mybrain --no-embed --no-pull
gbrain search "goals"

# 5. Connect it to Claude Code, for every folder
claude mcp add gbrain -s user -- gbrain serve
```

Then restart Claude and check `/mcp` lists `gbrain` as connected.

## The one rule: one process at a time

The local PGLite brain can only be open in **one program at a time**. Once
Claude is connected, Claude's G-Brain server holds it. That means:

- While Claude is open, let Claude do G-Brain things (it uses its MCP tools).
  Do not also run `gbrain ...` commands in another terminal.
- If you run **several Claude sessions at once** (Orca makes this easy), only
  the first one gets G-Brain. The others show it as failed in `/mcp`. That is
  expected, not broken. See "Level up" below if you want it everywhere.
- If you ever see a "lock" error: close the other session. Never delete the
  lock file.

## Using it day to day

You mostly do not touch it directly. Claude is told (in `CLAUDE.md`) to:
- search G-Brain before answering questions about your past work,
- save decisions and lessons with the `remember` skill,
- sync your latest notes at the end of each session (`handoff`).

Things you can say:
- "remember that ..."
- "what did I decide about ...?"
- "search my brain for ..."
- "what do I know about ...?"

## Backups

The G-Brain database lives only on your computer. That is fine, because it
is rebuildable: your files are in git (push to GitHub), and the `remember`
skill writes every saved fact to `context/memory-log.md` or
`decisions/log.md` too. On a new laptop: clone the repo, run the setup
again, and the brain reloads from your files.

## Worktrees and branches (Orca)

G-Brain reads the **main** folder's committed files on `main`. Work done on
another branch or in an Orca worktree reaches G-Brain once it is merged into
`main` and synced.

## Handy commands (with Claude closed)

| Command | Does |
|---|---|
| `gbrain doctor` | health check |
| `gbrain search "phrase"` | keyword search |
| `gbrain query "question"` | smarter search |
| `gbrain sync --source mybrain --no-embed --no-pull` | load new commits |
| `gbrain remember "fact" --entity me --provenance "typed by me"` | save a fact |
| `gbrain recall me` | show facts about you |
| `gbrain sources list` | what folders are loaded |

## Level up (later, optional)

- **Semantic search** (finds things by meaning, not just exact words): needs
  an embedding API key (OpenAI or Voyage), which costs a small amount per use.
  See the gbrain docs on embeddings and `gbrain migrate embeddings --help`.
- **Automatic memory:** at setup, gbrain offers "ambient memory writeback"
  (saves facts you state automatically). Off by default here, so you stay in
  control of what gets saved. Turn it on later with
  `gbrain config set memory.auto_writeback salient`.
- **G-Brain in many parallel agents:** move to a Postgres or Supabase brain
  (`gbrain migrate --to supabase`), or run one shared server with
  `gbrain serve --http`. Read the gbrain docs first; this is a bigger step.

Official guide: https://github.com/garrytan/gbrain/blob/master/docs/tutorials/connect-coding-agent.md
