export PROMPT_DIRTRIM=2

_git_branch_name() {
	git symbolic-ref --short HEAD 2> /dev/null
}

_is_git_dirty() {
  git status --short --ignore-submodules=dirty 2> /dev/null
}

_git_branch_prompt() {
	if [[ $? -eq 0 ]]; then
    PS1="\[\033[0;34m\]"
  else
    PS1="\[\033[0;31m\]"
  fi

	PS1="$PS1\w "

	if [[ -n $(_git_branch_name) ]]; then
		PS1="$PS1\[\033[0;33m\]$(_git_branch_name) "

		if [[ -n $(_is_git_dirty) ]]; then
			PS1="$PS1\[\033[0;31m\]✖ "
    else
			PS1="$PS1\[\033[0;32m\]✔ "
    fi
	else
		PS1="$PS1\[\033[0;35m\]\$ "
	fi

	PS1="$PS1\[\033[0;37m\]"
}

PROMPT_COMMAND=_git_branch_prompt
