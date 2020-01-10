function _find_project -a pattern
  set -l paths $HOME/Projects/{2020,2019}
  find $paths -type d -maxdepth 2 | ack --ignore-case -1 $pattern
end

function pd --description 'Change to a project directory'
  set -l dir $argv[1]
  set -l patterns "/$dir\$" "$dir\$" $dir

  for pattern in $patterns
    set -l project (_find_project $pattern)

    if test $status -eq 0
      return (cd $project)
    end
  end
end
