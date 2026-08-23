# Implement an Approved Design

Read this reference only for an explicit implementation or fix request. `DESIGN.md` or an explicitly approved equivalent is required; if neither exists, make no application changes and offer design mode.

## Establish the change contract

Before editing:

1. Read `DESIGN.md`, repository instructions, status, framework configuration, and relevant tests.
2. Identify the requested pages, flows, and viewports.
3. Map existing behavior that the touched UI carries.
4. List expected files, verification, and a rollback boundary for the next coherent increment.

Preserve unless the user separately approves a functional change:

```text
routes and navigation destinations
API requests and response handling
authentication and authorization
database and persistence behavior
business rules and calculations
form submission and validation semantics
state management and caching
analytics and instrumentation
accessibility semantics that already work
```

Visual implementation is not authorization to install dependencies, replace frameworks, or refactor unrelated code. Prefer existing components and packages. If a new dependency is genuinely needed, explain the benefit, maintenance cost, and alternative before requesting the required authorization.

## Increment order

Work in this order unless repository dependencies require a narrower variation:

```text
tokens
→ typography
→ global layout
→ navigation
→ core components
→ primary page
→ secondary pages
→ loading, empty, error, disabled, and success states
→ motion
→ responsive and accessibility review
```

An increment should be small enough to verify and roll back independently, but complete enough to judge as a coherent design decision. Do not rewrite the whole application in one uncontrolled operation.

## Increment record

Before each increment, state internally or in the active change plan:

| Field | Required content |
| --- | --- |
| Scope | Exact components, pages, and files expected to change |
| Design authority | Specific `DESIGN.md` rules being implemented |
| Preserved behavior | Routes, events, state, forms, or data behavior at risk |
| Verification | Existing automated checks plus visual, responsive, keyboard, or contrast inspection |
| Rollback | Smallest coherent revert boundary |

If an unplanned file or behavior enters scope, stop that increment and reassess before editing it.

## Implementation rules

- Centralize approved tokens in the project's existing theme mechanism before propagating them.
- Change component anatomy only when tokens cannot express the approved behavior or hierarchy.
- Implement all relevant states, not only the happy path.
- Keep semantic HTML, labels, focus order, target size, contrast, reduced motion, and keyboard behavior intact or improve them.
- Use motion for continuity, feedback, progress, or spatial explanation; honor `prefers-reduced-motion`.
- Avoid one-off values that bypass `DESIGN.md` unless a documented optical correction needs them.
- Do not introduce a new visual language on secondary pages; reuse the approved component and token decisions.

## Verify each increment

Run the repository's relevant automated tests, type checks, linting, and build in proportion to the change. Also inspect the affected UI at required viewport and input modes when a runnable application or screenshots are available.

Verify both sides:

- **Design adherence:** typography, spacing, hierarchy, color, shape, states, motion, responsive behavior, and explicit exclusions.
- **Functional preservation:** navigation, interaction, forms, data, loading/error behavior, keyboard flow, and instrumentation.

Do not claim a visual check occurred when the application could not be rendered. Report that limitation and perform the strongest available source-level review.

## Completion

After implementation, use [review-and-fix.md](review-and-fix.md) on the touched scope. Report:

```text
implemented increments
files and user-visible areas changed
behavior-preservation evidence
automated and visual checks run
remaining design deviations or unverified risks
```
