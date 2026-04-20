# Emits a snippet that sources `.env` (if present in CWD) with auto-export.
emit_env_prefix() {
  printf '%s' '[ -f .env ] && { set -a; source .env; set +a; }'
}
