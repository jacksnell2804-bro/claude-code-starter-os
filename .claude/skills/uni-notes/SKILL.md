---
name: uni-notes
description: Turns university source material (lecture slides, PDFs, readings, tutorial sheets, lecture transcripts) into clean, exam-ready study notes in uni/units/<CODE>/notes/. Use when files are dropped in uni/_inbox/ or uni/units/<CODE>/raw/, or the user says "make notes", "summarise this lecture", "turn these slides into notes", or pastes lecture content.
---

# Uni notes

Rules for the uni folder live in `uni/CLAUDE.md`. Read it first.

## Step 1, Find the source and the unit

- Source is a file in `uni/_inbox/`, a file in `uni/units/<CODE>/raw/`, or
  pasted text.
- Work out the unit code. If it is not obvious, ask in one line.
- If the unit folder does not exist, copy `uni/units/_TEMPLATE-UNIT/` to
  `uni/units/<CODE>/`.
- Move inbox files into `uni/units/<CODE>/raw/`. If the source was pasted,
  save it as `raw/<slug>.md` first so nothing is lost.
- PDFs and PowerPoints: read them directly. If a file cannot be read, say
  which one and ask for a PDF export.

## Step 2, Write the note

One note per lecture or topic, at `uni/units/<CODE>/notes/<week-or-topic>.md`:

```markdown
---
title: "<CODE>, <Topic>"
unit: <CODE>
type: lecture | tutorial | reading
week: <n>
source: <raw file name>
created: YYYY-MM-DD
---

# <Topic>

## The 30-second version
3 to 5 bullets. What I would say if the exam gave me 30 seconds.

## Key concepts
### <Concept>
- **Definition:** <the source's exact wording, in quotes>
- **In plain English:** <one sentence>
- **Example:** <from the lecture if there is one>

## Frameworks and models
Tables for anything with parts (e.g. a 5-part model gets a 5-row table).

## Examples and case studies used
- <example>: the point it illustrates.

## Likely exam material
- Anything the lecturer flagged as important or examinable.
- Common mistakes they warned about.

## How it connects
- [[links]] to other notes in this or other units.

## Questions I still have
- Anything unclear or missing in the source. Do NOT invent answers.
```

Rules:
- Only what the source supports. Gaps go under "Questions I still have".
- Keep exact wording for definitions, lecturers mark against it.
- Match the style of existing notes in the same unit (read one first).

## Step 3, Update the unit index

Append to `uni/units/<CODE>/index.md`:
`- [<Topic>](notes/<file>.md): one-line summary · YYYY-MM-DD`

## Step 4, Report

Say: notes created, anything unclear, and offer the `study-quiz` skill on
the new note ("want me to quiz you on this?").


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
