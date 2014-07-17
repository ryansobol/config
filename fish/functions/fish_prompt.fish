function _git_branch_name
  echo (git symbolic-ref --short HEAD ^/dev/null)
end

function _is_git_dirty
  echo (git status --short --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)
  set -l yellow (set_color yellow)
  set -l magenta (set_color magenta)

  set -l branch (_git_branch_name)
  set -l prompt

  if test -n $branch
    if test -n (_is_git_dirty)
      set prompt $red✗
    else
      set prompt $green✔
    end
  else
    set prompt $magentaॐ
    set branch "\b"
  end

  echo -ne $blue(prompt_pwd) $yellow$branch $prompt $normal
end
