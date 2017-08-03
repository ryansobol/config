# Atom
set -x EDITOR 'atom -w'
set -x ATOM_REPOS_HOME /Projects/2014/ryansobol

# Docker
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH /Users/ryansobol/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1

# exa
if test -n (which exa)
  alias ls exa
  alias tree "exa -T"
end

# chruby
# source /usr/local/share/chruby/chruby.fish
# source /usr/local/share/chruby/auto.fish

# virtualfish
# source ~/.virtualfish/virtual.fish
# source ~/.virtualfish/projects.fish
