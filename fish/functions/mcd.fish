function mcd --description 'Make a directory then change into it'
  test -d $argv[1]; or mkdir $argv[1]
  cd $argv[1]
end
