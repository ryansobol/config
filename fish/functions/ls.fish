function ls --description='List contents of directory' --wraps=eza
  if command --query eza
    eza $argv
  else
    command ls $argv
  end
end
