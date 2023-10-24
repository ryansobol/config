# fzf and fzf.fish
if command --query fzf
  # fzf.fish
  fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs
  set --global fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git

  set --global fzf_preview_dir_cmd eza --all --color=always

  # fzf
  set --export FZF_DEFAULT_COMMAND "fd --type f --color always $fzf_fd_opts"
  set --export FZF_DEFAULT_OPTS '--ansi --border --color prompt:blue,pointer:white,marker:green:bold,info:yellow,hl:green,spinner:cyan --cycle --height 40% --marker ✓ --layout reverse --pointer ❯ --preview-window=wrap --prompt "❯ "'
end
