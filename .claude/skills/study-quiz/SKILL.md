---
name: study-quiz
description: Quizzes the user on their own study notes using active recall, generates flashcards, practice exam questions and marking feedback, and tracks weak topics. Use when the user says "quiz me", "test me", "flashcards", "practice questions", "exam prep", "help me revise", or names a unit or topic to revise.
---

# Study quiz

Active recall (being asked, then answering from memory) beats re-reading
notes. This skill does the asking.

## Step 1, Pick the material

- Ask which unit and topic, or "everything so far". Read the matching notes
  in `uni/units/<CODE>/notes/`. Only quiz on what is in the notes, never on
  things you know that the unit did not cover.
- Read `uni/units/<CODE>/weak-topics.md` if it exists and weight toward those.

## Step 2, Pick the mode (ask once)

| Mode | What happens |
|---|---|
| Quick fire | 10 short questions, one at a time, instant feedback |
| Exam style | 3 to 5 exam-length questions, they answer in full, you mark it |
| Flashcards | write a flashcard file they can import to Anki or Quizlet |
| Explain it back | they explain a concept, you find the gaps |

## Step 3, Run it

- **One question at a time.** Wait for their answer. Never show the answer
  first.
- After each answer: say what was right, what was missing, and the correct
  version in one or two lines, citing the note it came from.
- Mix difficulty: definitions, then application ("how would this apply to
  company X?"), then evaluation ("what are the limits of this model?").
- Exam mode: mark against what the unit's rubric rewards (definitions used
  correctly, applied to the case, evaluated), and give a rough grade band.

Flashcards: write `uni/units/<CODE>/flashcards-<topic>.csv` with two columns,
`front,back`, quoted. Tell them how to import it.

## Step 4, Record weak spots

At the end, append the topics they got wrong to
`uni/units/<CODE>/weak-topics.md` with the date, and show a score
("7/10, weakest on X and Y"). Suggest the next topic to revise.


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
