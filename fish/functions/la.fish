function la --description='List contents of directory, including hidden files in directory using long format' --wraps=eza
  if command --query eza
    eza --all --header --long $argv
  else
    ls -lAh $argv
  end
end
