---
name: build
description: Builds exactly what a spec in specs/<name>.md describes, step by step, testing as it goes, with no extra features. Use after the spec skill has produced a spec, or when the user says "build it", "go ahead", "implement it", "start building", "write the code".
argument-hint: "[spec-name]"
---

# Build

## Before starting

1. Read the spec. If no name was given, list `specs/` and ask which one.
2. Make sure the current state is committed (`git status`). Then make a
   branch: `git switch -c build/<spec-name>`. Explain in one line that a
   branch is a safe copy to experiment on.
3. If the build is more than a handful of files, use plan mode first: show
   the plan (files to create, order, how each part gets tested) and get a yes.
4. The code goes in `projects/<spec-name>/`, with a `README.md` from
   `projects/_template/README.md`.

## While building

- Build one requirement at a time. **After each one, run it and check it
  works** before starting the next. Small steps that each work beat one big
  step that does not.
- Build only what the spec says. No bonus features, no refactoring unrelated
  code, no invented requirements. If something is ambiguous, pick the
  simplest reading and note it.
- Secrets go in `projects/<name>/.env` (git-ignored), with a `.env.example`
  listing the variable names only.
- Commit after each working requirement with a clear message.
- Explain what you are doing in plain language as you go, briefly. The user
  is learning.

## When done

Output this checklist, with evidence for each tick (a command and its real
output, a screenshot, a test result):

```
Build complete:
- [x] REQ-1: <what was built> - checked by <how>, result <what happened>
- [x] REQ-2: ...
- [ ] REQ-3: <skipped, and why>
```

Then say: "say `review it` and I'll check it for bugs before we call it done."


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
