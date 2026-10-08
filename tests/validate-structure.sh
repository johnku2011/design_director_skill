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
references/extract-design-system.md
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

skill_words=$(wc -w < "$skill_dir/SKILL.md" | tr -d ' ')
test "$skill_words" -lt 500 || {
  printf 'SKILL.md too large: %s words (must be under 500)\n' "$skill_words" >&2
  exit 1
}

test ! -e "$root_dir/.getsuperpower" || {
  printf 'internal audit artifacts must not ship: .getsuperpower\n' >&2
  exit 1
}

scenario_ids=$(sed -n 's/^## \(DD-[0-9][0-9]\).*/\1/p' "$root_dir/tests/scenarios.md")
result_ids=$(sed -n 's/^## \(DD-[0-9][0-9]\).*/\1/p' "$root_dir/tests/skill-results.md")
baseline_ids=$(sed -n 's/^## \(DD-[0-9][0-9]\).*/\1/p' "$root_dir/tests/baseline-results.md")
test "$scenario_ids" = "$result_ids" && test "$scenario_ids" = "$baseline_ids" || {
  printf 'behavioral scenario/result IDs differ\n' >&2
  exit 1
}

printf '%s\n' "$scenario_ids" | awk '
  BEGIN { expected = 1 }
  {
    wanted = sprintf("DD-%02d", expected)
    if ($0 != wanted) exit 1
    expected++
  }
  END { if (expected == 1) exit 1 }
' || {
  printf 'behavioral IDs must be unique and ordered from DD-01\n' >&2
  exit 1
}

if grep -R -n -E 'TBD|TODO|FIXME|PLACEHOLDER|XXX' "$skill_dir"; then
  printf 'unfinished placeholder found\n' >&2
  exit 1
fi

printf 'structure: pass\n'
