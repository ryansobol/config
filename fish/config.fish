# Atom
# set -x EDITOR 'atom -w'
set -x ATOM_REPOS_HOME /Projects/2014/ryansobol

# exa
if command --search exa >/dev/null
  alias ls exa
  alias tree "exa -T"
end
