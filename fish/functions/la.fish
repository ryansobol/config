function la --description='List contents of directory, including hidden files in directory using long format' --wraps=exa
  exa --all --header --long $argv
end
