---
description: Author a QA test plan for a feature from its Figma design, independent of dev's implementation.
argument-hint: [feature-name] [figma-link] [qa-repo-path?]
---

Author a QA test plan for the feature in `$ARGUMENTS`, from its Figma design alone. This runs in parallel with dev's implementation — it does not read or wait for any `ono-react-native-dev-plugin` output.

1. Parse `$ARGUMENTS` for a feature name and a Figma URL (a `figma.com/...` link). A Figma link is this command's only spec source — no Jira/Confluence/dev-plan lookups. If no Figma link is present, stop and ask the human for one before proceeding; don't draft test cases from a feature name alone.
2. Apply the `qa-test-planning` skill methodology via the `qa-test-designer` agent, passing it the feature name and Figma link.
3. The agent inspects the actual Figma frames/screens/states via the `figma` MCP server (`get_metadata`, `get_design_context`, `get_screenshot`) and derives functional test cases, edge/negative cases, and open questions grounded strictly in what's designed — it does not invent flows the design doesn't show.
4. Have the agent populate `templates/qa-test-plan-template.md` in full.
5. Resolve the QA sibling repo path, in this order:
   1. An explicit path or `--qa-repo=` flag in `$ARGUMENTS`.
   2. `.claude/qa-repo.local.json` in the current (code) repo — untracked, personal override (`{"qaRepoPath": "..."}`).
   3. `.claude/qa-repo.json` in the current repo — committed team default, same shape.
   4. Auto-detect: if exactly one sibling directory of the code repo root has `qa` in its name and contains a `.git` folder, use it, and offer to save it to `.claude/qa-repo.json` for next time.
   5. If none of the above resolves unambiguously, stop and ask the human for the path — don't guess.
6. Slugify the feature name (lowercase, hyphens, punctuation stripped) and write the populated document to `<qa-repo-path>/<feature-slug>/test-plan.md`, creating the folder if needed.
7. Never run `git add`/`commit`/`push` in the QA repo. Tell the human the file was written and that they should review the diff and commit/push it themselves.
