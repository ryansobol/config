if command --query eza
  function ls --description='List contents of directory' --wraps=eza
    eza $argv
  end
end
