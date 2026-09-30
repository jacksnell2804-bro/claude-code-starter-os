# Claude Code Starter OS

A ready-made "AI operating system" for Claude Code: a folder that makes
Claude act like a personal assistant, study partner and build partner
that knows who you are, follows your processes, and remembers things
between sessions.

Built for a **university student who is new to all of this**, for two jobs:

- **University:** lecture notes, quizzing, assignment coaching, research
- **Building custom AI agents** for your own needs

What you get:

| | |
|---|---|
| 17 skills | notes, quizzing, assessment coaching, research, spec/build/review/debug, agent and skill builders, memory, session handoff |
| 6 agents | researcher, tutor, marker, code-reviewer, debugger, explainer |
| 6 rules | how to talk to you, verify before done, security, git safety, academic integrity, how to brief agents |
| G-Brain | long-term searchable memory, local and free |
| Guides | `docs/`: how it works, models and effort, G-Brain, Orca, vibe coding, building agents, cheatsheet, glossary |

---

## Setup (about 30 minutes, once)

### 1. Make your own PRIVATE copy

Your copy will hold personal things (your units, notes, assignments), so it
should be private.

1. Make a free account at [github.com](https://github.com) if you do not
   have one.
2. On this repo's GitHub page, click **Use this template**, then
   **Create a new repository**. Name it (e.g. `my-ai-os`) and choose
   **Private**.
3. You will clone (download) it in step 4.

### 2. Install Claude Code

You need a paid Claude plan (Pro or Max). The free plan does not include
Claude Code.

Open a terminal (Mac: press Cmd+Space, type "Terminal". Windows: open
"PowerShell") and paste:

```bash
# Mac or Linux
curl -fsSL https://claude.ai/install.sh | bash
```
```powershell
# Windows (PowerShell)
irm https://claude.ai/install.ps1 | iex
```

Windows users: also install [Git for Windows](https://git-scm.com/download/win).

Close the terminal, open a new one, and check it worked: `claude --version`.
Then run `claude` once and log in through the browser. Type `/exit` to leave.

### 3. Install Orca (optional but recommended)

Orca is the desktop app you will run Claude in. See `docs/orca.md`.
Mac: `brew install --cask stablyai/orca/orca`, or download it from
[github.com/stablyai/orca](https://github.com/stablyai/orca).

You can skip Orca and just use `claude` in a terminal; everything works the
same.

### 4. Download your copy

In a terminal:

```bash
# pick where it lives, e.g. your home folder
cd ~
git clone https://github.com/<your-username>/my-ai-os.git
cd my-ai-os
```

Because the repo is private, git needs you logged in to GitHub. The easiest
way is the GitHub CLI: install it from [cli.github.com](https://cli.github.com)
(Mac: `brew install gh`), then run `gh auth login` and pick GitHub.com,
HTTPS, and "login with a web browser". After that, `git clone` just works.

Tell git who you are (once per computer; use your GitHub email):

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### 5. Start Claude in the folder

- **Orca:** add the `my-ai-os` folder as a project and start a Claude Code agent.
- **Terminal:** `cd ~/my-ai-os` then `claude`.

When it asks whether you trust this folder, say yes (that lets the settings
in `.claude/settings.json` apply).

### 6. Say: `set me up`

The `first-run` skill interviews you (about 10 questions) and fills in
`context/` with who you are, your units, deadlines and goals.

### 7. Say: `set up g-brain`

The `gbrain-setup` skill installs and connects your memory layer, step by
step (about 10 minutes). Read `docs/gbrain.md` for what it is.

### 8. Check everything

```bash
bash scripts/check-setup.sh
```

Windows: run this in **Git Bash** (search "Git Bash" in the Start menu; it
came with Git for Windows), from inside your `my-ai-os` folder.

Everything should say `[ok]`. If not, paste the output to Claude.

**Then read `docs/how-it-works.md`.** Ten minutes, and everything else makes sense.

---

## Everyday use

You just talk to it. Some things to try first:

| Say | What happens |
|---|---|
| drop slides in `uni/_inbox/`, then "make notes" | study notes in `uni/units/<CODE>/notes/` |
| "quiz me on week 3" | active-recall quiz, tracks weak topics |
| "help me with my assignment" | decode the brief and rubric, plan, research, critique |
| "mark my draft" | rubric-based marking with the top 3 fixes |
| "explain X like I'm new" | the tutor or explainer agent |
| "research X" | cited research summary |
| "build me an agent that..." | spec, build, review, step by step |
| "remember that..." | saved to G-Brain |
| "wrap up" | session summary, status update, commit, memory sync |

Full list: `docs/cheatsheet.md`.

---

## Folder map

```
CLAUDE.md          the brain file Claude reads every session
context/           who you are: me, goals, priorities, study, connections
hot-cache/         what is happening this week
uni/               units, notes, assessments, writing samples
second-brain/      everything else you learn, as a linked wiki (opens in Obsidian)
projects/          things you build
specs/             plans written before building
decisions/         decision log
reminders/         future deadlines
inbox.md           dump anything here
templates/         fill-in forms
docs/              the guides
.claude/rules/     standing rules
.claude/skills/    processes
.claude/agents/    specialist helpers
```

Details: `docs/how-it-works.md`.

---

## Making it yours

This is a starting point, not a finished product. It gets better the more
you shape it:

- The same request three times: say "make that a skill".
- The same mistake twice: say "add a rule so that doesn't happen again".
- A job you want handed off: say "make an agent for that".
- Every skill ends with a self-improvement check that proposes a fix to
  itself when something went wrong, and never edits without your yes.

## Academic integrity

Check your university's and each unit's AI-use policy and record it in
`context/study.md`. The system coaches by default (understanding, planning,
sources, feedback) rather than writing your graded work, and it never
invents sources. You own everything you submit.

## Credits

Structure and methods adapted from a personal Claude Code operating system
in daily use. Memory layer: [G-Brain](https://github.com/garrytan/gbrain)
by Garry Tan. Agent environment: [Orca](https://github.com/stablyai/orca)
by Stably AI. The "grill me" interview pattern is inspired by the public
grill-me skill.

MIT licensed. See `LICENSE`.
