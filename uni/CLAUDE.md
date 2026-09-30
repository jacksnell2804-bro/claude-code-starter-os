# Uni folder rules

Loads on top of the root `CLAUDE.md` whenever Claude works in `uni/`.

## Layout

```
uni/
├── _inbox/                     drop anything here: slides, PDFs, briefs, transcripts
├── units/
│   ├── _TEMPLATE-UNIT/         copied to make a new unit
│   └── <CODE>/                 one folder per unit, e.g. MGT101/
│       ├── index.md            unit overview + list of every note
│       ├── raw/                original files, never edited
│       ├── notes/              study notes made by the uni-notes skill
│       ├── weak-topics.md      topics study-quiz found you weak on
│       └── flashcards-*.csv    Anki / Quizlet imports
├── assessments/
│   ├── _TEMPLATE/              copied for each new assessment
│   └── <CODE>-<name>/          brief.md, research.md, outline.md, draft.md, final.md
└── writing-samples/            your own past work, so Claude can match your voice
```

## Rules

- `raw/` is read-only. Never edit or delete an original file.
- The university's AI-use policy (in `context/study.md`) and
  `.claude/rules/academic-integrity.md` apply to everything in `assessments/`.
- Never invent a source, quote or statistic.
- Exact wording for definitions, plain English alongside.
- Australian spelling. No em dashes.
- When an assessment is found, add its due date to
  `hot-cache/current-state.md` and create a `reminders/` file.
