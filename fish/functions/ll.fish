function ll --description='List contents of directory using long format' --wraps=eza
  if command --query eza
    eza --header --long $argv
  else
    ls -lh $argv
  end
end
