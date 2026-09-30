# How this whole system works

Read this once, properly. It takes 10 minutes and it is the difference
between "using a chatbot" and "running an AI operating system".

## Chat versus agent

- **Chat** (ChatGPT, claude.ai): you ask, it answers, *you* do the work.
- **Agent** (Claude Code): you give it a goal, it plans, reads files, runs
  commands, writes files, checks its work, and hands back a finished result.

Claude Code is an agent that lives in a folder on your computer. This repo
is that folder, set up so the agent knows who you are, how you like things
done, and what processes to follow.

## The loop every agent runs

```
Observe  ->  Think  ->  Act  ->  (repeat until done)
look at      decide     run a tool,
files and    the next   write a file,
results      step       search the web
```

It stops when it thinks the goal is met. **So the clearer you are about what
"done" looks like, the better it stops.** "Make notes" is vague. "Make notes
on week 3 with a 30-second summary and the three frameworks in tables" is
clear.

## The four levers

You almost never need a "better AI". You need to tune these four:

| Lever | What it is | Where it lives here |
|---|---|---|
| **Context** | what Claude knows before you ask | `CLAUDE.md`, `context/`, `hot-cache/` |
| **Skills** | your processes, written down once | `.claude/skills/` |
| **Tools** | what Claude can actually do | built in (files, terminal, web) plus MCP servers like G-Brain |
| **Model** | which AI brain does the thinking | `/model` and `/effort` (see `models-and-effort.md`) |

A cheaper model with great context and skills beats the best model with
none. Most of your improvement over time comes from context and skills.

## What loads when

| File | When Claude reads it |
|---|---|
| `CLAUDE.md` | automatically, every session. It pulls in `context/*.md` with `@` lines |
| `.claude/rules/*.md` | automatically, every session |
| `uni/CLAUDE.md`, `second-brain/CLAUDE.md` | automatically, when Claude works in that folder |
| Skill names and descriptions | every session (just the one-line description) |
| A skill's full instructions | only when the task matches it |
| `.claude/agents/*.md` | when Claude hands a task to that agent |
| `hot-cache/current-state.md`, `docs/`, everything else | when Claude decides it needs it, or you point at it |
| G-Brain | when Claude calls a G-Brain tool (search, recall, remember) |

This "load only what is needed" design is why you can have lots of skills
without slowing anything down. **Everything you want Claude to always know
has to be in `CLAUDE.md`, `context/` or a rule.** It does not remember last
week's chat unless it was written down (in a file or G-Brain).

## The folder map

```
my-ai-os/
├── CLAUDE.md               the brain file: who you are, how to work, where things live
├── README.md               setup steps for humans
├── inbox.md                dump anything here, sort it later
├── context/                who you are (me, goals, priorities, study, connections)
├── hot-cache/              what is happening THIS week (changes often)
├── uni/                    university: units, notes, assessments, writing samples
├── second-brain/           everything else you learn, as a linked wiki (Obsidian-friendly)
├── projects/               things you build: agents, scripts, apps
├── specs/                  written plans made before building
├── decisions/              a log of real decisions and why
├── reminders/              future deadlines, one file each
├── templates/              fill-in forms (agent brief, session summary)
├── archives/               finished stuff, never deleted
├── docs/                   these guides
├── scripts/                helper scripts (check-setup.sh)
└── .claude/
    ├── settings.json       permissions: what Claude may do without asking
    ├── rules/              standing rules, loaded every session
    ├── skills/             your processes, one folder each
    └── agents/             specialist helpers
```

**Global vs local:** the root `CLAUDE.md` applies everywhere. A folder can
have its own `CLAUDE.md` (like `uni/CLAUDE.md`) that adds rules just for that
folder, on top of the root one. Think head office and branch office.

**Markdown, not Word:** every file Claude reads is `.md` (plain text with
`#` headings and `-` bullets). Claude reads it directly and cheaply. Keep
your own notes in markdown too.

## Skills vs agents vs rules

| | What it is | Example | Make one with |
|---|---|---|---|
| **Rule** | a habit that applies to every task | "never invent a source" | write a file in `.claude/rules/` |
| **Skill** | a process for one kind of task | "turn slides into notes" | `skill-builder` |
| **Agent** | a specialist that takes a whole task off Claude's hands, in its own separate context | "research this and give me 6 sources" | `agent-builder` |

Rule of thumb: the same instruction three times means it should be a skill.
The same mistake twice means it should be a rule.

## Memory: three layers

| Layer | What it holds | How long |
|---|---|---|
| The conversation | this session only | gone after `/clear` or closing |
| Files in this repo | context, notes, decisions, handoffs | forever (and in git history) |
| G-Brain | a searchable index of all of the above, plus facts Claude saves | as long as this computer keeps it. Every saved fact is also written to `context/memory-log.md` or `decisions/log.md`, so pushing to GitHub backs it up |

Files are the source of truth. G-Brain makes them searchable and adds quick
facts. See `gbrain.md`.

## A normal day

1. Open the folder in Orca (or a terminal) and start Claude.
2. Claude checks reminders and knows your context already.
3. Work: "make notes on the week 4 slides", "quiz me on MGT101 week 3",
   "help me plan my report", "build me an agent that...".
4. Say **"wrap up"**. The `handoff` skill updates your status, commits and
   saves to G-Brain.
