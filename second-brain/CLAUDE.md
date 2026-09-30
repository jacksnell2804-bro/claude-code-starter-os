# Second brain (knowledge wiki) rules

This folder is a personal wiki that Claude maintains. You collect sources
(articles, videos, podcasts, ideas, things you learned); Claude does the
bookkeeping: summarising, linking, filing and flagging contradictions.
It works as an Obsidian vault too (open this folder in Obsidian to browse it
as a linked graph), but Obsidian is optional.

## Layout

```
second-brain/
├── CLAUDE.md          these rules
├── index.md           catalogue of every page (Claude keeps it current)
├── log.md             append-only history of every ingest
├── raw/               original sources, never edited
└── <Topic>/           one folder per subject, e.g. AI-Agents/, Marketing/
    ├── overview.md    the big-picture summary of the topic
    ├── sources/       one page per source
    ├── concepts/      ideas, frameworks, terms
    └── entities/      people, companies, tools
```

## Page frontmatter

```yaml
---
title: "Page Title"
type: overview | source | concept | entity | analysis
tags: [ai, agents]
created: YYYY-MM-DD
updated: YYYY-MM-DD
sources: [raw-file-slug]
---
```

## Rules

- `raw/` is read-only.
- Link with `[[Page Title]]` on first mention of any concept or entity.
- One topic per page. Facts in source and concept pages, opinion and
  synthesis in `overview.md`.
- Contradictions get a `> [!warning]` callout, never a silent overwrite.
- Update `index.md` and append to `log.md` LAST on every ingest:
  `## [YYYY-MM-DD] ingest | <title>` then the pages created and updated.
- Uni coursework lives in `uni/`, not here. This is for everything else
  you learn (and for uni ideas you want to keep after the unit ends).
