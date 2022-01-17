function ll --description='List contents of directory using long format' --wraps=exa
  exa --header --long $argv
end
