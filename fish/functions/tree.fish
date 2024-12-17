function tree --description='List contents of directory recursively using tree format' --wraps=eza
  if command --query eza
    eza --tree $argv
  else
    echo "eza command not found"
    return 1
  end
end

