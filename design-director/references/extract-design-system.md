# Extract an Existing Design System

Read this reference only for an explicit extraction request such as `/design extract`. Extraction documents the implemented visual language; it is not redesign, normalization, or implementation permission.

## Inspect the as-built system

Inspect representative pages, components, states, and viewports plus shared theme files, tokens, assets, and component variants. Use rendered evidence when available and source evidence to trace inheritance and reuse. Record evidence limits instead of assuming unobserved behavior.

Classify each observed pattern:

| Class | Meaning |
| --- | --- |
| Candidate rule | Repeated, coherent behavior likely to be intentional and reusable |
| Intentional exception | A variation with a clear component, state, accessibility, or product purpose |
| Unresolved outlier | An isolated or contradictory value with no verified purpose |
| Unknown | Evidence is insufficient to classify the pattern |

Frequency is evidence, not proof. Prefer shared tokens, primitives, and repeated rendered behavior over raw occurrence counts. Do not promote every observed value into a token or treat accidental drift as design intent.

## Extracted baseline contract

Present a non-authoritative draft containing:

1. Scope inspected and evidence limits.
2. Product character and principles already expressed consistently.
3. Candidate typography, color, spacing, layout, shape, elevation, imagery, motion, responsive, and accessibility rules, each with evidence and confidence.
4. Shared component anatomy and state behavior.
5. Intentional exceptions and their purpose.
6. Unresolved outliers or likely drift, kept outside the canonical system.
7. Missing states, viewports, or rules that cannot be inferred safely.

If `DESIGN.md` already exists, show conflicts separately; do not silently overwrite its authority.

Ask the user to approve the extracted baseline, resolve named uncertainties, or request a rethink. Stop before writing `DESIGN.md`.

After approval, adapt [DESIGN.template.md](../assets/DESIGN.template.md). Identify the direction as an extracted baseline and replace every template note with evidence-backed rules. Extraction approval authorizes the document only. UI cleanup, token normalization, migration, or implementation requires a separate request.
