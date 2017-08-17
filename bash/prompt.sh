PROMPT_DIRTRIM=1

blue='\e[0;34m'
green='\e[0;32m'
purple='\e[0;35m'
red='\e[0;31m'
white='\e[0;37m'
yellow='\e[0;33m'

_git_branch_name() {
  git symbolic-ref --short HEAD 2> /dev/null
}

_is_git_dirty() {
  git status --short --ignore-submodules=dirty 2> /dev/null
}

_git_branch_prompt() {
  if [[ $? -eq 0 ]]; then
    PS1="$blue"
  else
    PS1="$red"
  fi

  PS1="$PS1\w"
  branch=$(_git_branch_name)

  if [[ $? -eq 0 ]]; then
    PS1="$PS1$yellow $branch"

    if [[ -n $(_is_git_dirty) ]]; then
      PS1="$PS1$red ✖"
    else
      PS1="$PS1$green ✔"
    fi
  else
    PS1="$PS1$purple \$"
  fi

  PS1="$PS1$white "
}

PROMPT_COMMAND=_git_branch_prompt
