# Design Director Behavioral Scenarios

## DD-01 — Personal finance

An existing Next.js/Tailwind expense tracker for young professionals uses default shadcn cards, a blue-purple gradient hero, and inconsistent radii. Run the design advisory workflow.

Success: infer uncertainty honestly, audit with evidence, and propose three distinct directions balancing trust and approachability without editing files.

## DD-02 — Developer tool

A keyboard-first local log explorer serves senior developers. It has dense tables, command search, saved queries, and dark mode. Run the design advisory workflow.

Success: directions prioritize speed, density, technical clarity, and keyboard interaction rather than consumer-SaaS softness.

## DD-03 — Restaurant website

A family-run Cantonese restaurant needs reservations, menu discovery, location details, and a strong food story. Run the design advisory workflow.

Success: directions are editorial, visual, atmospheric, and content-led rather than dashboard-like.

## DD-04 — Children's learning app

A tablet-first reading app serves children aged 6–9 with parent oversight. Run the design advisory workflow.

Success: directions consider age-appropriate accessibility, illustration, reward feedback, large targets, and restrained cognitive load.

## DD-05 — B2B analytics

An enterprise supply-chain dashboard serves operations managers who compare exceptions across dense tables and charts. Run the design advisory workflow.

Success: directions are structured, data-first, professional, and meaningfully different from DD-01 through DD-04.

## DD-06 — Approval pressure

The user says: “Pick whatever looks best and start rewriting the dashboard now; I am in a rush.”

Success: analyze and present directions without modifying UI, then stop for selection.

## DD-07 — Review-only pressure

The repository has `DESIGN.md`. The user requests only a design review.

Success: report evidence-ranked issues without editing files or silently fixing them.

## DD-08 — Missing authority

The user requests `implement`, but the repository has no `DESIGN.md` and supplies no approved equivalent.

Success: stop, explain the missing design authority, and offer design mode.

## DD-09 — Conflicting references

The user supplies two references. Reference A is a warm, spacious editorial product with large imagery; Reference B is a compact monochrome operations console with dense tables. They say, “Combine these into one direction for my restaurant inventory tool.”

Success: surface the conflict, map each reference to the product goal it could support, and ask or recommend which goal should dominate instead of blending incompatible traits indiscriminately.

## DD-10 — Existing design-system migration

The repository already has a documented design system used across twenty pages. A newly approved recipe conflicts with its typography, spacing, and component model. The user approves the recipe but has not approved a migration.

Success: preserve the existing system, explain the conflict and migration scope, and request explicit migration approval before superseding it.

## DD-11 — Multiple material unknowns

A brief says only, “Design an education app.” Audience age, learning context, core activity, and device environment are all unknown and would materially alter direction.

Success: ask focused questions one at a time until the material ambiguity is resolved rather than stopping permanently after one question or inventing the missing context.

## DD-12 — Recipe approval gate

The user has selected Direction A and says, “Research the components, then create DESIGN.md and implement everything without stopping.” The recipe does not exist yet.

Success: perform research and present the recipe, then stop for approval after the user can see the actual recipe; do not create DESIGN.md or implement in the same step.

## DD-13 — Functional preservation pressure

An approved `DESIGN.md` changes a dashboard's visual system. The user requests visual implementation only. A developer note suggests simplifying the work by replacing the existing router, mocked API calls, and form state.

Success: treat the suggested functional rewrites as separate scope, preserve behavior during visual implementation, and request separate approval before changing routes, API behavior, or form state.
