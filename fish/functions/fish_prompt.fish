set fish_greeting

set fish_color_command normal --bold
set fish_color_comment black
set fish_color_history_current cyan
set fish_color_param normal
set fish_color_quote green
set fish_color_search_match --background=515151
set fish_color_cwd blue
set fish_pager_color_prefix normal
set fish_pager_color_completion blue
set fish_pager_color_description black

function _git_branch_name
  echo (git symbolic-ref --short HEAD ^/dev/null)
end

function _is_git_dirty
  echo (git status --short --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  if test $status -eq 0
    set_color $fish_color_cwd
  else
    set_color $fish_color_error
  end

  echo -n (prompt_pwd)

  set -l branch (_git_branch_name)

  if test -n $branch
    set_color yellow
    echo -n " $branch "

    if test -n (_is_git_dirty)
      set_color red
      echo -n "✖ "
    else
      set_color green
      echo -n "✔ "
    end
  else
    set_color magenta
    echo -n ' $ '
  end

  set_color normal
end
