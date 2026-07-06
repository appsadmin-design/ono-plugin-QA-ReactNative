# QA Coverage Report

```yaml
feature: # feature name
dev_handoff_source: # path to the dev QA handoff doc compared against
test_plan_source: # path to the QA test plan compared against
author: # qa-coverage-reviewer / human
date: # YYYY-MM-DD
```

<!-- 1-2 sentences: which two documents were compared and when, so this report is self-contained if read later. -->
## Comparison Scope

<!-- Every item from the dev handoff's Screens & Flows Touched / Edge Cases / Known Limitations / i18n-RTL Check / Accessibility Check sections, each marked Covered / Partially Covered / Gap, with matching QA test case id(s) if any. The core output of this report. -->
## Coverage Matrix

| dev-documented item | source section | status | matching test case(s) | notes |
|---|---|---|---|---|

<!-- Every item marked Gap above, expanded: what dev documented, why no QA test case covers it, and a suggested test case to add. The actionable "weak spots" list. Use "None found" if empty. -->
## Gaps (Dev-Documented, Not Covered by QA)

<!-- Optional secondary finding: QA test cases referencing something the dev handoff doesn't mention, or that seem to contradict it. Flagged as "verify" — this agent doesn't read code. Use "None found" if empty. -->
## Possibly-Stale QA Test Cases

<!-- One paragraph: how much of the dev-documented behavior is covered, and whether the QA test plan needs updates before test execution starts. -->
## Summary & Recommendation
