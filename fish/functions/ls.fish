if command --query exa
  function ls --description='List contents of directory' --wraps=exa
    exa $argv
  end
end
