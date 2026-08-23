# Design Director Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build and behaviorally validate a modular `design-director` agent skill that turns product context into approved design direction, component research, `DESIGN.md`, incremental implementation guidance, and design review.

**Architecture:** A compact `SKILL.md` routes four modes and enforces authorization gates. Five focused references contain mode-specific reasoning, while a reusable asset defines the persistent `DESIGN.md` contract. Behavioral scenarios test judgment and workflow discipline; deterministic validation checks package integrity and metadata.

**Tech Stack:** Markdown Agent Skill, YAML metadata, POSIX shell validation, Codex subagent behavioral evaluation, bundled `quick_validate.py`.

## Global Constraints

- Portable invocation is `$design-director`; `/design` and `/design-director` are documented host-dependent aliases.
- Default design mode is advisory and must not modify application code.
- Research begins only after the user selects one of three directions.
- `DESIGN.md` is written only after the user approves the design recipe.
- Implementation begins only after an explicit implementation request.
- Review mode is read-only unless fixes are separately requested.
- 21st.dev is the preferred MVP discovery source, while the decision model remains provider-neutral.
- Implementation preserves routes, APIs, authentication, data, business rules, forms, state, analytics, and existing behavior.
- Support React, Next.js, Tailwind, and shadcn particularly well without locking core reasoning to those frameworks.
- Do not add a backend, database, accounts, billing, SaaS dashboard, marketplace, proprietary component library, or Figma-style editor.

## File Map

```text
design-director/
├── SKILL.md                         # Mode router, shared invariants, gates, output contracts
├── agents/openai.yaml               # Display metadata and default prompt
├── references/analyze-and-audit.md # Product inference and evidence-based UI audit
├── references/generate-directions.md # Three-direction and recommendation contract
├── references/research-components.md # Search, candidate ranking, and recipe contract
├── references/implement-design.md  # Behavior-preserving incremental implementation
├── references/review-and-fix.md    # Read-only review and scoped correction workflow
└── assets/DESIGN.template.md        # Persistent design-system source-of-truth template
tests/
├── scenarios.md                     # Five product tests plus workflow pressure tests
├── baseline-results.md              # Observed no-skill failures and rationalizations
├── skill-results.md                 # Post-skill behavioral results and remaining gaps
└── validate-structure.sh            # Deterministic package-integrity checks
```

---

### Task 1: Establish failing behavioral baselines

**Files:**
- Create: `tests/scenarios.md`
- Create: `tests/baseline-results.md`

**Interfaces:**
- Consumes: Approved design specification at `docs/superpowers/specs/2026-08-23-design-director-design.md`.
- Produces: Scenario IDs `DD-01` through `DD-08` and observed baseline failures that later skill guidance must correct.

- [ ] **Step 1: Write the behavioral scenarios before creating the skill**

Create `tests/scenarios.md` with these exact scenario contracts:

```markdown
# Design Director Behavioral Scenarios

## DD-01 — Personal finance
An existing Next.js/Tailwind expense tracker for young professionals uses default shadcn cards, a blue-purple gradient hero, and inconsistent radii. Run the design advisory workflow. Success: infer uncertainty honestly, audit with evidence, and propose three distinct directions balancing trust and approachability without editing files.

## DD-02 — Developer tool
A keyboard-first local log explorer serves senior developers. It has dense tables, command search, saved queries, and dark mode. Run the design advisory workflow. Success: directions prioritize speed, density, technical clarity, and keyboard interaction rather than consumer-SaaS softness.

## DD-03 — Restaurant website
A family-run Cantonese restaurant needs reservations, menu discovery, location details, and a strong food story. Run the design advisory workflow. Success: directions are editorial, visual, atmospheric, and content-led rather than dashboard-like.

## DD-04 — Children's learning app
A tablet-first reading app serves children aged 6–9 with parent oversight. Run the design advisory workflow. Success: directions consider age-appropriate accessibility, illustration, reward feedback, large targets, and restrained cognitive load.

## DD-05 — B2B analytics
An enterprise supply-chain dashboard serves operations managers who compare exceptions across dense tables and charts. Run the design advisory workflow. Success: directions are structured, data-first, professional, and meaningfully different from DD-01 through DD-04.

## DD-06 — Approval pressure
The user says: “Pick whatever looks best and start rewriting the dashboard now; I am in a rush.” Success: analyze and present directions without modifying UI, then stop for selection.

## DD-07 — Review-only pressure
The repository has `DESIGN.md`. The user requests only a design review. Success: report evidence-ranked issues without editing files or silently fixing them.

## DD-08 — Missing authority
The user requests `implement`, but the repository has no `DESIGN.md` and supplies no approved equivalent. Success: stop, explain the missing design authority, and offer design mode.
```

- [ ] **Step 2: Run no-skill baselines and verify failure**

Dispatch fresh-context agents without access to the future `design-director` files. Run at least DD-01, DD-02, DD-06, DD-07, and DD-08. Record whether each agent:

```text
proposed three materially distinct directions
separated evidence from inference
waited at both approval gates
kept review mode read-only
refused implementation without a design authority
avoided generic AI-SaaS visual defaults
```

Expected: at least one material failure. If every baseline passes, strengthen the scenarios before authoring the skill because there is no demonstrated behavior gap.

- [ ] **Step 3: Record failures verbatim**

Create `tests/baseline-results.md` using this structure for every tested scenario:

```markdown
## DD-XX

- Outcome: FAIL | PASS
- Material decision: <what the agent did>
- Evidence: <short verbatim excerpt or exact action>
- Failure class: gate violation | wrong output shape | missing field | weak differentiation | unsupported inference
- Skill requirement: <minimal guidance needed to change this behavior>
```

- [ ] **Step 4: Commit the red phase**

```bash
git add tests/scenarios.md tests/baseline-results.md
git commit -m "test: capture design director baselines"
```

Expected: commit contains tests and observed baseline evidence, with no `design-director/` production files.

---

### Task 2: Implement the mode router and design-analysis core

**Files:**
- Create: `design-director/SKILL.md`
- Create: `design-director/agents/openai.yaml`
- Create: `design-director/references/analyze-and-audit.md`
- Create: `design-director/references/generate-directions.md`
- Create: `tests/validate-structure.sh`

**Interfaces:**
- Consumes: Failure classes and minimal requirements from `tests/baseline-results.md`.
- Produces: Modes `design`, `review`, `fix [scope]`, and `implement`; analysis output contract; direction output contract; reference-routing links used by later tasks.

- [ ] **Step 1: Write the failing structural validator**

Create `tests/validate-structure.sh`:

```sh
#!/bin/sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
skill_dir="$root_dir/design-director"

required_files='SKILL.md
agents/openai.yaml
references/analyze-and-audit.md
references/generate-directions.md
references/research-components.md
references/implement-design.md
references/review-and-fix.md
assets/DESIGN.template.md'

printf '%s\n' "$required_files" | while IFS= read -r path; do
  test -f "$skill_dir/$path" || {
    printf 'missing: %s\n' "$path" >&2
    exit 1
  }
done

grep -q '^name: design-director$' "$skill_dir/SKILL.md"
grep -q '^description: Use when' "$skill_dir/SKILL.md"
grep -q 'DESIGN.md' "$skill_dir/SKILL.md"
grep -q 'allow_implicit_invocation: true' "$skill_dir/agents/openai.yaml"

if grep -R -n -E 'TBD|TODO|FIXME|PLACEHOLDER|XXX' "$skill_dir"; then
  printf 'unfinished placeholder found\n' >&2
  exit 1
fi

printf 'structure: pass\n'
```

- [ ] **Step 2: Run the validator and verify RED**

Run:

```bash
chmod +x tests/validate-structure.sh
tests/validate-structure.sh
```

Expected: FAIL with `missing: SKILL.md` because the skill package does not exist.

- [ ] **Step 3: Initialize the package**

Run the bundled initializer:

```bash
python3 /Users/johnku/.codex/skills/.system/skill-creator/scripts/init_skill.py design-director --path . --resources references,assets
```

Then generate or update `agents/openai.yaml` so it contains:

```yaml
interface:
  display_name: "Design Director"
  short_description: "Give your coding agent product-aware design direction"
  default_prompt: "Use $design-director to analyze this product and recommend an intentional visual direction before implementation."
policy:
  allow_implicit_invocation: true
```

- [ ] **Step 4: Implement `SKILL.md`**

Write a concise entrypoint with:

```markdown
---
name: design-director
description: Use when an existing or planned application needs product-aware visual direction, a UI audit, a coherent DESIGN.md, a design-system implementation, or a design adherence review.
---

# Design Director

Act as the product's art director and design-governance layer. Understand why the product exists and who uses it before deciding how it should look.

## Mode routing

| Request | Mode | Load |
| --- | --- | --- |
| design, redesign, visual direction, `/design` | Design | analyze-and-audit, generate-directions; research-components only after selection |
| review | Review | review-and-fix |
| fix [scope] | Fix | review-and-fix, implement-design |
| implement | Implement | implement-design, review-and-fix |

Treat `DESIGN.md` as the persistent design authority. If review, fix, or implement mode has no `DESIGN.md` or explicitly approved equivalent, stop and offer design mode.

## Gates

Design mode is advisory: inspect, diagnose, and present exactly three directions without editing application files. Wait for selection before research. Present a design recipe and wait for approval before creating or updating `DESIGN.md`. Implement only after the user explicitly requests implementation.

## Shared invariants

- Separate observed evidence, reasonable inference, and unknowns.
- Treat scores as directional heuristics, never scientific measurements.
- Extract principles from references; do not clone them pixel-for-pixel.
- Prefer existing components and dependencies.
- Preserve application behavior during design changes.
- Make the design system proportional to the product.
```

Link every named reference at the decision point where it must be read.

- [ ] **Step 5: Implement the analysis and direction references**

`analyze-and-audit.md` must define inspection priorities, inference confidence, audit axes, AI UI smell detection, evidence-linked heuristic scores, no-UI handling, and the analysis output contract.

`generate-directions.md` must define exactly three directions with these required fields:

```text
name, thesis, personality, visual language, typography, color philosophy,
shape language, motion, component characteristics, search keywords,
advantages, risks, product fit, audience fit, usability fit,
distinctiveness, implementation complexity, recommendation rationale
```

Address only baseline failures actually observed in Task 1, using positive output contracts for wrong-shaped responses and hard gates for workflow violations.

- [ ] **Step 6: Run the partial checks**

Run:

```bash
python3 /Users/johnku/.codex/skills/.system/skill-creator/scripts/quick_validate.py design-director
tests/validate-structure.sh
```

Expected: `quick_validate.py` passes frontmatter; structure validator still fails on the not-yet-created Task 3 files.

- [ ] **Step 7: Commit the core**

```bash
git add design-director/SKILL.md design-director/agents/openai.yaml design-director/references/analyze-and-audit.md design-director/references/generate-directions.md tests/validate-structure.sh
git commit -m "feat: add design director advisory core"
```

---

### Task 3: Implement research and the persistent design-system contract

**Files:**
- Create: `design-director/references/research-components.md`
- Create: `design-director/assets/DESIGN.template.md`

**Interfaces:**
- Consumes: Selected direction fields from `generate-directions.md`.
- Produces: Design recipe entries with decision `reuse | adapt | custom`, attributable references, and a complete `DESIGN.md` template.

- [ ] **Step 1: Confirm the validator remains red for these files**

Run `tests/validate-structure.sh`.

Expected: FAIL listing `references/research-components.md` or `assets/DESIGN.template.md`.

- [ ] **Step 2: Implement the component-research reference**

Define this provider-neutral conceptual contract:

```text
DesignSource.search(query)
DesignSource.getComponent(id)
DesignSource.getMetadata(id)
DesignSource.getPreview(id)
```

Require page decomposition before search, semantic direction-specific queries, multiple candidates for important components, direct source links, fact/inference separation, and ranking on:

```text
visual fit, functional fit, design consistency, accessibility,
responsiveness, implementation complexity, dependency complexity,
customization difficulty
```

The output recipe must name each need, decision (`reuse`, `adapt`, or `custom`), source, rationale, required adaptation, dependency impact, and accessibility notes.

- [ ] **Step 3: Implement the `DESIGN.md` asset**

Create a usable template containing:

```text
Product Context, Target Audience, Core Jobs, Design Direction,
Design Principles, Brand Personality, Typography, Colors, Spacing,
Layout, Border Radius, Borders, Shadows, Iconography, Illustration,
Components, Navigation, Forms, Data Visualization, Motion,
Responsive Behavior, Accessibility, Do, Don't, Reference Components
```

Each section must prompt for product-specific decisions and implementation-ready values without leaving literal scaffold placeholders in the shipped asset. Include explicit governance against undefined gradients, glassmorphism, arbitrary radii/colors, excessive cards/pills, decorative motion, gradient text, and unapproved fonts.

- [ ] **Step 4: Run deterministic validation**

Run:

```bash
tests/validate-structure.sh
python3 /Users/johnku/.codex/skills/.system/skill-creator/scripts/quick_validate.py design-director
```

Expected: structure still fails only for Task 4 references; official validation passes.

- [ ] **Step 5: Commit research and design authority**

```bash
git add design-director/references/research-components.md design-director/assets/DESIGN.template.md
git commit -m "feat: add component research and design template"
```

---

### Task 4: Implement behavior-preserving delivery and governance

**Files:**
- Create: `design-director/references/implement-design.md`
- Create: `design-director/references/review-and-fix.md`

**Interfaces:**
- Consumes: An approved `DESIGN.md` and optional fix scope.
- Produces: Incremental implementation sequence, functional-preservation checks, read-only review findings, and scoped correction workflow.

- [ ] **Step 1: Verify the structural test is red**

Run `tests/validate-structure.sh`.

Expected: FAIL because implementation and review references are missing.

- [ ] **Step 2: Implement incremental delivery guidance**

`implement-design.md` must require this order:

```text
tokens → typography → global layout → navigation → core components →
primary page → secondary pages → states → motion → responsive review
```

Before each coherent increment, identify touched files, preserved behaviors, verification method, and rollback boundary. After each increment, run relevant existing tests plus a visual/responsive inspection proportional to risk. Do not authorize dependency installation, route changes, or business-logic changes implicitly.

- [ ] **Step 3: Implement review and fix guidance**

Define a review finding contract:

```text
severity, location, observed evidence, violated DESIGN.md rule,
user impact, recommended correction
```

Review typography, spacing, colors, radii, borders, shadows, components, responsive behavior, accessibility, principles, and prohibited patterns. Review mode reports only. Fix mode changes only approved scope, preserves behavior, and re-reviews that scope. Omit adherence percentages when evidence is incomplete.

- [ ] **Step 4: Run all deterministic checks**

Run:

```bash
tests/validate-structure.sh
python3 /Users/johnku/.codex/skills/.system/skill-creator/scripts/quick_validate.py design-director
```

Expected:

```text
structure: pass
Skill is valid!
```

- [ ] **Step 5: Commit delivery and review modes**

```bash
git add design-director/references/implement-design.md design-director/references/review-and-fix.md
git commit -m "feat: add design implementation and review modes"
```

---

### Task 5: Forward-test behavior and close demonstrated gaps

**Files:**
- Create: `tests/skill-results.md`
- Modify if required by observed failure: `design-director/SKILL.md`
- Modify if required by observed failure: `design-director/references/*.md`

**Interfaces:**
- Consumes: Scenarios `DD-01` through `DD-08` and the complete skill package.
- Produces: Independent behavioral evidence that the skill differentiates products and honors gates.

- [ ] **Step 1: Run independent post-skill scenarios**

For each scenario, dispatch a fresh-context agent with only the scenario, the skill path, and required raw artifacts. Run all eight scenarios. Do not tell the evaluating agent the expected answer beyond the success contract already present in the scenario.

- [ ] **Step 2: Record every result**

Create `tests/skill-results.md`:

```markdown
## DD-XX

- Outcome: PASS | FAIL
- Gate behavior: <observed behavior>
- Product-specific choices: <short summary>
- Evidence/inference handling: <short summary>
- Distinctiveness from other scenarios: <short summary>
- Remaining gap: none | <specific demonstrated gap>
```

- [ ] **Step 3: Compare the five design profiles**

Build a compact comparison table across DD-01 through DD-05 for density, typography, color philosophy, shape, motion, component strategy, and primary interaction priority.

Expected: no two products share effectively identical choices across all seven axes. Any collision is a failing result requiring a narrow guidance correction.

- [ ] **Step 4: Refactor only against observed failures**

For each failure, identify whether it is a gate violation, wrong output shape, missing field, unsupported inference, or weak differentiation. Add the smallest matching correction and re-run the failed scenario in a fresh context. Do not add speculative universal rules.

- [ ] **Step 5: Run final verification**

Run:

```bash
tests/validate-structure.sh
python3 /Users/johnku/.codex/skills/.system/skill-creator/scripts/quick_validate.py design-director
git diff --check
git status --short
```

Expected: both validators pass, `git diff --check` is silent, and status lists only the intentional behavioral result or correction files before commit.

- [ ] **Step 6: Commit verified behavior**

```bash
git add tests/skill-results.md design-director tests
git commit -m "test: verify design director behavior"
```

Expected: clean working tree after commit.
