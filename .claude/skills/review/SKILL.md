---
name: review
description: Reviews a finished build or any code change for bugs, security problems, missed requirements and over-complication before it is called done, using a fresh code-reviewer agent. Use after the build skill, before merging a branch, or when the user says "review it", "check this", "is this right", "look for bugs".
---

# Review

The person (or AI) who wrote code is the worst reviewer of it, because they
see what they meant, not what they wrote. So the review runs in a fresh
agent with no memory of writing it.

## Step 1, Collect what changed

`git diff main...HEAD` (or `git diff` for uncommitted work). If there is a
spec in `specs/`, include it.

## Step 2, Run the reviewer

Hand the diff and spec to the `code-reviewer` agent with this question, not a
generic "review this":

> Did this change introduce a bug, miss a requirement in the spec, open a
> security hole (secrets, unsafe input, data sent somewhere it should not
> go), or add complexity the spec did not need? For each finding: file,
> line, what goes wrong, and a concrete input that triggers it.

## Step 3, Check every finding yourself

Roughly a third of review findings are wrong. For each one, reproduce it
(run the triggering input) or drop it. Never "fix" something you could not
show was broken.

## Step 4, Fix, then re-check

- Fix confirmed findings, one commit per fix.
- Re-run the definition-of-done checks from the spec.
- Up to 3 review rounds. If the same problem keeps coming back, stop and
  explain it to the user instead of looping.

## Step 5, Report

A table: finding, confirmed or dropped, fixed or not. Then the definition of
done checklist with evidence. Then, if everything passed, suggest merging:
`git switch main && git merge build/<name>`, explained in one line.


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
