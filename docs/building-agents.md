# Building your own agents

"Agent" can mean three different things. Pick the lightest one that does
the job.

## Level 1: a skill (a process Claude follows)

**What:** a markdown file of steps in `.claude/skills/<name>/SKILL.md`.
Claude follows it whenever the task matches.
**Good for:** anything you do repeatedly in chat, the same way each time.
**Example:** "every Monday, look at my reminders and hot-cache and plan my week".
**Make one:** say "make a skill for..." (`skill-builder`), or even better, do
the task once with Claude, correct it until it is right, then say "turn that
into a skill".

## Level 2: a subagent (a specialist helper)

**What:** a markdown file in `.claude/agents/<name>.md` with a name, a
description, its tools, its model, and its instructions. When Claude hands
it a task, it works in its **own separate context**, then returns just the
result. That keeps your main chat clean and lets it use a cheaper model.
**Good for:** self-contained jobs: research, marking, reviewing, summarising
a long document.
**Examples already here:** `researcher`, `tutor`, `marker`, `code-reviewer`,
`debugger`, `explainer`. Open them; they are short and readable.
**Make one:** say "make an agent that..." (`agent-builder`). Or type
`/agents` to create and manage them from a menu.
**Use one:** "use the researcher agent to find 6 sources on...". Claude also
picks them itself when a task matches their description. Several can run
in parallel: "use three researcher agents, one per angle".

A subagent file looks like this:

```markdown
---
name: deadline-checker
description: Reads my reminders and hot-cache and lists everything due in the next 14 days, most urgent first. Use when I ask what's due or to plan my week.
tools: Read, Glob, Grep
model: haiku
---

You check deadlines for a university student.

## How to work
1. Read every file in reminders/ with status: open.
2. Read hot-cache/current-state.md.
3. List items due in the next 14 days.

## What to hand back
A table: due date, days left, what, where the brief is. Most urgent first.

## Never
Edit any file.
```

Key fields:
| Field | Means |
|---|---|
| `name` | how it is called |
| `description` | **when Claude should use it.** Write it as a trigger |
| `tools` | what it can use. Least access that works. Leave out Write/Edit for read-only agents |
| `model` | `haiku`, `sonnet`, `opus`, `fable`, or `inherit` |

The body is the agent's ENTIRE world. It does not see your chat, so put
everything it needs in the file or in the brief it is given (see
`templates/agent-brief.md`).

## Level 3: an agent that runs on its own

**What:** something that runs without you in the chat: on a schedule, or as
its own program.

Two ways:
- **Scheduled tasks** (`/schedule`): run a prompt on a timer, e.g. "every
  Sunday at 6pm, plan my week". These run **in the cloud** on a fresh copy of
  your GitHub repo, so they only see what you have pushed, and they cannot
  reach your local G-Brain. Great for things that only need your repo files.
  For something that needs your local setup, `/loop` repeats a task while
  your Claude session stays open.
- **Claude Agent SDK**: write a small Python or TypeScript program that uses
  the same engine as Claude Code, with your own tools. This is how you build
  a real product or a bot. It bills per use to an API key (from
  console.anthropic.com), separately from your Claude subscription, so set a
  spending limit on the key.

Start with levels 1 and 2. Most people never need level 3 for personal use,
and the habits you learn at levels 1 and 2 (clear goals, least access,
testing on real tasks) are exactly what level 3 needs.

## The brief matters more than the agent

Whatever level, an agent is only as good as what it is told. Every brief:
goal, what done looks like, boundaries, tools, when to report, what to check.
That is `.claude/rules/goals-not-steps.md`, and the fill-in form is
`templates/agent-brief.md`.

## Ideas for first agents

| Agent | Level | Model |
|---|---|---|
| Deadline checker (what is due, most urgent first) | subagent | haiku |
| Lecture-to-flashcards | skill (already have `study-quiz`) | sonnet |
| Reading summariser (PDF in, one-page summary out) | subagent | sonnet |
| Weekly planner (Sunday night, plans your week) | skill + `/schedule` (needs a pushed repo) | sonnet |
| Job/internship tracker | project in `projects/` | sonnet |
| Essay argument stress-tester | already have `grill-me` + `marker` | opus |
