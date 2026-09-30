---
name: first-run
description: Sets up this AI operating system for a new user by interviewing them and filling in context/me.md, goals.md, current-priorities.md, study.md and hot-cache/current-state.md. Use on first use, when context files still contain [FILL IN] placeholders, or when the user says "set me up", "first run", "start here", "onboard me", or "fill in my context".
---

# First run

Turns the blank template into a system that knows who the user is. This is
the most valuable 20 minutes they will spend in this repo: every future
answer is shaped by what goes into `context/`.

## Step 1, Explain what is about to happen (3 lines max)

Tell them: you will ask about 10 short questions, one at a time, then fill in
their context files, then show them what changed. They can skip any question.

## Step 2, Interview, one question at a time

Use the AskUserQuestion tool for every question, with 2 to 4 realistic
options (they can always type their own answer). Never ask a list at once.
Acknowledge each answer in one short line, then ask the next.

Cover, in this order:
1. Name, and what they want to be called.
2. University, degree, and year.
3. This semester's units (codes and names). Ask them to paste the list.
4. For each unit: the assessments and due dates, if they know them.
5. Their university's AI-use policy. If they do not know it, note
   "unknown, check before graded work" and tell them where it usually lives
   (unit outline, or the university's academic integrity page).
6. Referencing style (APA 7, Harvard, etc.).
7. What they want help with most (uni, building agents, both).
8. Their tech level (never coded / a bit / comfortable).
9. How they like answers (short dot points, detailed, examples first).
10. One or two goals for this semester, ideally with a number.

## Step 3, Write the files

- Replace every `[FILL IN]` in `context/me.md`, `context/goals.md`,
  `context/current-priorities.md`, `context/study.md` with their answers.
  Anything they skipped becomes "not set yet", never an invented answer.
- For each unit, copy `uni/units/_TEMPLATE-UNIT/` to `uni/units/<CODE>/` and
  fill in its `index.md` header.
- Fill in `hot-cache/current-state.md` with the nearest deadlines.
- Add a `reminders/` file for any assessment due in the next 30 days.

## Step 4, Show and commit

- Show a short table: file, what was filled in.
- Explain git in one sentence ("a commit is a save point you can go back to"),
  then commit with `git add context/ hot-cache/ uni/ reminders/` and
  `git commit -m "Set up my context"`.

## Step 5, Next steps

Suggest, in this order:
1. Connect long-term memory: "say `set up g-brain`".
2. Drop some lecture slides into `uni/_inbox/` and say "make notes".
3. Read `docs/how-it-works.md` (10 minutes).


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
