function _eza_install --on-event eza_install
  brew install eza
end

function _eza_uninstall --on-event eza_uninstall
  brew uninstall eza
end
