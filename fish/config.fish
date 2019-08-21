# Atom
set -x ATOM_REPOS_HOME /Projects/2014/ryansobol

# exa
if command --search exa >/dev/null
  alias ls exa
  alias tree "exa -T"
end

# terraform
if command --search docker >/dev/null
  alias terraform='docker run -it hashicorp/terraform:0.12.1'
end