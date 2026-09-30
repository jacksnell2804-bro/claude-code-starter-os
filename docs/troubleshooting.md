# Troubleshooting

| Problem | Try |
|---|---|
| `claude: command not found` | Close and reopen the terminal. Then `claude doctor`. Reinstall with the command in `README.md`. |
| Claude does not seem to know who I am | Is `context/me.md` filled in? Did you start Claude in THIS folder? `/memory` shows what loaded. |
| A skill does not fire | Say its name, `/skill-name`. If that works, its description does not match how you ask; say "fix the description of the X skill so it fires when I say Y". New skills need a new session. |
| An agent is not listed | `/agents`. New agent files need a new session. |
| `/mcp` shows gbrain failed | Is another Claude session open? (only one can use the local brain). Otherwise close Claude and run `gbrain doctor`. |
| "lock" or "another process holds the brain" | Close the other Claude session or `gbrain` command. Never delete the lock file. |
| Claude keeps going in circles | Esc. `/clear`. Describe the problem fresh with the full error. Try Opus with effort `xhigh`. |
| Hit my usage limit | Wait for the reset (the message says when). Use Sonnet, `/clear` more often, lower effort for easy jobs. |
| Too many permission prompts | Say "add a permission so you can run X without asking", or `/permissions`. Only allow things you understand. |
| I think Claude deleted or broke something | Stop. Say "show me git status and git diff, don't change anything". Most things can be recovered from git. `/rewind` undoes recent edits too. |
| I pasted an API key into chat or a file | Treat it as leaked: go to that service, delete the key, make a new one, put it in `.env`. |
| Orca agent cannot find Claude | Open a normal terminal, run `claude --version` and log in once. Then restart Orca. |

Still stuck: `bash scripts/check-setup.sh` shows what is installed and what
is missing. Paste its output to Claude and ask what to do.
