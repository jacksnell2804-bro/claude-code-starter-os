# Using this with Orca

## What Orca is

[Orca](https://github.com/stablyai/orca) (by Stably AI, open source) is an
"agent development environment": a desktop app for running AI coding agents,
like Claude Code, side by side. It does **not** replace Claude Code. It runs
the real Claude Code for you in panes, and gives each agent its own copy of
the repo (a **git worktree**) so several can work at once without
overwriting each other.

You still need Claude Code installed and logged in. Orca uses your Claude
subscription through it.

## Install

1. Install Claude Code first and log in once in a terminal (see `README.md`).
2. Install Orca:
   - Mac (Homebrew): `brew install --cask stablyai/orca/orca`
   - Or download the Mac / Windows / Linux build from the Orca GitHub page.
3. Open Orca and add this repo's folder as a project.
4. Start a Claude Code agent in it.

## How to use it well as a beginner

- **Start with ONE agent.** Get comfortable with one Claude session before
  running five. Everything in this repo works the same in a single pane.
- **Use parallel agents for independent jobs**, for example: one making
  notes for MGT101, one building your agent in `projects/`. Two agents
  editing the same file is how work gets lost.
- **Each parallel agent works on its own branch in its own worktree.** When
  one finishes, you review what it did and merge it back. If you are not
  sure how, ask Claude: "merge the branch from my other agent, explain each step."
- **Try the same prompt across agents** when you want options (Orca can
  fan one prompt out and you pick the best result). Great for design ideas,
  wasteful for simple tasks.

## G-Brain and parallel agents

The local G-Brain can only be open in one process at a time (see
`gbrain.md`). In Orca, the **first** Claude agent gets G-Brain; any others
will show `gbrain` as failed in `/mcp`. That is fine: they still have all
the files. Do memory work (remember, recall, handoff) in your main agent.

## If something looks different

Orca updates often. If a button or menu here does not match, the ideas are
the same: a project is a folder, each agent is a Claude Code session, each
parallel agent gets a worktree. Orca's own docs win over this page.
