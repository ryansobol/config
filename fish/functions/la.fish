if command --query eza
  function la --description='List contents of directory, including hidden files in directory using long format' --wraps=eza
    eza --all --header --long $argv
  end
end
