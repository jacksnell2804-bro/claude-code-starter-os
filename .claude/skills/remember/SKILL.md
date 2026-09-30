---
name: remember
description: Saves a fact, decision, preference or lesson to G-Brain long-term memory so it is available in every future session, and recalls saved memories. Use when the user says "remember this", "save this", "don't forget", "note that", "what did I decide about", "what do you remember about", or after a real decision or lesson.
---

# Remember

Needs G-Brain connected (`/mcp` lists `gbrain`). If it is not, say so, save
the item to `decisions/log.md` or `second-brain/raw/` instead so nothing is
lost, and suggest the `gbrain-setup` skill.

## Saving

Use the `remember` MCP tool. One claim per call.

- `fact`: one clear, self-contained sentence a stranger could understand in
  six months. Bad: "use the second one". Good: "For MGT101 A2 I chose the
  Porter's Five Forces angle over SWOT because the rubric weights industry
  analysis at 40%."
- `entity`: what it is about, as a slug, e.g. `units/mgt101`,
  `projects/deadline-agent`, `people/<name>`, `me`. Always set it; recall by
  entity misses facts without one.
- `kind`: `fact`, `preference`, `commitment` (a promise or deadline),
  `belief`, or `event`.
- `provenance`: where it came from, e.g. "user said in chat, 2027-03-04".

**Also write it to a file, every time**, so it is backed up by git and
survives a lost laptop (the G-Brain database itself is only on this
computer):
- a decision: append to `decisions/log.md` as
  `[YYYY-MM-DD] DECISION: ... | WHY: ... | CONTEXT: ...`
- anything else: append to `context/memory-log.md` as
  `- [YYYY-MM-DD] (<entity>, <kind>) <fact>` (create the file if needed)
Then the facts can always be rebuilt from the repo.

Confirm in one line: what was saved, under which entity.

## Recalling

- About one thing: `recall` with `entity`.
- A broader question: `recall` with `query`, or `search` / `query`, then
  `get_page` for the full page.
- Say where the answer came from. If nothing is found, say so; never fill a
  memory gap with a guess.

## Correcting

If a saved fact is wrong or out of date, save the corrected version (same
entity) and use `forget` on the old one. Tell the user both happened.


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
