---
name: wiki
description: Maintains the second-brain/ knowledge wiki - ingesting new sources (articles, videos, notes, anything learned) into linked pages, answering questions from it with citations, and health-checking it for gaps and contradictions. Use when the user says "ingest this", "save this to my second brain", "add to my wiki", "what do I know about", "query the wiki", "lint the wiki", or "health check my notes".
---

# Wiki

The full rules are in `second-brain/CLAUDE.md`. Read it first, every time.

## Ingest ("ingest this", "save this")
1. Get the source: a file in `second-brain/raw/`, a URL, or pasted text. Save
   pasted or fetched content to `second-brain/raw/<topic>/<slug>.md` first.
2. Share the 2 or 3 key takeaways and check the emphasis with the user.
3. Create a source page, and create or update the concept, entity and
   overview pages it touches (see `second-brain/CLAUDE.md` for the layout).
4. Link everything with `[[Page Title]]`.
5. Update `second-brain/index.md` and append to `second-brain/log.md` LAST.
6. Commit the new pages. If G-Brain is connected, call the `sync_brain` MCP
   tool (`source_id: "mybrain"`, `no_pull: true`, `no_embed: true`) so they
   are searchable. Use the MCP tool, not the terminal: the local brain can
   only be open in one process at a time.

## Query ("what do I know about X")
1. Read `second-brain/index.md`, then the relevant pages. If G-Brain is
   connected, also run a `query` through it.
2. Answer with `[[Page]]` citations. If the wiki does not cover it, say so
   rather than filling the gap from general knowledge without saying.
3. Offer to save a good answer as an analysis page.

## Lint ("health check")
Report a numbered list: contradictions, pages with no links in, concepts
mentioned but with no page, stale claims, missing links. Fix only with a yes.


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
