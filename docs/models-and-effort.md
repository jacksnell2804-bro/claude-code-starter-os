# Models and effort: which to use when

Two dials control how Claude thinks:

- **Model** (`/model`): which AI brain. Bigger is smarter and slower, and uses
  your plan's usage allowance faster.
- **Effort** (`/effort`, or inside `/model`): how hard that brain thinks
  before answering. Levels: `low`, `medium`, `high`, `xhigh`, `max`.

Your subscription has a usage limit that resets over time. Bigger models and
higher effort use it up faster. So the skill is matching the dial to the job,
not leaving everything on maximum.

## The models (as of late 2026)

| Model | Think of it as | Use it for |
|---|---|---|
| **Haiku 4.5** | the fast intern | quick simple jobs: renaming, formatting, sorting, "what does this error mean" |
| **Sonnet 5** | the reliable all-rounder | **your default.** Notes, study, research, writing feedback, most coding |
| **Opus 5.5** | the senior expert | hard problems: a bug you are stuck on, designing an agent, marking a big draft, planning a complex build |
| **Fable 5.1** | the autonomous project lead | long, multi-step builds you want it to run with on its own |

Exact names change as new models ship. `/model` always shows what you have.

## Effort

| Effort | Use for | Example |
|---|---|---|
| `low` | fast answers, no deep thought needed | "what's the git command to undo my last commit?" |
| `medium` | the everyday default | "make notes on these slides" |
| `high` | real thinking, multi-step work | "plan my 2000-word report", "build this agent" |
| `xhigh` | hard problems | "this bug has survived two fixes" |
| `max` | the hardest things, when nothing else worked | rare. Architecture of a big project, a truly nasty bug |

## Quick picks

| Job | Model | Effort |
|---|---|---|
| Lecture slides into notes | Sonnet | medium |
| Quiz me / flashcards | Sonnet (or Haiku) | low |
| Understand a hard concept | Sonnet | high |
| Plan an assignment | Sonnet or Opus | high |
| Mark my draft against the rubric | Opus | high |
| Quick question about a command | Haiku or Sonnet | low |
| Spec a new agent | Opus | high |
| Build from a finished spec | Sonnet | high |
| Stuck on a bug | Opus | xhigh |
| Long build you want to leave running | Fable | high |

## Plan mode

Press **Shift+Tab** to cycle modes until it says **plan mode**. Claude will
research and show you a plan, but change nothing until you approve. Use it
for anything bigger than a small edit. Reviewing a plan costs you one minute;
undoing a wrong build costs an hour.

## Subagents and models

Agents in `.claude/agents/` each set their own `model:`. The researcher,
tutor and explainer use Sonnet; the marker, code-reviewer and debugger use
Opus because careful critique is where the bigger model earns its keep. When
Claude launches helpers, cheaper models for the helpers is the single best
way to save usage.

## Saving usage

- `/clear` between unrelated tasks. A long chat re-reads everything each turn.
- `/compact` when a long task is getting heavy but you need to keep going.
- `/context` shows what is taking up space.
- Put big reference material in files and point at them, instead of pasting
  it into chat over and over.
- Default to Sonnet. Step up when you notice it struggling, not before.
