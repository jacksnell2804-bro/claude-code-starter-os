# Glossary

| Term | Plain English |
|---|---|
| **Agent** | an AI that works towards a goal on its own: plans, uses tools, checks results |
| **Subagent** | a helper agent Claude hands a task to; it works separately and returns the result |
| **Skill** | a written process (a `SKILL.md` file) Claude follows for one kind of task |
| **Rule** | a standing instruction in `.claude/rules/` that applies to every task |
| **CLAUDE.md** | the file Claude reads at the start of every session |
| **Context** | everything Claude can "see" right now: instructions, files it read, the chat |
| **Context window** | how much Claude can hold in mind at once. When full, older detail gets summarised |
| **Model** | the AI brain (Haiku, Sonnet, Opus, Fable) |
| **Effort** | how hard the model thinks before answering |
| **Plan mode** | Claude plans and shows you, but changes nothing until you approve |
| **MCP** | Model Context Protocol: the standard plug for connecting tools (like G-Brain) to Claude |
| **MCP server** | a small program that gives Claude new tools, e.g. `gbrain serve` |
| **G-Brain** | the memory layer: a searchable index of your files plus saved facts |
| **PGLite** | the small database G-Brain uses here; lives in a folder, no server |
| **Embedding** | turning text into numbers so search can find things by meaning. Optional here |
| **Terminal** | the text window where you type commands |
| **Repo (repository)** | a folder tracked by git |
| **Git** | the tool that saves versions of your files so you can go back |
| **Commit** | one saved version (a save point) |
| **Branch** | a separate line of work, so experiments do not break `main` |
| **Worktree** | a second copy of the repo on another branch, so two agents can work at once (Orca uses these) |
| **GitHub** | a website that stores your repo online (backup and sharing) |
| **Push / pull** | send commits to GitHub / get commits from GitHub |
| **`.env`** | a file for secrets (API keys). Git ignores it, so they never get uploaded |
| **API key** | a password that lets a program use a paid service. Treat like a password |
| **Markdown (`.md`)** | plain text with simple formatting: `#` headings, `-` bullets, `**bold**` |
| **Frontmatter** | the `---` block at the top of a markdown file holding settings like `name:` |
| **Spec** | a short written plan of what to build, written before building |
| **Vibe coding** | building software by describing it to an AI |
| **Orca** | a desktop app that runs Claude Code (and other agents) side by side |
| **Bun** | a JavaScript runtime; G-Brain needs it installed |
| **Hook** | a script that runs automatically at a moment, e.g. before every command. Advanced |
