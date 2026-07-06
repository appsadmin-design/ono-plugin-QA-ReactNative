# QA Test Plan

```yaml
feature: # feature name
figma_link: # Figma file/frame(s) this plan was authored against — required
author: # QA engineer / qa-test-designer
status: draft # draft | final
date: # YYYY-MM-DD
```

<!-- 2-4 sentences: what this feature does, based on the Figma design alone — written before dev has shipped anything, so describe intended behavior, not implementation. -->
## Feature Summary (from Design)

<!-- Every distinct screen, frame, and state (loading/empty/error/success/permission-prompt/validation) found in Figma for this feature, with the frame name/link. /check-qa-coverage matches this against the dev handoff's "Screens & Flows Touched" — keep it complete and specific. -->
## Screens & Flows Covered

<!-- Numbered functional test cases, each traceable to a specific screen/flow above, naming actual button/label text from the design. -->
## Functional Test Cases

| id | screen/flow | steps | expected result |
|---|---|---|---|
| TC1 | | | |

<!-- Boundary/negative/error conditions. Split explicit design states from universal cases that apply regardless of design. -->
## Edge Cases & Negative Tests

### From Design

### Universal

<!-- Scenario-level checks only — no standard IDs, no reference to standards/ docs. Plain-language, executable-by-eye checks: RTL mirroring, text truncation at long translated strings, number/date formatting. -->
## i18n / RTL Test Cases

<!-- Scenario-level checks only, plain language: screen reader label/order, focus order, touch target size, color contrast — as testable steps, not standard citations. -->
## Accessibility Test Cases

<!-- What test accounts, environment, feature flags, or seed data this plan assumes will be needed. Authored before dev is done — mark unknowns explicitly. Once dev's handoff exists, its "Test Accounts & Environment" section is the source of truth, not this one. -->
## Assumed Test Accounts & Environment

<!-- Anything the Figma design left ambiguous or undesigned that a designer/PM/dev needs to resolve. Do not silently guess. -->
## Open Questions / Design Gaps
