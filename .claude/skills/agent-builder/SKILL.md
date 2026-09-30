---
name: agent-builder
description: Designs and creates a new custom agent - usually a Claude Code subagent file in .claude/agents/, or, for something that must run on its own outside Claude Code, a small Claude Agent SDK project in projects/. Interviews first, picks the right model and tools, writes it, then tests it on a real task. Use when the user says "make an agent", "build an agent that", "I want a helper that", "create a subagent", or describes a repeated job they want handed off.
---

# Agent builder

Read `docs/building-agents.md` if you need the background.

## Step 1, Is an agent the right tool?

Pick the lightest thing that works, and tell the user which and why:

| If the job is... | Build a... | Lives in |
|---|---|---|
| A repeatable process Claude should follow in this chat | **skill** (use `skill-builder`) | `.claude/skills/<name>/SKILL.md` |
| A specialist Claude hands a self-contained task to (research, review, marking), keeping clutter out of the main chat | **subagent** | `.claude/agents/<name>.md` |
| Something that runs on a schedule or on its own, with nobody at the keyboard | **scheduled task** (`/schedule`) or an **Agent SDK app** | `projects/<name>/` |

Most first agents should be a subagent. Only build an SDK app when it
genuinely needs to run without Claude Code open.

## Step 2, Interview (one question at a time, AskUserQuestion)

1. **Job:** what does it do, in one sentence? Get one real example task.
2. **Trigger:** when should Claude hand work to it? (This becomes the
   `description`, which is how Claude decides to use it.)
3. **Inputs and output:** what does it get given, and what exactly does it
   hand back? (A file? A summary? A table?)
4. **Tools:** what does it need to touch? Give it the LEAST access that
   works. A researcher needs web search and read, not file editing.
5. **Model:** see the table below. Default to `sonnet`.
6. **Never:** what must it never do?

Model choice:
| Model | Use for |
|---|---|
| `haiku` | fast, simple, high-volume jobs (sorting, extracting, formatting) |
| `sonnet` | the default: research, writing, most coding, marking |
| `opus` | hard reasoning: tricky bugs, architecture, careful critique |
| `inherit` | same model as the main chat |

## Step 3, Write the subagent file

`.claude/agents/<name>.md`:

```markdown
---
name: <kebab-case-name>
description: <what it does>. Use when <trigger>. <One line on what it returns.>
tools: Read, Grep, Glob, WebSearch, WebFetch
model: sonnet
---

You are <role>. <One paragraph: the job and who it serves.>

## How to work
1. ...
2. ...

## What to hand back
<exact format of the result>

## Never
- ...

## Before you finish
Check <definition of done>. Say what you verified and what you could not.
```

The body is the agent's whole world: it does NOT see this chat. Put
everything it needs in the file or in the brief it gets handed.

## Step 4, Test it on a real task

Run it once on the real example from Step 2 (tell the user they can also
call it with "use the <name> agent to..."). Show the result. Ask: is this
what you wanted? Fix the file based on their answer, and run it again.
An agent that has never been tested on a real task is not finished.

Note: new agent files are picked up in a new session or via `/agents`.

## Step 5, Record it

Add it to the agents list in `CLAUDE.md` and commit.

## For an Agent SDK app (Step 3b)

If Step 1 said SDK: run the `spec` skill first, then build in
`projects/<name>/` with the Claude Agent SDK (TypeScript or Python). Look up
the current SDK docs before writing code, do not rely on memory. The API key
goes in `projects/<name>/.env`, never in code. Point out that SDK apps bill
per token to an API key, separately from a Claude subscription.


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
