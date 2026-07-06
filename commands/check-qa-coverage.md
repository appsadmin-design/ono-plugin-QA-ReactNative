---
description: Compare a QA test plan against the dev team's completed QA handoff notes to surface untested edge cases.
argument-hint: [feature-name] [dev-handoff-path?] [qa-repo-path?]
---

Compare the QA test plan for the feature in `$ARGUMENTS` against the dev team's completed QA handoff notes for the same feature, once dev has delivered.

1. Resolve `feature-name` from `$ARGUMENTS`.
2. Locate this feature's completed dev QA handoff doc in the current (code) repo — the output of the dev plugin's `/create-dev-qa-notes`. Use an explicit path if `$ARGUMENTS` gives one; otherwise search the repo for a Markdown file whose content starts with `# QA Handoff` and whose Feature Summary matches this feature. If it can't be found unambiguously, stop and ask the human for its path — do not guess at what dev covered.
3. Resolve the QA sibling repo path using the same convention as `/create-qa-test-plan` (explicit path → `.claude/qa-repo.local.json` → `.claude/qa-repo.json` → single-candidate auto-detect → ask), then read `<qa-repo-path>/<feature-slug>/test-plan.md`. If it doesn't exist, stop and tell the human to run `/create-qa-test-plan` for this feature first.
4. Apply the `qa-coverage-analysis` skill methodology via the `qa-coverage-reviewer` agent to compare the two documents section-by-section, treating the dev handoff's section structure (Feature Summary, How to Test, Test Accounts & Environment, Edge Cases, Known Limitations, Screens & Flows Touched, i18n/RTL Check, Accessibility Check) as a stable contract.
5. Have the agent populate `templates/qa-coverage-report-template.md` in full — every dev-documented screen/flow, edge case, and known limitation gets an explicit Covered/Partially Covered/Gap verdict; never omit an item to make coverage look more complete than it is.
6. Write (create or overwrite) the report to `<qa-repo-path>/<feature-slug>/coverage-report.md`.
7. Never run `git add`/`commit`/`push` in the QA repo — the QA engineer reviews and commits manually, exactly as in `/create-qa-test-plan`.
