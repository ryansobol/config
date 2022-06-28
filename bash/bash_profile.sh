# atom
# export EDITOR='atom -w'
export ATOM_REPOS_HOME=/Projects/2014/ryansobol

# bash-completion
if [[ -f /usr/local/etc/bash_completion ]]; then
  source /usr/local/etc/bash_completion
fi

# cd
shopt -s autocd

# exa
if [[ -n $(which exa) ]]; then
  alias ls=exa
  alias tree='exa -T'
fi

# ls
alias ls='ls -G'
alias ll='ls -hl'
alias la='ls -hal'

# prompt
source ~/.config/bash/bash_prompt.sh
