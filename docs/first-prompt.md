# Your first prompt

Paste this into Claude Code the very first time you open it (in your home
folder, before you have a copy of this repo). It makes your own PRIVATE copy
of this template on GitHub, downloads it, and gets git ready. It takes about
5 minutes and Claude explains every step.

Before pasting: Claude Code is installed and you are logged in (README
steps 2 and 3).

```text
I'm new to Claude Code. Please set up my own private copy of an AI operating system template, explaining each step in one plain sentence as you go.

GOAL: a PRIVATE GitHub repo in my account, created from the template jacksnell2804-bro/claude-code-starter-os, downloaded to my home folder and ready to use.

DONE MEANS all of these are true, and you show me the proof for each:
1. `gh repo view <my-username>/my-ai-os --json visibility` says PRIVATE (get my username with `gh api user --jq .login`).
2. The folder my-ai-os in my home folder contains CLAUDE.md, .claude/skills (17 folders) and .claude/agents (6 files).
3. `git config --global user.name` and `git config --global user.email` both print a value.

HOW:
- Check the GitHub CLI is installed (`gh --version`). If it is not, tell me how to install it on my computer and wait for me.
- Check I am logged in (`gh auth status`). If not, ask me to type `! gh auth login` myself (it needs my browser), choosing GitHub.com, HTTPS, and "Login with a web browser". Wait for me.
- Ask me what to call the repo (suggest my-ai-os). If I pick another name, use it everywhere below.
- From my home folder, run: gh repo create my-ai-os --private --template jacksnell2804-bro/claude-code-starter-os --clone
- If the new folder comes down empty, wait 10 seconds and run `git pull` inside it (GitHub copies templates in the background).
- If my git name or email is not set, ask me for them (use the email on my GitHub account) and set them with `git config --global`.

RULES:
- The repo MUST be private. Never create it as public or change it to public: it will hold my personal details.
- Never push anything to jacksnell2804-bro/claude-code-starter-os. That is the shared template, not mine.
- Do not change or delete anything outside the new folder.
- Ask me before installing any software.
- If a step fails, show me the exact error and explain it before trying anything else.

WHEN DONE: show me the three proofs. Then tell me to type /exit, then run `cd ~/my-ai-os` and `claude` (this matters: my skills only load when Claude starts inside that folder), and then to say "set me up".
```

## What happens next

1. Claude creates the private repo, downloads it and proves it worked.
2. You type `/exit`, then `cd ~/my-ai-os` and `claude`.
3. You say **set me up**. Claude interviews you and fills in your context.
4. You say **set up g-brain**. Claude connects your long-term memory.
