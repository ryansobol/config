function cat --description='Print the syntax-highlighted content of a collection of files to the terminal' --wraps=bat
  if command --query bat
    bat $argv
  else
    command cat $argv
  end
end
