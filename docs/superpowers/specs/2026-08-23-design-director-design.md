# Design Director Skill — Design Specification

## Objective

Build a portable agent skill that gives coding agents product-aware visual direction. It must understand an existing application, diagnose its interface, propose three meaningfully different directions, research suitable components and patterns, produce an approved `DESIGN.md`, guide incremental implementation, and review the result.

The skill acts as an art director and design-governance layer. It does not compete with interface generators by immediately producing another UI.

## Users and Success Criteria

The primary users are vibe coders, solo developers, startup founders, product managers, and AI-assisted developers who can build functional software but need stronger visual judgment.

The MVP succeeds when the same skill can examine five substantially different products—personal finance, developer tooling, a restaurant website, a children's learning app, and a B2B analytics dashboard—and recommend distinct, appropriate, actionable visual languages. The final implementation should feel intentionally designed rather than generically AI-generated.

## Delivery Shape

The MVP is a modular agent-skill package:

```text
design-director/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── analyze-and-audit.md
│   ├── generate-directions.md
│   ├── research-components.md
│   ├── implement-design.md
│   └── review-and-fix.md
└── assets/
    └── DESIGN.template.md
```

`SKILL.md` is the compact entrypoint and mode router. It contains shared invariants, authorization gates, and reference-loading rules. Detailed guidance lives in focused references so an invocation loads only the material relevant to its current mode.

No standalone application, backend, database, account system, or proprietary component library is part of the MVP.

## Invocation and Modes

The portable invocation is `$design-director`. Host environments may expose `/design` or `/design-director` aliases, but the skill must not depend on slash-command support.

### Design mode

Default invocation performs the full advisory workflow:

1. Inspect the repository and available visual references.
2. Infer product context, audience, core jobs, and personality, marking uncertain inferences.
3. Audit the existing UI and identify product-fit issues and AI UI smells.
4. Present three genuinely different directions and recommend one.
5. Stop for user selection.
6. Decompose important pages into component needs.
7. Research 21st.dev and other appropriate primary references.
8. Rank candidate components and choose reuse, adaptation, or custom implementation.
9. Present a coherent design recipe.
10. Stop for user approval.
11. Create or update `DESIGN.md` from the approved recipe.

### Review mode

`$design-director review` treats an existing `DESIGN.md` as the authority, inspects the implementation, and reports prioritized violations. Review mode is read-only unless the user separately requests fixes.

### Fix mode

`$design-director fix [scope]` corrects a named page, component, or the whole interface against `DESIGN.md`. It should make the smallest coherent correction and review the touched scope afterward.

### Implement mode

`$design-director implement` applies an approved `DESIGN.md` incrementally, then reviews adherence. It does not reopen major aesthetic decisions unless implementation evidence reveals a conflict that materially changes the direction.

## System Flow

```text
User request
    ↓
Mode router
    ├── Design → Understand → Diagnose → Directions → User selection
    │                                      ↓
    │              Research → Design recipe → User approval → DESIGN.md
    ├── Review → Compare implementation with DESIGN.md → Report
    ├── Fix → Read DESIGN.md → Correct requested scope → Review scope
    └── Implement → Read approved DESIGN.md → Incremental changes → Review
```

## Responsibilities by Module

### `SKILL.md`

- Identify the requested mode.
- Establish `DESIGN.md` as the persistent source of truth.
- Enforce user selection before research and recipe approval before writing the design system.
- Prevent analysis and review modes from silently editing the application.
- Preserve authorization boundaries between advice, file generation, implementation, and fixes.
- Route to only the references needed for the current mode.

### `references/analyze-and-audit.md`

- Inspect high-signal project files, application structure, UI components, styles, tokens, product copy, assets, and main user flows.
- Determine product type, target audience, user jobs, personality, and uncertainty.
- Audit hierarchy, typography, spacing, color, components, shape language, responsiveness, accessibility signals, and motion.
- Detect AI UI smells such as excessive cards, arbitrary radii, generic gradients, glassmorphism, decorative blobs, excessive pills, weak hierarchy, and interchangeable dashboard layouts.
- Use heuristic scores only to structure reasoning; explain evidence and never imply scientific precision.

### `references/generate-directions.md`

- Generate exactly three meaningfully different directions.
- Define each direction's personality, visual language, typography, color philosophy, shape, motion, component character, search terms, advantages, and risks.
- Rank the directions by product fit, audience fit, usability, distinctiveness, and implementation complexity.
- Explain why the recommendation fits the product better than the alternatives.

### `references/research-components.md`

- Decompose each important page into functional component needs before searching.
- Use semantic, direction-specific queries rather than generic searches.
- Prefer 21st.dev for MVP component discovery while keeping the decision model provider-neutral.
- Evaluate multiple candidates for important components on visual fit, functional fit, system consistency, accessibility, responsiveness, dependencies, implementation complexity, and customization effort.
- Classify every decision as reuse existing, adapt a discovered component, or create custom.
- Assemble one coherent design recipe instead of a collage of individually attractive components.
- Record direct source links and distinguish observed facts from design inference.

### `references/implement-design.md`

- Read the approved `DESIGN.md` before editing.
- Work in the order: tokens, typography, global layout, navigation, core components, primary page, secondary pages, states, motion, and responsive review.
- Prefer existing dependencies and components; add dependencies only when their value outweighs maintenance cost.
- Preserve routes, API calls, authentication, database logic, business rules, form behavior, state management, analytics, and other application behavior.
- Verify each coherent increment before expanding scope.

### `references/review-and-fix.md`

- Compare implementation evidence with `DESIGN.md` across typography, spacing, colors, radii, borders, shadows, components, responsive behavior, accessibility, principles, and prohibited patterns.
- Report findings by severity with locations, evidence, design-system rule, and recommended correction.
- In fix mode, change only the approved scope and re-run the relevant review.
- Do not manufacture an adherence percentage when evidence is incomplete.

### `assets/DESIGN.template.md`

The template provides implementation-ready sections for product context, audience, direction, principles, personality, typography, colors, spacing, layout, radii, borders, shadows, iconography, illustration, components, navigation, forms, data visualization, motion, responsive behavior, accessibility, positive rules, anti-patterns, and reference components.

The generated file should be proportional to the application. Small products should receive a compact token system rather than an enterprise-scale taxonomy.

## User-Control and Authorization Gates

The skill must preserve these gates:

```text
Analyze and diagnose
    ↓
Present three directions
    ↓
USER SELECTS
    ↓
Research and present recipe
    ↓
USER APPROVES
    ↓
Create or update DESIGN.md
    ↓
USER REQUESTS IMPLEMENTATION
    ↓
Implement incrementally
```

Minor implementation choices inside an approved direction do not require repeated confirmation. A choice is major when it changes the visual direction, brand personality, core typography, color philosophy, component strategy, or implementation scope.

## Reference-Based Design

When screenshots or URLs are supplied, the skill extracts principles—typography, density, spacing, shape, color philosophy, layout, motion, component patterns, and personality. It must not attempt pixel-for-pixel cloning or misrepresent inferred patterns as facts about the reference.

Internet research must use direct, attributable sources. If 21st.dev is unavailable or unsuitable, the skill can use existing project components, official library documentation, or custom implementation and should state that choice.

## Error and Uncertainty Handling

- Missing product evidence: state what is unknown and ask only for information that would materially alter the direction.
- No existing UI: analyze product context and intended flows, then propose greenfield directions without inventing audit findings.
- Missing `DESIGN.md` in review, fix, or implement mode: stop and offer to run design mode or use an explicitly supplied design source.
- Unavailable design source: continue with available evidence and disclose the limitation.
- Conflicting references: surface the conflict and identify which product goal each reference supports.
- Existing design system conflict: preserve it by default and propose migration only when the user approves that expanded scope.

## Testing Strategy

Behavioral validation will use realistic fixtures or project descriptions for:

1. Personal finance: trustworthy, friendly, understandable, potentially playful.
2. Developer tool: dense, technical, fast, keyboard-oriented, minimal.
3. Restaurant website: editorial, visual, food-focused, atmospheric.
4. Children's learning app: playful, accessible, illustrated, reward-oriented.
5. B2B analytics dashboard: structured, professional, information-dense, data-first.

Tests will verify:

- The five outputs are materially different rather than variants of one generic SaaS style.
- Each direction contains the required decision fields and meaningful trade-offs.
- Analysis and review modes do not edit files.
- Research waits for user selection.
- `DESIGN.md` generation waits for recipe approval.
- Implementation waits for an explicit implementation request.
- Fix and implementation modes preserve application behavior.
- Research decomposes pages into component needs and records attributable sources.
- The package passes the official skill validator with no scaffold placeholders.

## Scope Boundaries

The MVP supports React, Next.js, Tailwind, and shadcn-based projects particularly well but keeps its design reasoning framework-neutral. Screenshot analysis, automated component installation, browser-based visual comparison, visual regression, and broad multi-page accessibility automation remain optional enhancements rather than launch requirements.

The core hypothesis is design-reasoning quality. Feature count is secondary.
