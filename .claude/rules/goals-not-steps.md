# Give goals, not steps (for every agent you hand work to)

Loaded every session. Applies whenever Claude hands a task to a subagent, and
whenever I write a prompt for an agent I am building.

**A prompt asks for a step. A good brief asks for an outcome.** Every brief
you give an agent should cover these six things, even in one line each:

1. **Goal.** The outcome, in one sentence. Not a list of steps.
2. **Definition of done.** Something checkable: "a file at X with Y in it",
   "the test passes", "5 sources with links". Not "let me know how it goes".
3. **Boundary.** What it can decide alone, and what it must ask about.
4. **Tools and scope.** What it can touch. Least access that does the job.
5. **Check-in.** When it reports back, and what the report contains.
6. **Verify.** What it must check before saying it is finished.

If you cannot write the definition of done, the task is still too vague to
hand off. Tighten it first.

The fill-in form is `templates/agent-brief.md`.
