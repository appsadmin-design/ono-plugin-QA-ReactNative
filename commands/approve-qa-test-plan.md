---
description: Mark a QA test plan as approved, so it can be used by /check-qa-coverage.
argument-hint: [feature-name] [--qa-repo=path?]
---

Approve the QA test plan for the feature in `$ARGUMENTS`.

1. Resolve `feature-name` from `$ARGUMENTS`.
2. Resolve the QA repo path — see "Resolving the workspace" in `create-qa-test-plan.md`; the same convention applies here.
3. Slugify the feature name and read `<qa-repo-path>/<feature-slug>/test-plan.md`. If it doesn't exist, stop and tell the human to run `/create-qa-test-plan` first.
4. If `status` is already `approved`, show the existing `approved_by`/`approved_date` and confirm with the human before re-stamping — don't silently overwrite a prior approval.
5. Set `status: approved`. Ask the human for their name/handle if it can't be inferred and set `approved_by` to it; set `approved_date` to today's date. This is a frontmatter-only edit — the rest of the document is untouched.
6. Write the file back in place. Never run `git add`/`commit`/`push` in the QA repo — tell the human to review and commit manually.
