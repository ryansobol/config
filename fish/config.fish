# fzf and fzf.fisher
if command --query fzf
  # fzf.fisher
  fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs

  set fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git
  set fzf_preview_dir_cmd exa --all --color=always

  # fzf
  set -x FZF_DEFAULT_COMMAND "fd --type f $fzf_fd_opts"
end

# brew python@3.9
fish_add_path -g /usr/local/opt/python@3.9/bin

# brew python@3.10
fish_add_path -g /usr/local/opt/python@3.10/bin
fish_add_path -g /usr/local/opt/python@3.10/libexec/bin

# tsk-website
set -x DJANGO_VIMEO_API_TOKEN ...
set -x DJANGO_VIMEO_API_SECRET ...
set -x DJANGO_OAUTH_CLASSLINK_CLIENT_SECRET ...
set -x DJANGO_OAUTH_CLEVER_CLIENT_SECRET ...
set -x DJANGO_OAUTH_GOOGLE_CLIENT_SECRET ...
set -x DJANGO_OAUTH_GITHUB_AUTOMATED_TESTS_CLIENT_SECRET ...
set -x DJANGO_OAUTH_GITHUB_LOCAL_DEV_CLIENT_SECRET ...
set -x DJANGO_GOOGLE_TEST_USER_PASSWORD ...
set -x DJANGO_GITHUB_TEST_USER_PASSWORD ...
