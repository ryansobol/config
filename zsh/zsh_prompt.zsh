_git_branch_name() {
  echo $(git symbolic-ref --short HEAD 2>/dev/null)
}

_is_git_dirty() {
  echo $(git status --short --ignore-submodules=dirty 2>/dev/null)
}

export PROMPT=''

if [[ $LAST_EXIT_CODE -eq 0 ]]; then
  PROMPT="$PROMPT%F{blue}"
else
  PROMPT="$PROMPT%F{red}"
fi

PROMPT="$PROMPT%~ "

branch=$(_git_branch_name)

if [[ -n $branch ]]; then
  PROMPT="$PROMPT%F{yellow}$branch "

  if [[ -n $(_is_git_dirty)]]; then
    PROMPT="$PROMPT%F{red}%B×%b%f "
  else
    PROMPT="$PROMPT%F{green}%B✓%b%f "
  fi
else
  PROMPT="$PROMPT%f❯ "
fi
