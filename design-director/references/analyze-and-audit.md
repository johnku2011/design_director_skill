# Analyze and Audit

Read this reference for default design mode. The outcome is a concise product diagnosis grounded in evidence, not a file change.

## Inspection order

Start with high-signal material and stop when additional scanning no longer changes the model:

1. `README*`, `package.json`, product docs, existing `DESIGN.md`, and visible product copy.
2. Routes and main flows in `src/`, `app/`, or `pages/`.
3. Shared UI in `components/`, layouts, navigation, forms, data displays, and empty/error/loading states.
4. Global CSS, theme files, Tailwind configuration, tokens, fonts, icons, and public assets.
5. Existing screenshots or user-supplied references.

Inspect repository status before any later write phase and preserve unrelated work. Do not infer the rendered appearance from component names alone when source styles or screenshots can resolve it.

When user references conflict, do not average them into a vague blend. State the conflict, map each reference to the product goal it best serves, and choose which principle governs each layer or flow. Explain what is retained, rejected, or subordinated and why.

## Evidence model

Classify important claims:

| Class | Meaning | Example |
| --- | --- | --- |
| Observed | Directly supported by code, copy, assets, or a rendered view | “Three button radius values are defined.” |
| Inferred | A reasonable interpretation with named evidence | “The terse copy and shortcut map suggest expert users.” |
| Unknown | Evidence is insufficient and the answer could alter direction | “Brand should feel playful” is unknown without audience or positioning evidence. |

When unknowns would materially change the directions, ask focused questions one at a time until the ambiguity is resolved. Do not batch questions. Otherwise continue and label confidence.

## Product model

Determine:

- Product type, without letting the category mechanically choose a style.
- Primary and secondary audiences, including environment and expertise.
- Three to five core jobs users are trying to complete.
- Three to five personality attributes supported by the product's purpose.
- Trust, urgency, density, accessibility, and emotional requirements.

When there is no implemented UI, perform product analysis and mark the UI audit “not yet applicable.” Do not fabricate scores or defects.

## UI audit

Evaluate each axis against the product's jobs:

- **Hierarchy:** reading order, primary action, emphasis, grouping, and information density.
- **Typography:** families, scale, weights, line height, measure, readability, and numeric treatment.
- **Spacing and layout:** repeated intervals, arbitrary values, alignment, grids, containers, and responsive behavior.
- **Color:** palette size, semantics, contrast, background hierarchy, accent discipline, and chart legibility.
- **Components:** consistency across buttons, inputs, cards, navigation, dialogs, tables, charts, badges, and system states.
- **Shape:** radii, borders, shadows, elevation, and container language.
- **Motion:** purpose, duration, continuity, feedback, reduced-motion behavior, and decorative excess.
- **Product fit:** whether the interface supports audience expectations and the core jobs.

Explicitly check for AI UI smells:

```text
card wrapping without meaningful grouping
default blue-purple gradients or gradient text without purpose
glassmorphism and decorative blobs
excessive pills, shadows, or large rounded containers
generic icons and interchangeable dashboard composition
huge hero copy that displaces the primary job
arbitrary colors, radii, spacing, or animation durations
```

Do not flag a pattern merely because it appears. Explain why its use is excessive, inconsistent, inaccessible, or inappropriate for this product.

## Heuristic scores

Optional scores can structure comparison across these axes: design consistency, visual identity, hierarchy, typography, accessibility, and product fit. Use a 1–10 scale only when the evidence is sufficient.

For every score, include one sentence of evidence. Introduce the table with: “These are directional heuristics for prioritization, not objective measurements.”

## Analysis output

Return:

```text
PROJECT UNDERSTANDING
- Product type and confidence
- Audience and confidence
- Core jobs
- Product personality
- Evidence and material unknowns

CURRENT UI DIAGNOSIS
- What already supports the product
- Highest-impact problems, with evidence
- AI UI smells that materially apply
- Optional evidence-linked heuristic scores
- Constraints worth preserving
```

Then use [generate-directions.md](generate-directions.md). Do not propose implementation changes as if they are already approved.
