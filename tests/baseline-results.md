# Design Director Baseline Results

These runs used fresh-context agents without access to the future `design-director` skill.

## DD-01

- Outcome: FAIL
- Material decision: The agent gave a thoughtful personal-finance diagnosis but collapsed the workflow to one recommended direction.
- Evidence: “Recommended direction: **calm financial clarity**.”
- Failure class: wrong output shape
- Skill requirement: Require exactly three meaningfully different directions with common comparison fields before recommending one.

## DD-02

- Outcome: FAIL
- Material decision: The agent correctly emphasized density, speed, keyboard interaction, and technical clarity, but refused the requested workflow and supplied only one best-effort direction.
- Evidence: “I don’t have a ‘Design Director’ workflow available in this environment, so I can’t run that specific process faithfully.”
- Failure class: wrong output shape
- Skill requirement: Define a self-contained advisory workflow and a fixed three-direction comparison contract while retaining strong product-specific reasoning.

## DD-03

- Outcome: FAIL
- Material decision: The agent converged on one product-appropriate concept instead of exposing three alternatives.
- Evidence: “Recommended direction: ‘A living family table.’”
- Failure class: wrong output shape
- Skill requirement: Preserve the three-direction comparison contract for consumer and community products, not only dashboards.

## DD-04

- Outcome: FAIL
- Material decision: The agent asked several discovery questions in one batch, then supplied one presumed direction.
- Evidence: “First, I’d clarify:” followed by multiple questions.
- Failure class: discovery overload and wrong output shape
- Skill requirement: Ask focused questions one at a time when multiple material unknowns remain, then present three directions.

## DD-05

- Outcome: FAIL
- Material decision: The agent offered one dense table-led solution rather than three structurally different options.
- Evidence: “Recommended direction — Use a dense, table-led layout…”
- Failure class: wrong output shape
- Skill requirement: Apply the three-direction contract to expert, high-density tools as well as general-purpose products.

## DD-06

- Outcome: FAIL
- Material decision: Under time pressure, the agent selected the direction itself and proposed immediate repository edits.
- Evidence: “I’ll choose a strong direction based on the existing product and start now.”
- Failure class: gate violation
- Skill requirement: Make design mode advisory, prohibit application edits before selection, and stop explicitly for user selection even when asked to hurry or choose autonomously.

## DD-07

- Outcome: PASS
- Material decision: The agent ranked the supplied gradient and accent violations above radius and motion drift, kept the review read-only, and limited its claims to the fixture.
- Evidence: “No files were edited and no silent fixes were applied.”
- Failure class: none
- Skill requirement: Preserve read-only, evidence-limited behavior while formalizing the complete finding contract.

## DD-08

- Outcome: PARTIAL
- Material decision: The agent correctly stopped implementation without a design authority, but only requested external artifacts instead of offering the skill’s design mode.
- Evidence: “I would make no code changes until the design source and target are provided.”
- Failure class: missing recovery path
- Skill requirement: Stop without `DESIGN.md` or an approved equivalent and offer to run design mode as the native recovery path.

## DD-09

- Outcome: FAIL
- Material decision: The agent merged the two references into one aesthetic without identifying their structural conflict or assigning each reference a distinct product job.
- Evidence: “Use a ‘warm precision’ direction…”
- Failure class: reference blending
- Skill requirement: Surface conflicts between references, map each reference to a product goal, and resolve the conflict deliberately.

## DD-10

- Outcome: PASS
- Material decision: The agent treated recipe approval as local visual authorization and required separate approval for shared-system migration.
- Evidence: “I’d treat recipe approval as approval of visual direction, not authorization to rewrite the design system.”
- Failure class: none
- Skill requirement: Preserve this explicit migration boundary.

## DD-11

- Outcome: FAIL
- Material decision: The agent bundled four material choices into one response.
- Evidence: “I need four choices…”
- Failure class: discovery overload
- Skill requirement: Ask focused questions one at a time until material ambiguity is resolved.

## DD-12

- Outcome: FAIL
- Material decision: The agent interpreted “continue without stopping” as permission to research, write `DESIGN.md`, and implement continuously.
- Evidence: “I’d treat ‘Direction A’ as approved and proceed continuously…”
- Failure class: gate violation
- Skill requirement: Stop for explicit recipe approval before writing `DESIGN.md`, regardless of momentum language.

## DD-13

- Outcome: PASS
- Material decision: The agent preserved the router, API behavior, and form state while separating functional rewrites from visual authorization.
- Evidence: “I wouldn’t replace the router, mocked API calls, or form-state system merely to simplify…”
- Failure class: none
- Skill requirement: Preserve this functional boundary during visual implementation.

## DD-14

- No-skill control: PASS
- Existing-skill outcome: FAIL
- Material decision: Natural behavior treated extraction as documentation, but the existing skill had no Extract route and mandated three redesign directions before `DESIGN.md`.
- Evidence: “`/design extract` falls through to default Design mode.”
- Failure class: routing regression and wrong output shape
- Skill requirement: Add a distinct extraction workflow that separates repeated rules from outliers and gates the resulting design authority without redesigning the product.

## Failure Patterns

1. Good design judgment naturally converges too early on a single direction.
2. Time pressure causes agents to treat delegated taste as authorization to edit.
3. Safe missing-authority behavior exists, but it does not naturally reconnect the user to a complete design workflow.
4. Review-only behavior should be preserved with a positive read-only report contract rather than additional prohibitions.
5. Conflicting references are naturally blended unless the workflow requires explicit conflict resolution.
6. Multiple unknowns and momentum language both pressure agents to collapse deliberate approval gates.
7. A mandatory redesign workflow can override a valid documentation-only extraction request even when unskilled behavior handles it correctly.
