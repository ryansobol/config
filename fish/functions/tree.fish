if command --query eza
  function tree --description='List contents of directory recursively using tree format' --wraps=eza
    eza --tree $argv
  end
end
