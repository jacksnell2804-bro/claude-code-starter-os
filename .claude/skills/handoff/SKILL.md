---
name: handoff
description: Closes a work session properly - summarises what actually changed (from git, not memory), separates what was tested from what was only assumed, updates hot-cache/current-state.md, commits, saves a summary to G-Brain, and writes the next step. Use when the user says "wrap up", "done for today", "end session", "close this out", "what's next", or "handoff".
---

# Handoff

A session that ends without a handoff forgets everything the next session
needs. This takes two minutes.

## Step 1, Read what actually happened

Do not rely on memory of the chat. Run:
```bash
git status
git log --oneline -10
git diff --stat
```

## Step 2, Sort it honestly

| Bucket | What goes in it |
|---|---|
| **Done and checked** | things that were run and shown to work, with the evidence |
| **Done, not checked** | written but not tested; say why |
| **Not done** | started, blocked or skipped |
| **Needs the user** | a decision, a login, a secret, something only they can do |

## Step 3, Update the files

- `hot-cache/current-state.md`: rewrite "This week", "Due soon", "Blocked
  on" and "Next step". Delete stale lines; keep it to one screen.
- `decisions/log.md`: any real decision made this session.
- `reminders/`: any new future deadline.
- If a mistake happened twice this session, propose a rule for
  `.claude/rules/` (show it, add it only with a yes).

## Step 4, Commit

Show `git status`, then commit the session's files by name with a clear
message. Never include `.env` or anything that looks like a secret.

## Step 5, Save to G-Brain

If connected:
1. `remember` one fact: a 2 to 3 sentence summary of the session, entity
   `sessions`, kind `event`, provenance "session close, <date>".
2. `sync_brain` with `source_id: "mybrain"`, `no_pull: true` and
   `no_embed: true` (commit first: sync reads what git has committed), so today's
   notes are searchable next time.
If not connected, skip and say so in one line.

## Step 6, Tell the user

```
Session closed.
Done and checked: ...
Not checked: ...
Needs you: ...
Next step: <one concrete thing to start with next time>
```

Optionally, a ready-to-paste first message for the next session.


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
