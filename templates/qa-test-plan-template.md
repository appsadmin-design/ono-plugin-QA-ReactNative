# QA Test Plan

```yaml
feature: # feature name
figma_link: # Figma file/frame(s) this plan was authored against — or "N/A — <reason>" if this feature has no UI
spec_link: # spec/LLD doc path or link this plan was authored against — or "N/A — <reason>" if none exists
author: # QA engineer / qa-test-designer
status: draft # draft | approved — flip via /approve-qa-test-plan, never hand-edit
approved_by: # set by /approve-qa-test-plan
approved_date: # set by /approve-qa-test-plan, YYYY-MM-DD
date: # YYYY-MM-DD
```

<!-- 2-4 sentences: what this feature does, based on the sources below alone — written before dev has shipped anything, so describe intended behavior, not implementation. -->
## Feature Summary (from Design)

<!-- Every source this plan was actually grounded in: Figma, spec/LLD, and anything else QA supplied. Include an explicit "N/A — <reason>" row for any category that doesn't apply (e.g. no Figma because no UI) rather than omitting it. /sync-qa-test-plan reads this table to know what to re-check when sources change. -->
## Input Sources

| type | source | description | date_added |
|---|---|---|---|
| figma | | | |
| spec/lld | | | |

<!-- Every distinct screen, frame, and state (loading/empty/error/success/permission-prompt/validation) found across the sources above for this feature, with the frame name/link or spec section. /check-qa-coverage matches this against the dev handoff's "Screens & Flows Touched" — keep it complete and specific. -->
## Screens & Flows Covered

<!-- Numbered functional test cases, each traceable to a specific screen/flow above, naming actual button/label text from the design or behavior from the spec. -->
## Functional Test Cases

| id | screen/flow | steps | expected result |
|---|---|---|---|
| TC1 | | | |

<!-- Boundary/negative/error conditions. Split explicit design/spec states from universal cases that apply regardless of source. -->
## Edge Cases & Negative Tests

### From Design/Spec

| id | screen/flow | steps | expected result |
|---|---|---|---|
| EC1 | | | |

### Universal

| id | screen/flow | steps | expected result |
|---|---|---|---|
| EC-U1 | | | |

<!-- Scenario-level checks only — no standard IDs, no reference to standards/ docs. Plain-language, executable-by-eye checks: RTL mirroring, text truncation at long translated strings, number/date formatting. -->
## i18n / RTL Test Cases

| id | screen/flow | steps | expected result |
|---|---|---|---|
| I18N1 | | | |

<!-- Scenario-level checks only, plain language: screen reader label/order, focus order, touch target size, color contrast — as testable steps, not standard citations. -->
## Accessibility Test Cases

| id | screen/flow | steps | expected result |
|---|---|---|---|
| A11Y1 | | | |

<!-- What test accounts, environment, feature flags, or seed data this plan assumes will be needed. Authored before dev is done — mark unknowns explicitly. Once dev's handoff exists, its "Test Accounts & Environment" section is the source of truth, not this one. -->
## Assumed Test Accounts & Environment

<!-- Anything the sources above left ambiguous or undesigned that a designer/PM/dev needs to resolve, or any conflict between Figma and the spec/LLD. Do not silently guess or silently pick one source over another. -->
## Open Questions / Design Gaps

<!-- Append-only history of what changed since the initial version. /sync-qa-test-plan appends a new dated entry here each time it updates this plan from refreshed sources — never edit or remove a past entry. -->
## Change Log

- Initial version — <!-- date -->
