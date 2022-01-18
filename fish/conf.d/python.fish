function _python_install --on-event python_install
  brew install python@3.9 python@3.10

  fish_add_path --universal $HOMEBREW_PREFIX/opt/python@3.9/bin
  fish_add_path --universal $HOMEBREW_PREFIX/opt/python@3.10/bin
  fish_add_path --universal $HOMEBREW_PREFIX/opt/python@3.10/libexec/bin
end

function ___fish_remove_path --argument-names var_scope user_path
  set --local index (contains --index $user_path $fish_user_paths)
  set --erase $var_scope fish_user_paths[$index]
end

function _python_uninstall --on-event python_uninstall
  ___fish_remove_path --universal $HOMEBREW_PREFIX/opt/python@3.10/libexec/bin
  ___fish_remove_path --universal $HOMEBREW_PREFIX/opt/python@3.10/bin
  ___fish_remove_path --universal $HOMEBREW_PREFIX/opt/python@3.9/bin

  brew uninstall python@3.9 python@3.10
end
