if command --query eza
  function ll --description='List contents of directory using long format' --wraps=eza
    eza --header --long $argv
  end
end
