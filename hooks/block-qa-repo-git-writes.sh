#!/usr/bin/env bash
# PreToolUse hook: blocks any Bash-invoked `git commit`/`git push` while this
# plugin is installed. This plugin only ever writes Markdown files into a
# working tree (test-plan.md / coverage-report.md) — the QA engineer always
# reviews the diff and commits/pushes by hand. Read-only git commands
# (status/diff/log) and `git add` pass through untouched.
set -uo pipefail

payload="$(cat)"
tool_name="$(jq -r '.tool_name // empty' <<<"$payload")"
[ "$tool_name" = "Bash" ] || exit 0

command="$(jq -r '.tool_input.command // empty' <<<"$payload")"
[ -z "$command" ] && exit 0

if grep -qE '(^|[;&|]|[[:space:]])git([[:space:]]+-C[[:space:]]+[^[:space:]]+)?[[:space:]]+(commit|push)([[:space:]]|$)' <<<"$command"; then
  echo "Blocked: this plugin never commits or pushes on your behalf. Review the written file(s) with 'git diff' in the QA repo and commit/push manually." >&2
  exit 2
fi

exit 0
