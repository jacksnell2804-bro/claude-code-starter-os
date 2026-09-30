---
name: research
description: Researches a topic properly with real, cited sources, cross-checks claims across more than one source, and saves the findings as a markdown file. Use when the user says "research X", "find sources on", "look into", "what does the evidence say about", "deep dive", or needs sources for an assignment or a build decision.
---

# Research

## Step 1, Pin the question

Restate the question in one sentence and ask the user to confirm. Ask what
it is for (assignment, build decision, curiosity) because that sets how
rigorous the sources need to be. For uni work: prefer peer-reviewed journals,
government and industry reports, and textbooks over blogs.

## Step 2, Search wide, then read deep

- For anything bigger than a quick lookup, hand it to the `researcher` agent
  (it runs on a cheaper model and keeps the search clutter out of this chat).
  For parallel angles, launch several researcher agents in one message.
- Use WebSearch to find candidates. Read the actual page, not just the
  search snippet. For academic work, Google Scholar and the university
  library database are better than a general search, so tell the user when
  a library login would get better sources.
- **Every claim needs a source you actually opened.** Two independent
  sources for anything important or surprising.

## Step 3, Write it up

Save to the right place (`uni/assessments/<...>/research.md` for uni work,
`second-brain/raw/` for general learning, `projects/<name>/` for builds):

```markdown
# Research: <question>
*Date: YYYY-MM-DD*

## Answer in 3 lines

## Key findings
| Finding | Source | Confidence |
|---|---|---|

## Sources
1. <full citation in the user's referencing style>, <link>, "<exact quote>"

## Where sources disagree

## What I could not verify
```

## Step 4, Report

The 3-line answer, the number of sources and how many were primary or
peer-reviewed, and anything that could not be verified. Offer to save the
key points to the second brain (`wiki` skill) or G-Brain (`remember`).


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
