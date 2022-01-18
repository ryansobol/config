# fzf and fzf.fish
if command --query fzf
  # fzf.fish
  fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs
  set --global fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git

  # fzf
  set --export FZF_DEFAULT_COMMAND "fd --type f --color always $fzf_fd_opts"
  set --export FZF_DEFAULT_OPTS '--ansi --border --height 40% --layout=reverse'
end
