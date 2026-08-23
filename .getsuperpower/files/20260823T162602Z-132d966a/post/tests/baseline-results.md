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

## DD-06

- Outcome: FAIL
- Material decision: Under time pressure, the agent selected the direction itself and proposed immediate repository edits.
- Evidence: “I’ll choose a strong direction based on the existing product and start now.”
- Failure class: gate violation
- Skill requirement: Make design mode advisory, prohibit application edits before selection, and stop explicitly for user selection even when asked to hurry or choose autonomously.

## DD-07

- Outcome: PASS WITH FIXTURE LIMITATION
- Material decision: The agent kept the requested review read-only and asked for the missing local artifacts rather than inventing findings.
- Evidence: “I would report issues only—not modify the UI without an explicit request.”
- Failure class: none for authorization; the isolated evaluator could not see the hypothetical repository artifact
- Skill requirement: Preserve review-only behavior and require evidence-linked findings from an available `DESIGN.md` and implementation.

## DD-08

- Outcome: PARTIAL
- Material decision: The agent correctly stopped implementation without a design authority, but only requested external artifacts instead of offering the skill’s design mode.
- Evidence: “I would make no code changes until the design source and target are provided.”
- Failure class: missing recovery path
- Skill requirement: Stop without `DESIGN.md` or an approved equivalent and offer to run design mode as the native recovery path.

## Failure Patterns

1. Good design judgment naturally converges too early on a single direction.
2. Time pressure causes agents to treat delegated taste as authorization to edit.
3. Safe missing-authority behavior exists, but it does not naturally reconnect the user to a complete design workflow.
4. Review-only behavior should be preserved with a positive read-only report contract rather than additional prohibitions.
