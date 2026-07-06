# ono-plugin-QA-ReactNative

A [Claude Code](https://claude.com/claude-code) plugin for the QA team, run in **parallel** with `ono-react-native-dev-plugin`'s dev SDLC pipeline rather than after it. QA authors a Figma-grounded test plan while dev is still implementing, then — once dev delivers their QA handoff notes — checks that test plan against what was actually built to surface untested edge cases before test execution starts.

## Relationship to the dev plugin and repos

Each mobile project has two repos:

- **Code repo** — where dev works, where `ono-react-native-dev-plugin` runs, and where its `/create-dev-qa-notes` command writes the completed QA handoff doc. This plugin's commands are also run from here (QA has read access).
- **QA repo** — a separate Bitbucket repo (QA has write access), already cloned locally as a sibling folder next to the code repo. This plugin writes its test plans and coverage reports here. **It never commits or pushes** — the QA engineer always reviews the diff and pushes manually.

## Install

From the marketplace:

```
/plugin marketplace add appsadmin-design/ono-plugin-marketplace
/plugin install ono-plugin-QA-ReactNative@ono-plugin-marketplace
```

Local (for development of the plugin itself):

```bash
claude --plugin-dir /path/to/ono-plugin-QA-ReactNative
```

## Quick start

```
# Phase 1 — while dev is implementing, from the code repo
/create-qa-test-plan checkout-redesign https://figma.com/file/...
#  → writes <qa-repo>/checkout-redesign/test-plan.md

# Phase 2 — after dev hands off (dev has run /create-dev-qa-notes)
/check-qa-coverage checkout-redesign
#  → writes <qa-repo>/checkout-redesign/coverage-report.md

# Then: review the diffs in the QA repo yourself and commit/push
```

## Commands

| Command | Arguments | What it does |
|---|---|---|
| `/create-qa-test-plan` | feature name, Figma link, QA repo path (optional) | Authors a QA test plan from the Figma design alone, independent of dev's progress |
| `/check-qa-coverage` | feature name, dev handoff path (optional), QA repo path (optional) | Compares the QA test plan against dev's completed QA handoff notes and reports coverage gaps |

## Pipeline

| Phase | Command | Skill | Agent |
|---|---|---|---|
| 1. Test planning | `/create-qa-test-plan` | `qa-test-planning` | `qa-test-designer` |
| 2. Coverage check | `/check-qa-coverage` | `qa-coverage-analysis` | `qa-coverage-reviewer` |

Phase 1 depends on nothing but a Figma link — it can run the moment a feature is designed, in parallel with dev's implementation. Phase 2 depends on both the Phase 1 test plan and the dev plugin's `qa-handoff-template.md` output for the same feature, so it only runs once dev has handed off.

## Locating the QA repo

Both commands resolve the QA sibling repo's path in this order, stopping to ask if none resolves unambiguously:

1. An explicit path (or `--qa-repo=`) passed in the command's arguments.
2. `.claude/qa-repo.local.json` in the code repo — untracked, personal override: `{"qaRepoPath": "..."}`.
3. `.claude/qa-repo.json` in the code repo — committed team default, same shape, for when every engineer on the project uses the same sibling folder name.
4. Auto-detect: if exactly one sibling directory of the code repo has `qa` in its name and is a git repo, use it and offer to save it to `.claude/qa-repo.json`.

Within the QA repo, artifacts are organized per feature: `<feature-slug>/test-plan.md` and `<feature-slug>/coverage-report.md`.

## Safety hooks

One hook is always active while the plugin is installed:

| Hook | What it does |
|---|---|
| `block-qa-repo-git-writes` | Blocks any `git commit`/`git push` run via Bash while this plugin is active. It only ever writes Markdown files — the QA engineer always reviews and pushes manually. |

## MCP servers

- **`figma`** (`https://mcp.figma.com/mcp`) — the hosted Figma MCP server, used by `/create-qa-test-plan` to inspect the actual screens/states/frames a feature's test plan is grounded in. Each QA engineer authenticates once via OAuth on first use (`/mcp` to check connection status).

## Plugin internals

| Piece | Contents |
|---|---|
| `commands/` | `create-qa-test-plan`, `check-qa-coverage` |
| `skills/` | `qa-test-planning`, `qa-coverage-analysis` |
| `agents/` | `qa-test-designer`, `qa-coverage-reviewer` |
| `templates/` | `qa-test-plan-template.md`, `qa-coverage-report-template.md` |
| `hooks/` | `block-qa-repo-git-writes` |
