# Cheatsheet

## Starting and stopping

| Do | How |
|---|---|
| Start Claude in this folder | `claude` (or start an agent in Orca) |
| Carry on the last conversation | `claude --continue` |
| Pick an older conversation | `claude --resume` or `/resume` |
| Leave | `/exit` (say "wrap up" first) |

## Slash commands you will actually use

| Command | Does |
|---|---|
| `/help` | list everything |
| `/model` | change model (Haiku, Sonnet, Opus, Fable) |
| `/effort` | change thinking effort (low to max) |
| `/clear` | fresh conversation. Use between unrelated tasks |
| `/compact` | shrink a long conversation so you can keep going |
| `/context` | what is using up the context window |
| `/mcp` | connected tools (is G-Brain connected?) |
| `/agents` | see, create and edit subagents |
| `/memory` | open the CLAUDE.md memory files |
| `/rewind` | go back to an earlier point in the chat (and undo file edits) |
| `/permissions` | what Claude may do without asking |
| `/init` | generate a CLAUDE.md for a NEW project folder |
| `/<skill-name>` | run a skill directly, e.g. `/uni-notes` |

## Keys

| Key | Does |
|---|---|
| **Shift+Tab** | cycle modes: normal, auto-accept edits, **plan mode** |
| **Esc** | stop Claude mid-action |
| **Esc Esc** | rewind to an earlier message |
| **@** | mention a file: `@uni/units/MGT101/notes/week-03.md` |
| **!** | run a terminal command directly: `! git status` |
| Up arrow | previous messages |

## Things to say

| Say | Runs |
|---|---|
| "set me up" | `first-run` |
| "make notes" (after dropping files in `uni/_inbox/`) | `uni-notes` |
| "quiz me on MGT101 week 3" | `study-quiz` |
| "help me with my assignment" | `assessment-coach` |
| "mark my draft" | `marker` agent |
| "research X" | `research` + `researcher` agent |
| "grill me on this plan" | `grill-me` |
| "build me ..." | `spec`, then `build`, then `review` |
| "it's broken: <error>" | `debug` |
| "make an agent that ..." | `agent-builder` |
| "turn that into a skill" | `skill-builder` |
| "remember that ..." | `remember` |
| "ingest this <link>" | `wiki` |
| "process my inbox" | sorts `inbox.md` |
| "wrap up" | `handoff` |

## Git in five commands

| Command | Means |
|---|---|
| `git status` | what changed since the last save point |
| `git add <file>` | put a file in the next save point |
| `git commit -m "message"` | make the save point |
| `git log --oneline` | list save points |
| `git push` | copy save points to GitHub (your backup) |

You rarely type these. Say "commit this" or "push to GitHub" and Claude
does it and explains.
