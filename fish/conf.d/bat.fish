function _bat_install --on-event bat_install
  brew install bat
end

function _bat_uninstall --on-event bat_uninstall
  brew uninstall bat
end
