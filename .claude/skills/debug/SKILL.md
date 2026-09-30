---
name: debug
description: A disciplined method for finding and fixing bugs - reproduce it reliably first, then narrow down the cause with evidence, fix the root cause, and prove the fix. Use when something is broken, throwing errors, giving wrong output, or when the user says "debug this", "it's not working", "why is this broken", "I get an error".
---

# Debug

Guessing at fixes is how a one-bug problem becomes a three-bug problem.

## Step 1, Reproduce it (this is most of the job)

Get a way to make the bug happen on demand, ideally one command:
a failing test, a script with the bad input, a curl request, a browser step.
If you cannot make it happen reliably, you cannot know when it is fixed.
Say so and ask the user for the exact steps, the full error text, or a
screenshot.

## Step 2, Read the actual error

Read the whole error message and stack trace. The answer is in it more often
than not. Explain to the user, in one plain line, what the error means.

## Step 3, Narrow it down with evidence

- Form 2 or 3 hypotheses. For each: what would you expect to see if it were true?
- Test the cheapest one first: add a print/log, check a value, run a smaller
  input. Let evidence kill hypotheses, do not argue with it.
- If it worked before, find what changed: `git log`, `git diff`, or
  `git bisect` (explain it if you use it).
- For a stubborn bug, hand it to the `debugger` agent with the repro command.

## Step 4, Fix the cause, not the symptom

A try/except that hides the error is not a fix. Change the thing that is
actually wrong. Remove any temporary debug prints afterwards.

## Step 5, Prove it

- Run the repro from Step 1: it must now pass.
- Run whatever else could have been affected.
- Tell the user: what was wrong, why, what changed, and how you proved it.
- If this kind of bug could happen again, suggest a test that would catch it.


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
