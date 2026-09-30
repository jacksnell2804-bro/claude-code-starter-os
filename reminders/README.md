# Reminders

One file per future deadline or follow-up, named
`YYYY-MM-DD-short-description.md`. Claude checks this folder at the start of
a session and tells you about anything due in the next 30 days.

Template:

```markdown
---
due: 2027-04-12
status: open
---
# MGT101 A2 report due

What: 2000-word report, 40%. Brief in uni/assessments/MGT101-A2/.
Before then: outline done by 2027-04-01, draft marked by 2027-04-08.
```

When it is handled, change `status: open` to `status: done`. Do not delete it.
