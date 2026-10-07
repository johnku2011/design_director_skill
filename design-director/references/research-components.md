# Research Components and Patterns

Read this reference only after the user selects a direction. Research translates that direction into a coherent recipe; it is not permission to install or edit anything.

## Start from needs, not catalogs

Map the primary flows and pages before searching:

```text
Page or flow
├── user job
├── information hierarchy
├── navigation and orientation
├── input and action controls
├── content or data display
├── feedback and system states
└── responsive and accessibility requirements
```

Search separately for the components that carry the selected direction. “Dashboard” is too generic. Useful queries combine function, visual principle, and interaction, such as `compact keyboard command palette dark`, `warm editorial reservation form`, or `friendly financial progress accessible`.

Retrieve multiple candidates for high-impact components. Low-impact primitives can reuse the project's existing system without catalog research.

## Design sources

Use 21st.dev as the preferred MVP discovery source, while remaining provider-neutral: also consider existing components, an organization design system, official component-library documentation, user references, or custom work.

When internet access is available, open direct component or official documentation pages and retain their links. Do not cite search-result pages. When a source cannot be reached, disclose the limitation and continue with repository evidence or custom design rather than inventing candidates.

## Candidate evaluation

For each important need, score or reason across:

| Factor | Question |
| --- | --- |
| Visual fit | Does it express the approved direction rather than merely look polished? |
| Functional fit | Does it support the exact job and required states? |
| System consistency | Can it share type, spacing, color, shape, and motion with the rest? |
| Accessibility | Are semantics, focus, contrast, target size, and reduced motion viable? |
| Responsiveness | Does its structure adapt to required viewports and input modes? |
| Implementation complexity | How much code or behavior must change? |
| Dependency complexity | What packages, runtime cost, and maintenance does it introduce? |
| Customization difficulty | Can it adopt the system without brittle overrides? |

Scores are comparative heuristics, not scientific measurements. Reject candidates with strong visual fit but poor functional or accessibility fit.

## Decision types

Choose one per need:

- **Reuse:** The existing component already fits or needs only token-level restyling.
- **Adapt:** A sourced component provides useful structure or interaction and can be brought into the approved system.
- **Custom:** The need is product-specific, a source introduces disproportionate dependencies, or adaptation would be more brittle than a focused implementation.

Not every component should come from 21st.dev. Do not combine individually attractive candidates until they pass a system-coherence check across typography, spacing, color, shape, motion, and state behavior.

## Reference analysis

For screenshots and URLs, record observed principles:

```text
typography role
information density
spacing rhythm
shape and grouping
color philosophy
layout strategy
motion and feedback
component patterns
overall personality
```

Label inferred behavior that cannot be observed from a static image. Extract transferable principles; do not clone the composition or visual identity pixel-for-pixel.

## Design recipe contract

Present one table:

| Need | Decision | Existing or source reference | Why it fits | Required adaptation | Dependency impact | Accessibility notes |
| --- | --- | --- | --- | --- | --- | --- |

Include direct source links where applicable, plus:

1. Foundation: the system's visual and interaction thesis.
2. Components: the reuse/adapt/custom decisions for primary flows.
3. Tokens: the smallest type, color, spacing, radius, border, shadow, and motion scales needed.
4. Coherence rules: what makes every component feel like one product.
5. Explicit exclusions: attractive patterns rejected and why.
6. Implementation complexity and dependency changes.

End with approval choices: approve the recipe, preview or explain it, or rethink the direction. Stop before writing `DESIGN.md`.

After explicit approval, use [DESIGN.template.md](../assets/DESIGN.template.md) to create or update the repository's `DESIGN.md`. Replace all template guidance with evidence-backed, implementation-ready decisions.

Preserve an existing shared design system by default. A recipe may define a scoped extension, but ordinary recipe approval does not authorize migrating shared tokens, core components, or other pages. Identify conflicts and migration scope, then request separate explicit migration approval before changing them.
