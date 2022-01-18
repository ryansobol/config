# fzf and fzf.fisher
if command --query fzf
  # fzf.fisher
  fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

  set fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git

  # fzf
  set -x FZF_DEFAULT_COMMAND "fd --type f $fzf_fd_opts"
end
