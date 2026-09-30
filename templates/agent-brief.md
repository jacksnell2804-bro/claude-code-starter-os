# Agent brief template

Use this whenever you hand a task to an agent (a subagent, a scheduled task,
or an agent you built). Six lines, every time. See
`.claude/rules/goals-not-steps.md` for why.

```
GOAL: <the outcome in one sentence, not a list of steps>
DONE MEANS: <something checkable: a file with X in it, a passing test, 5 cited sources>
BOUNDARY: <what it can decide alone; what it must ask about first>
TOOLS: <what it can touch, least access that does the job>
CHECK-IN: <when it reports and what the report contains>
VERIFY: <what it must check before it says it is finished>
```

## Example

```
GOAL: Find 6 peer-reviewed sources on remote work and employee productivity since 2020.
DONE MEANS: uni/assessments/MGT101-A2/research.md has 6 rows, each with APA citation, DOI or link, and an exact quote.
BOUNDARY: choose sources freely; ask before including anything older than 2020.
TOOLS: web search and read only. No file edits except research.md.
CHECK-IN: once, at the end, with the table and a count of how many are peer-reviewed.
VERIFY: every link opens and every quote appears on the page it cites.
```
