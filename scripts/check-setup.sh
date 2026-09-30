#!/usr/bin/env bash
# Checks what is installed and prints the next step. Safe: reads only, changes nothing.
# Run from the repo folder:  bash scripts/check-setup.sh

ok()   { printf "  [ok]   %s\n" "$1"; }
miss() { printf "  [todo] %s\n        -> %s\n" "$1" "$2"; }

echo "Checking your AI OS setup..."
echo

echo "Tools"
if command -v git >/dev/null 2>&1; then ok "git $(git --version | awk '{print $3}')"; else miss "git" "Mac: run 'xcode-select --install'. Windows: install Git for Windows from git-scm.com"; fi
if command -v claude >/dev/null 2>&1; then ok "claude $(claude --version 2>/dev/null | head -1)"; else miss "Claude Code" "see README.md step 2"; fi
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then ok "GitHub CLI (logged in)"; else miss "GitHub CLI login" "run: gh auth login"; fi
else miss "GitHub CLI (optional)" "Mac: brew install gh, or see cli.github.com"; fi
if command -v bun >/dev/null 2>&1; then ok "bun $(bun --version)"; else miss "bun (needed for G-Brain)" "say 'set up g-brain' in Claude"; fi
if command -v gbrain >/dev/null 2>&1; then ok "gbrain installed"; else miss "G-Brain" "say 'set up g-brain' in Claude"; fi
echo

echo "G-Brain connection"
if command -v claude >/dev/null 2>&1 && claude mcp list 2>/dev/null | grep -q gbrain; then ok "gbrain is registered with Claude Code"; else miss "gbrain not connected to Claude" "say 'set up g-brain' in Claude"; fi
echo

echo "Your context"
n=$(grep -c "\[FILL IN" context/me.md 2>/dev/null || echo 0)
if [ "$n" = "0" ]; then ok "context/me.md filled in"; else miss "context/me.md has $n blanks" "start Claude and say 'set me up'"; fi
units=$(find uni/units -mindepth 1 -maxdepth 1 -type d ! -name "_TEMPLATE-UNIT" 2>/dev/null | wc -l | tr -d ' ')
if [ "$units" -gt 0 ]; then ok "$units unit folder(s) in uni/units"; else miss "no unit folders yet" "'set me up' creates them"; fi
echo

echo "Git"
if git rev-parse --git-dir >/dev/null 2>&1; then
  ok "this folder is a git repo"
  if git remote get-url origin >/dev/null 2>&1; then ok "backed up to $(git remote get-url origin)"; else miss "no GitHub backup yet" "ask Claude: 'make this a private GitHub repo and push it'"; fi
else miss "not a git repo" "run: git init"; fi
echo
echo "Done. Paste this output to Claude if anything says [todo]."
