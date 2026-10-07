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

skill_words=$(wc -w < "$skill_dir/SKILL.md" | tr -d ' ')
test "$skill_words" -lt 500 || {
  printf 'SKILL.md too large: %s words (must be under 500)\n' "$skill_words" >&2
  exit 1
}

test ! -e "$root_dir/.getsuperpower" || {
  printf 'internal audit artifacts must not ship: .getsuperpower\n' >&2
  exit 1
}

if grep -R -n -E 'TBD|TODO|FIXME|PLACEHOLDER|XXX' "$skill_dir"; then
  printf 'unfinished placeholder found\n' >&2
  exit 1
fi

printf 'structure: pass\n'
