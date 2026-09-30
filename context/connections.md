# Connections

What tools are actually connected to Claude, so it knows what it can do.
Update when you connect or disconnect something. Check live with `/mcp`.

| Tool | How | Status | Notes |
|---|---|---|---|
| G-Brain (memory) | MCP, `gbrain serve`, user scope | not set up yet | run the `gbrain-setup` skill |
| GitHub | `gh` CLI | not set up yet | `gh auth login` |
| Web search | built in | ready | |

Ideas to connect later (only when you have a real use): Notion, Google
Drive/Calendar, Obsidian. Each one is an MCP server. Scan it before
installing (see `.claude/rules/security.md`).
