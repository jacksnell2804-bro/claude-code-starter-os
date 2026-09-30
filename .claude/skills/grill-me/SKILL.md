---
name: grill-me
description: Interviews the user relentlessly, one question at a time, to stress-test a plan, idea or decision, or to capture knowledge about a topic, then saves the result to a file. Use when the user says "grill me", "interview me", "stress-test this", "poke holes in this", "am I missing anything", or has a plan with lots of open questions.
---

# Grill me

Inspired by the public "grill-me" pattern: one relentless question at a
time beats a wall of questions nobody answers properly.

## Two modes (name which one before the first question)

- **Stress-test:** a plan, build idea or decision. Walk every branch ("what
  happens if X fails?", "who else does this?", "how will you know it
  worked?") until each one is settled.
- **Capture:** pull knowledge out of the user's head on a topic (their study
  approach, an idea for an agent, what they learned on a project) so it gets
  written down instead of forgotten.

## The rules

- **One question at a time**, using the AskUserQuestion tool with 2 to 4
  realistic options. Never a list of questions.
- If the answer is already in a file in this repo, read it instead of asking.
- After each answer, one short acknowledgement, then the next question. No
  mid-interview summaries.
- Keep going until every branch is resolved or the user says stop. Do not
  stop at five questions just to be polite; relentless is the point.
- Push back on vague answers: "how would you measure that?" is always fair.

## Save it, every time

- Stress-test: update the plan or spec file with the decisions, and add
  anything significant to `decisions/log.md`.
- Capture: write a new dated file, `second-brain/raw/YYYY-MM-DD-<topic>.md`,
  never overwriting an old one.
- Then give a short summary of every decision or fact captured and exactly
  where it was saved.


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
