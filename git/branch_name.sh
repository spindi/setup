#!/usr/bin/env bash
set -euo pipefail

workitem="${1:-}"

if [[ -z "$workitem" ]]; then
  echo "Usage: $0 PROJECT-123" >&2
  exit 1
fi

if [[ ! "$workitem" =~ ^[A-Z][A-Z0-9]+-[0-9]+$ ]]; then
  echo "Invalid Jira work item: $workitem" >&2
  exit 1
fi

ticket_json="$(
  acli jira workitem view "$workitem" \
    --fields summary \
    --json
)"

summary="$(
  jq -r '.fields.summary // .summary // empty' <<< "$ticket_json"
)"

if [[ -z "$summary" ]]; then
  echo "No summary found for $workitem." >&2
  exit 1
fi

slug="$(
  printf '%s' "$summary" |
    tr '[:upper:]' '[:lower:]' |
    sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//' |
    cut -c1-60 |
    sed -E 's/-+$//'
)"

printf '%s-%s' "$workitem" "$slug"
