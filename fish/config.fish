set fish_greeting

set fish_color_command normal --bold
set fish_color_comment black
set fish_color_history_current cyan
set fish_color_param normal
set fish_color_quote green
set fish_color_search_match --background=515151
set fish_pager_color_prefix normal
set fish_pager_color_completion blue
set fish_pager_color_description black

# Atom
set -gx EDITOR 'atom -wd'
set -gx ATOM_REPOS_HOME /Projects/2014/ryansobol

# postgres
set -gx PGDATA /usr/local/var/postgres

# chruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
