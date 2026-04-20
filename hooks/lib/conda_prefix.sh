# Emits the zsh snippet that activates micromamba env `kret_312`.
# Must be chained with `&&` before the user command so activation gates execution.
emit_conda_prefix() {
  printf '%s' 'autoload -Uz compinit && compinit -u 2>/dev/null; eval "$(/usr/local/bin/micromamba shell hook --shell zsh)" && micromamba activate kret_312'
}
