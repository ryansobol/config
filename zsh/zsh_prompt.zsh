_git_branch_name() {
  git symbolic-ref --short HEAD 2>/dev/null
}

_is_git_dirty() {
  git status --short --ignore-submodules=dirty 2>/dev/null
}

_git_branch_prompt() {
  local last_exit_code=$?

  if [[ $last_exit_code -eq 0 ]]; then
    PROMPT="%F{blue}"
  else
    PROMPT="%F{red}"
  fi

  PROMPT="$PROMPT%~ "

  local branch=$(_git_branch_name)

  if [[ -n $branch ]]; then
    PROMPT="$PROMPT%F{yellow}$branch "

    if [[ -n $(_is_git_dirty) ]]; then
      PROMPT="$PROMPT%F{red}%B×%b%f "
    else
      PROMPT="$PROMPT%F{green}%B✓%b%f "
    fi
  else
    PROMPT="$PROMPT%f❯ "
  fi
}

precmd() {
  _git_branch_prompt
}
