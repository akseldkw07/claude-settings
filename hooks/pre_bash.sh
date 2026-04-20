#!/bin/bash
here=$(dirname "$0")
. "$here/lib/conda_prefix.sh"
. "$here/lib/env_prefix.sh"

input=$(cat)
cmd=$(echo "$input" | jq -r '.tool_input.command // empty')
[ -z "$cmd" ] && exit 0

new_cmd="$(emit_conda_prefix) && { $(emit_env_prefix); $cmd; }"
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","updatedInput":{"command":%s}}}' "$(printf '%s' "$new_cmd" | jq -Rs .)"
