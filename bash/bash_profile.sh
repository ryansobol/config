# Atom
export EDITOR='atom -w'
export ATOM_REPOS_HOME=/Projects/2014/ryansobol

# bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# cd
alias ..='cd ..'

# exa
if [[ -n $(which exa) ]]; then
  alias ls=exa
  alias tree='exa -T'
fi

# ls
alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -hal'

# PS1
source ~/.config/bash/prompt.sh
