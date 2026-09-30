---
name: skill-builder
description: Creates a new skill (a reusable, step-by-step process Claude follows every time) or fixes one that does not fire or gives inconsistent results. Use when the user says "make a skill", "turn this into a skill", "I keep asking for the same thing", "save this as a process", "why isn't my skill working", or has just finished a task they will repeat.
---

# Skill builder

A skill is a recipe: the process written down once so Claude stops
improvising and gives the same quality every time. It is a folder
`.claude/skills/<name>/` with a `SKILL.md` inside.

**How it loads:** only the `name` and `description` are always visible to
Claude. The rest loads only when Claude decides the skill applies. So the
description decides whether it ever fires. Write it like a trigger, not a
summary.

## Step 1, Start from a real example, not a description

Best way to build a skill: **do the task together once, properly**,
correcting as you go. Then turn that run into the skill. If they have a past
output they liked (a set of notes, a report), use it as the target and work
backwards: what went in, what was done to it, why is it formatted that way,
what would make them reject it?

## Step 2, One job, one trigger

A skill does ONE thing. "Make lecture notes" and "quiz me on notes" are two
skills. Get 2 or 3 real phrases the user would say to trigger it.

## Step 3, Decide how strict to be

| Task type | Write it as |
|---|---|
| Data, formatting, anything with a right answer | exact steps, exact output template |
| Judgement, writing, creative | goal, quality bar, examples, things to avoid |

## Step 4, Write it

```markdown
---
name: <kebab-case, becomes /name>
description: <What it does>. Use when <situation>. Triggers on "<phrase>", "<phrase>".
---

# <Name>

## Step 1, ...
## Step 2, ...

## Output
<exact format and where it is saved>
```

Keep it under about 300 lines. Put long reference material in a separate
file in the same folder and link to it ("see `reference.md`").

Every skill ends with the self-improvement loop. Copy the block from the end
of this file exactly.

Optional frontmatter: `disable-model-invocation: true` (only runs when the
user types `/name`, useful for anything with side effects),
`argument-hint`, `allowed-tools`.

## Step 5, Test it

1. Start a new session (or run `/clear`) so it loads fresh.
2. Say one of the trigger phrases WITHOUT naming the skill. Does it fire?
   If not, the description needs the words the user actually says.
3. Check the output against the real example from Step 1.
4. Fix, repeat. Then commit.

## Step 6, Improve it over time

When a skill gets something wrong, do not just fix the one output. Say
"update the skill so this doesn't happen again". The self-improvement loop
at the end of every skill proposes that edit automatically.


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
