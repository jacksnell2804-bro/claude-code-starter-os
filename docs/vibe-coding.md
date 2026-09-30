# Vibe coding: building things with AI when you are new to code

"Vibe coding" means describing what you want and letting the AI write the
code. It is a real way to build useful things fast. It also has a trap: it
is very easy to end up with something that looks finished and does not work,
or that you cannot fix. These habits avoid the trap.

## The 12 habits

1. **Spec before code.** Say "build me X" and the `spec` skill interviews you
   first. Ten minutes of questions saves hours of "that's not what I meant".
2. **Start tiny.** Version 1 does one thing. A deadline tracker that reads one
   file and prints what is due this week beats a half-working app with a
   login page. Add features only once v1 works.
3. **Plan mode for anything non-trivial.** Shift+Tab to plan mode, read the
   plan, then approve.
4. **One step at a time, test every step.** "Build step 1 and run it" beats
   "build the whole thing". If step 3 breaks, you know it was step 3.
5. **Make it prove it works.** Never accept "this should work". Ask "run it
   and show me the output". See `.claude/rules/verify-before-done.md`.
6. **Commit every time something works.** A commit is a save point. When the
   next change breaks everything, `git` takes you back. Say "commit this".
7. **Branches for experiments.** "Try this on a new branch" means `main`
   always works.
8. **Paste the whole error.** Do not describe it ("it's broken"). Copy the
   full error text or screenshot it, and paste it in. Then say "debug this".
9. **Ask it to explain.** "Explain what you just built like I'm new to code"
   (or use the `explainer` agent). If you cannot roughly explain your own
   project, you cannot fix it later. This is also how you actually learn.
10. **Get a second opinion on your own code.** Say "review it". A fresh
    reviewer agent finds bugs the builder was blind to.
11. **Secrets never go in code.** API keys go in a `.env` file, which git
    ignores. If you ever paste a key into chat or commit it, replace the key.
12. **When it goes in circles, reset.** If Claude has tried the same fix
    three times, stop. `/clear`, then describe the problem fresh, or switch
    to Opus with higher effort, or say "stop, explain what you think is
    wrong before changing anything".

## Good prompts vs weak prompts

| Weak | Strong |
|---|---|
| "make me an app" | "spec a tool that reads my assessments from context/study.md and tells me what's due in the next 14 days" |
| "fix it" | "here's the full error: <paste>. Debug this. Don't change anything until you've told me the cause." |
| "make it better" | "the output is too long. Make each item one line: unit code, assessment, days left." |
| "is this right?" | "review this against specs/deadline-tracker.md and show me any requirement it misses" |

The pattern: **what you want, what done looks like, and any limits.**

## Useful phrases

- "Before you start, tell me your plan."
- "Do only step 1, then stop and show me."
- "Run it and show me the real output."
- "What could go wrong with this?"
- "Explain that in plain English."
- "Undo that." / "Go back to the last commit." (Esc Esc also rewinds the chat.)
- "Make this a skill so you do it the same way next time."
- "Why did you do that?"

## When to NOT vibe code

- Anything handling money, passwords, or other people's personal data,
  until you understand the code or someone experienced has reviewed it.
- Anything graded where your university requires you to write the code
  yourself. Check the unit's AI policy.

## Where to build

Every project gets a folder in `projects/`. Start with the `spec` skill;
it creates the folder, the README and the plan. See `projects/README.md`.
