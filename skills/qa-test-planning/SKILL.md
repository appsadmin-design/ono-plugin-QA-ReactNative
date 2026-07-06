---
name: qa-test-planning
description: Methodology for authoring a QA test plan from a Figma design alone, before dev's implementation is done. Used by /create-qa-test-plan via the qa-test-designer agent and the qa-test-plan template.
---

## Methodology

1. **Require a Figma link before doing anything else.** If none was given, stop and ask the human — this is the only spec source for Phase 1, so there is nothing to ground test cases in otherwise.
2. **Enumerate frames and states via the `figma` MCP server.** Use `get_metadata` to see the file/page/frame structure, `get_design_context` to pull component and content detail, and `get_screenshot` for anything ambiguous. Include loading/empty/error/success/permission/validation variants as distinct states, not just the "happy path" frame.
3. **Derive functional test cases per screen/flow**, naming the actual button/label text and layout from the design.
4. **Derive edge cases in two buckets**: design-derived (an explicit error/empty state shown in Figma) and universal (network loss, backgrounding, interruption, permission denial, rotation — always worth testing regardless of what's designed).
5. **Write i18n/RTL and accessibility checks as scenario-level test steps in plain language** — no standard IDs, no reference to `ono-react-native-dev-plugin`'s `standards/` docs.
6. **Log anything the design leaves ambiguous** (an undesigned error state, an unclear interaction) as an open question for a designer/PM/dev to resolve — never silently guess.
7. **Populate `templates/qa-test-plan-template.md` in full**, including "Screens & Flows Covered" with enough detail (frame names/links) that `/check-qa-coverage` can later match it against the dev handoff's "Screens & Flows Touched".
