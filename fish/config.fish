# exa
if command --query exa
  alias ls exa
  alias tree "exa -T"
end

# fzf and fzf.fisher
if command --query fzf
  # fzf.fisher
  fzf_configure_bindings --directory=\cf

  set fzf_fd_opts --exclude=Documents --exclude=Library
  set fzf_preview_dir_cmd exa --all --color=always

  # fzf
  set -x FZF_DEFAULT_COMMAND "fd --type f $fzf_fd_opts"
end

# bat
if command --query bat
  alias cat bat
end

# terraform
# if command --query docker
#   alias terraform="docker run -it -v $PWD:/app -w /app hashicorp/terraform:0.12.1"
# end

# brew python@3.9
fish_add_path -g /usr/local/opt/python@3.9/bin

# brew python@3.10
fish_add_path -g /usr/local/opt/python@3.10/bin
fish_add_path -g /usr/local/opt/python@3.10/libexec/bin

# pyenv
# set -x PYENV_ROOT $HOME/.pyenv
# set -g fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# status is-login; and pyenv init --path | source
# status is-interactive; and pyenv init - | source

# compiling python 3.6.15 using pyenv
# set -gx LDFLAGS "-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/openssl@1.1/lib -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl@1.1/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
# set -gx CFLAGS "-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl@1.1/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"

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
