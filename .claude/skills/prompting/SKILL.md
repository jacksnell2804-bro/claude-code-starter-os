---
name: prompting
description: Writes, improves or reviews a prompt for any AI model - a system prompt for an agent, instructions for a subagent, a prompt inside an app, or a one-off prompt for ChatGPT or Claude. Use when the user says "write a prompt", "improve this prompt", "system prompt", "why does the AI keep doing X", "how should I prompt this", or is building an agent.
---

# Prompting

## The five habits that matter most

1. **Say what "done" looks like.** The single biggest improvement to almost
   any prompt. "Write 5 flashcards as a CSV with front,back columns" beats
   "make some flashcards".
2. **Give context, not just instructions.** Who is this for, why does it
   matter, what have you already tried. Explain the reason behind a rule
   ("keep it short because it's read on a phone") and the model applies it
   better than a bare "keep it short".
3. **Show an example of a good output.** One real example beats three
   paragraphs describing it.
4. **Say what TO do, not only what not to do.** "Write in plain Australian
   English at a year-12 level" beats "don't be too formal".
5. **Make it prove its work.** "Cite the source for each claim", "run the
   code and show the output", "say what you could not verify".

## Structure for a system prompt (agents and apps)

```
You are <role> for <who>. <Why this job matters, in one line.>

## Your job
<The goal and definition of done.>

## Context
<What it needs to know: the user, the data, the situation.>

## How to work
<The process, or the quality bar if it's a judgement task.>

## Output format
<Exact format. An example.>

## Boundaries
<What it must not do, what it must ask about first.>
```

Longer inputs (documents, data) go at the top, the question at the bottom.
Wrap separate pieces in tags like `<document>...</document>` so the model
can tell them apart.

## Matching effort to the task

- Simple, well-defined task: short prompt, cheaper model (Haiku or Sonnet),
  low effort.
- Hard reasoning, multi-step, or a long unattended run: a clear goal and
  definition of done, a bigger model (Opus or Fable) and higher effort.
  Loosen the step-by-step instructions; strong models do better with a goal
  and constraints than a rigid script. For long runs, tell it to keep a
  notes file of what it has done and learned.

## Reviewing an existing prompt

Check it against the five habits and the structure above. Then **test it**:
run it on 3 to 5 real inputs, look at the outputs, change one thing at a
time. A prompt change you are sure will help can make things worse; the only
way to know is to run it.

## Output

The improved prompt in a code block, then 3 bullets on what changed and why.
Save it to a file if it belongs to an agent or project.


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
