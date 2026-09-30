# Projects

Everything you build lives here, one folder per project: agents, scripts,
apps, automations, websites.

**How a project starts:** say what you want to build. Claude runs the `spec`
skill (asks you questions, writes `specs/<name>.md`), then `build` (creates
`projects/<name>/` and builds it step by step), then `review` (checks it for
bugs). Copy `_template/README.md` into each new project.

**Custom agents** (subagents Claude can hand tasks to) are a special case:
they are single files in `.claude/agents/`, not project folders. Use the
`agent-builder` skill. See `docs/building-agents.md`.

Finished or abandoned projects move to `archives/`. Never delete them;
old projects are where you learn most.
