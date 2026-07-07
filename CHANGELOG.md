# Changelog

All notable changes to this plugin are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.2.0] - 2026-07-06

### Added
- `/approve-qa-test-plan` command — marks a test plan `approved`, now required before `/check-qa-coverage` will run.
- `/sync-qa-test-plan` command and `qa-test-plan-syncer` agent — re-checks a test plan's recorded sources for changes and appends a dated change log entry, resetting approval if the change was substantive.
- `--spec=` option on `/create-qa-test-plan` — test plans can now be grounded in a spec/LLD document in addition to or instead of a Figma link (either source skippable with a stated reason), with every source used recorded for later re-checks.

### Changed
- Repo resolution now expects a shared workspace root containing the code repo and QA repo as direct subfolders (auto-detected by git-repo presence and "qa" in the folder name), instead of assuming the QA repo is a filesystem sibling of the code repo — the old assumption broke under Claude Code's sandboxed file access.
- `/check-qa-coverage` now requires the test plan's status to be `approved` before it will run.

## [0.1.0] - 2026-07-06

### Added
- Initial release: two-phase Claude Code plugin for QA, run in parallel with `ono-react-native-dev-plugin`.
- `/create-qa-test-plan` command and `qa-test-designer` agent — authors a QA test plan from a feature's Figma design independent of dev's progress.
- `/check-qa-coverage` command and `qa-coverage-reviewer` agent — diffs the QA test plan against the dev plugin's QA handoff notes to surface untested edge cases.
