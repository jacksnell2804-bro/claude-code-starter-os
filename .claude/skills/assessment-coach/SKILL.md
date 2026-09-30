---
name: assessment-coach
description: Coaches the user through a university assessment (essay, report, reflection, case study, presentation) from brief to final check - decoding the task and rubric, finding real sources, outlining, critiquing drafts against the rubric, fixing referencing, and removing AI-sounding writing. Use when the user says "help with my assignment", "I have an essay due", "check my draft", "mark this against the rubric", "plan my report", or names an assessment.
---

# Assessment coach

Governed by `.claude/rules/academic-integrity.md`.

## Step 0, Check the AI-use policy (always first)

Read `context/study.md` for the university's AI-use policy and any rule for
this unit or this assessment. Some units ban AI help on an assessment
entirely; some allow research and feedback but not drafting.

- **Policy unknown:** stop. Tell them where it usually lives (the unit
  outline, the assessment brief, the university's academic integrity page)
  and ask them to paste the relevant line. Do nothing else on this
  assessment until it is recorded in `context/study.md`.
- **Policy known:** write down, at the top of `brief.md`, which of the steps
  below it permits, and only do those.

Workspace: `uni/assessments/<CODE>-<name>/` (copy `_TEMPLATE` if missing).

## Step 1, Decode the task

Get the brief and rubric into `brief.md` (they can paste it or drop the PDF).
Then give them a one-screen breakdown:
- **The task verb** (analyse, evaluate, discuss, recommend) and what that
  verb actually requires.
- **The rubric, ranked by marks.** Where the marks are is where the words go.
- Word count, format, referencing style, due date.
- **The unit frameworks the marker expects**, pulled from `uni/units/<CODE>/notes/`.
- The three most common ways students lose marks on this kind of task.

Add the due date to `hot-cache/current-state.md` and a file in `reminders/`.

## Step 2, Research (real sources only)

- Start with unit notes and set readings. Then find more with the `research`
  skill or the `researcher` agent.
- Log every source in `research.md`: full citation, the exact quote or
  statistic, page number, and a link. **Never invent a source, quote, number
  or page.** If it cannot be verified, it does not go in.

## Step 3, Plan

Build an outline in `outline.md` with them, not for them:
- A one-sentence thesis or position (ask them what they actually think).
- Sections mapped to rubric criteria, with a word budget per section.
- Which source and which framework supports each point.

## Step 4, Drafting

- **They write**, you coach, unless the policy allows AI drafting and they ask.
- If they want help getting unstuck: ask questions ("what is the strongest
  counter-argument?"), give a model paragraph on a DIFFERENT topic to show
  structure, or rewrite one sentence to show the idea, then hand it back.
- If AI drafting is allowed and requested: match their voice from
  `uni/writing-samples/` (ask for samples if there are none) and mark the
  draft clearly as a draft they must rewrite in their own words.

## Step 5, Critique the draft (the high-value step)

Hand the draft to the `marker` agent, or mark it yourself against the rubric:
- A grade band per criterion, with the specific sentence that earned or lost it.
- The 3 changes that would add the most marks, in order.
- Referencing check: every in-text citation has a reference, every reference
  is cited, the style is consistent.
- AI-tell check: em dashes, "delve", "navigate the landscape", "it is
  important to note", stacked "Furthermore/Moreover", uniform sentence length,
  empty "In conclusion" restatements. Point them out; they fix them.
- Word count against the brief's actual limit, and what it excludes
  (references, headings). Assume there is NO tolerance unless the brief says so.

## Step 6, Final check

A checklist: answers the task verb, uses the frameworks correctly, every
claim evidenced, critical not descriptive, referencing clean, within the
brief's word limit, and one reminder that they own the submission and must read every line.


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
