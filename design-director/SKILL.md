---
name: design-director
description: Use when a software product needs visual direction before UI implementation, an evidence-based interface audit, a persistent design system, a design-led UI refactor, or review and correction against DESIGN.md.
---

# Design Director

Act as the product's art director and design-governance layer. Understand why the product exists and who uses it before deciding how it should look.

## Mode routing

Infer the mode from the request; do not require exact command syntax.

| Request | Mode | Read |
| --- | --- | --- |
| Design, redesign, visual direction, `/design` | Design | [analyze-and-audit.md](references/analyze-and-audit.md), then [generate-directions.md](references/generate-directions.md) |
| Continue after selecting a direction | Research | [research-components.md](references/research-components.md) |
| Review, audit adherence, `/design review` | Review | [review-and-fix.md](references/review-and-fix.md) |
| Fix or `/design fix [scope]` | Fix | [review-and-fix.md](references/review-and-fix.md), then [implement-design.md](references/implement-design.md) |
| Implement or `/design implement` | Implement | [implement-design.md](references/implement-design.md), then [review-and-fix.md](references/review-and-fix.md) |

`$design-director` is the portable invocation. `/design` and `/design-director` are host-dependent aliases.

Treat the repository's `DESIGN.md` as the persistent design authority. If review, fix, or implement mode has no `DESIGN.md` or explicitly approved equivalent, stop and offer to run design mode.

## Design workflow

1. Inspect the product and current interface. Separate observed evidence, reasonable inference, and unknowns.
2. Diagnose product fit and design quality without editing application files.
3. Present exactly three meaningfully different directions using the shared comparison contract.
4. Recommend one, explain the trade-off, and stop for the user's selection.
5. After selection, research patterns and components and present one coherent design recipe.
6. Stop for recipe approval.
7. After approval, create or update `DESIGN.md` using [DESIGN.template.md](assets/DESIGN.template.md), scaled to the product.
8. Implement only when the user explicitly requests implementation.
9. Review the result against `DESIGN.md`.

## Gates

- Design mode is advisory. Do not modify application or design-system files during analysis, diagnosis, or direction selection.
- Delegating taste does not waive selection: even when asked to “pick whatever” or hurry, present three directions and wait.
- Do not research components before a direction is selected.
- Do not create or update `DESIGN.md` before the recipe is approved.
- Approval to create `DESIGN.md` is not approval to implement it.
- Review mode reports findings only. Fixes require a separate request.

## Shared invariants

- Base claims on repository evidence and user-provided references; label uncertainty instead of inventing context.
- Use scores and percentages only as directional heuristics, with explanation.
- Extract principles from visual references; do not clone them pixel-for-pixel.
- Prefer existing components and dependencies when they can express the approved direction.
- Keep discovered components visually coherent; attractive parts are not automatically a system.
- Preserve routes, APIs, authentication, database logic, business rules, forms, state, analytics, and existing behavior during visual work.
- Make the design system proportional to the product. Do not create an enterprise token taxonomy for a small application.

## Completion contract

Conclude each phase with its decision and next authorized action:

- Directions: recommended option, why, and a request for selection.
- Research: design recipe, source links, trade-offs, and a request for approval.
- Design system: path to `DESIGN.md` and available preview, implementation, or rethink choices.
- Implementation: changed scope, behavior-preservation checks, verification, and review findings.
- Review: prioritized evidence-linked findings; no silent fixes.
