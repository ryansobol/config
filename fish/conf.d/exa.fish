function _exa_install --on-event exa_install
  brew install exa
end

function _exa_uninstall --on-event exa_uninstall
  brew uninstall exa
end

set --global fzf_preview_dir_cmd exa --all --color=always
