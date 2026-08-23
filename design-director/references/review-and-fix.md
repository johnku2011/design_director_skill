# Review and Fix

Use `DESIGN.md` as the authority for both modes. If it is missing and no explicitly approved equivalent exists, stop and offer design mode rather than inventing rules.

## Review mode is read-only

Inspect repository files, rendered output, screenshots, and existing test results as available. Do not edit application files, `DESIGN.md`, or configuration. The outcome is a prioritized report that makes a later fix request easy to scope.

Compare:

- Typography roles, scale, weights, line height, measure, and numeric treatment.
- Color roles, contrast, semantic use, backgrounds, and chart encodings.
- Spacing rhythm, layout, density, alignment, and grouping.
- Radii, borders, shadows, elevation, and container language.
- Buttons, inputs, navigation, dialogs, tables, charts, badges, and all system states.
- Motion purpose, timing, continuity, and reduced-motion behavior.
- Responsive composition, keyboard behavior, focus, semantics, and target sizes.
- Product-specific principles, positive recipes, and explicit `Don't` rules.

Do not turn every source-level mismatch into a finding. Confirm whether inheritance, tokens, or variants already make it compliant. When visual rendering is unavailable, label findings as source-level evidence and do not imply pixel verification.

## Finding contract

Every actionable finding has:

| Field | Meaning |
| --- | --- |
| Severity | High, Medium, or Low based on user and system impact |
| Location | Page, component, state, and file or visual region when known |
| Observed evidence | The actual value, behavior, or rendered result |
| Violated rule | The exact `DESIGN.md` principle, token, or exclusion |
| User impact | Why the mismatch matters to hierarchy, usability, trust, access, or coherence |
| Recommended correction | The smallest system-consistent change |

Severity guide:

- **High:** accessibility failure, broken primary hierarchy, behavior regression, or a direction-level contradiction.
- **Medium:** repeated component or token drift that weakens coherence or usability.
- **Low:** localized polish or optical inconsistency with limited user impact.

Lead with findings ordered by severity. If there are no actionable findings, say so and name any areas that could not be verified. Do not manufacture an adherence percentage when evidence is incomplete. If a percentage is useful and evidence is broad enough, call it a directional heuristic and explain its basis.

## Review output

```text
DESIGN REVIEW

Authority: DESIGN.md path and relevant version or status
Scope: pages, components, states, and viewports inspected
Evidence limits: anything not rendered, exercised, or available

HIGH
- Finding contract entries

MEDIUM
- Finding contract entries

LOW
- Finding contract entries

Systemic patterns
- Repeated causes worth fixing at token or shared-component level

Recommended fix scope
- Smallest coherent batch for a separate fix request
```

Stop after the report. Do not silently correct findings.

## Fix mode

Fix mode requires an explicit request and optional scope such as `dashboard`, `navigation`, or `settings`. If the scope is absent, use the report's smallest coherent batch; do not assume authorization for every finding.

1. Read the relevant findings and `DESIGN.md` rules.
2. Resolve exact files and preserved behavior with read-only inspection.
3. Use [implement-design.md](implement-design.md) for change records, incremental edits, and verification.
4. Prefer systemic token or shared-component corrections when they safely resolve repeated drift.
5. Avoid unrelated redesign, functional change, or opportunistic refactoring.
6. Re-run review on the touched scope and report remaining findings.

If a finding reveals that `DESIGN.md` itself is ambiguous or contradictory, do not choose a new aesthetic rule silently. Present the conflict and request a design-system decision.
