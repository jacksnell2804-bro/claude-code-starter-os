---
name: spec
description: Interviews the user about what they want to build, then writes a clear spec to specs/<name>.md before any code is written. Use before building anything bigger than a few minutes of work - an agent, script, app, automation or website. Triggers on "build me", "make me", "create", "I want an agent that", "automate", "set up", "spec this", "plan before building".
---

# Spec

The cheapest bug to fix is the one caught before any code exists. This skill
turns a vague idea into a written plan the `build` skill can follow exactly.

## Process

1. Ask ONE focused question at a time (AskUserQuestion, 2 to 4 options).
2. Keep asking until you clearly know:
   - **Objective:** what problem does this solve, for whom?
   - **Requirements:** what exactly must it do?
   - **Constraints:** what must it NOT do? Budget? Tools it must or must not use?
   - **Edge cases:** weird inputs, empty data, no internet, wrong file type.
   - **Definition of done:** how will we check, objectively, that it works?
3. Suggest the simplest version that solves the problem. Beginners almost
   always over-scope; say so kindly and propose a "version 1".
4. Do NOT write code. Spec only.

## Output

Save to `specs/<short-kebab-name>.md`:

```markdown
# Spec: <name>

## Objective
One sentence.

## Version 1 scope
What is in, and what is deliberately left for later.

## Requirements
- REQ-1: <specific, testable>
- REQ-2: ...

## Edge cases
- EDGE-1: <input or situation it must handle>

## Tools and access
What it needs (APIs, keys, MCP servers) and where secrets will live (.env).

## Definition of done
- [ ] REQ-1: <how to check it>
- [ ] REQ-2: <how to check it>
- [ ] Edge cases: <how to check them>
```

Vague requirements ("works well", "looks nice") are not allowed. Push back
until each one can be checked.

Show the spec, get a yes, save it, commit it, then say: "say `build it` when
you're ready".


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
