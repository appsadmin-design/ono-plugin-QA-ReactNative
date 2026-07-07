---
name: qa-coverage-analysis
description: Methodology for comparing a completed dev QA handoff doc against a QA test plan to find untested edge cases. Used by /check-qa-coverage via the qa-coverage-reviewer agent and the qa-coverage-report template.
---

## Methodology

1. **Treat the dev handoff's section structure as a fixed contract**: Feature Summary, How to Test, Test Accounts & Environment, Edge Cases, Known Limitations, Screens & Flows Touched, i18n/RTL Check, Accessibility Check (per `ono-mobile-dev-plugin`'s `templates/qa-handoff-template.md`). If a supplied document doesn't match this shape, say so rather than guessing at its content.
2. **Build the checklist** from Screens & Flows Touched, Edge Cases, Known Limitations, i18n/RTL Check, and Accessibility Check — plus anything "How to Test" mentions that isn't already listed elsewhere.
3. **Match each checklist item against the QA test plan** by substance (a paraphrase counts as a match), across Screens & Flows Covered, Functional Test Cases, Edge Cases & Negative Tests, i18n/RTL Test Cases, and Accessibility Test Cases.
4. **Classify** each item Covered / Partially Covered / Gap. A Known Limitation only becomes a gap if it implies behavior QA should actually verify (e.g. a fallback state), not by rote for every limitation.
5. **Flag possibly-stale QA test cases** as a secondary, clearly-labeled finding — a test case referencing something the dev handoff never mentions, or that seems to contradict "How to Test". Phrase as "verify" language since this agent never reads the actual code.
6. **Populate `templates/qa-coverage-report-template.md` in full**, with an explicit "None found" for empty sections, and a one-paragraph overall recommendation on whether the QA test plan needs updates before test execution starts.
