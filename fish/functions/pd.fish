function _find_project -a pattern
  set -l paths $HOME/Projects/{2016,2015}
  find $paths -type d -maxdepth 2 | ack --ignore-case --max-count=1 $pattern
end

function pd --description 'Change to a project directory'
  set -l project (_find_project "$argv[1]\$")

  if test $status -eq 0
    return (cd $project)
  end

  set -l project (_find_project $argv[1])

  if test $status -eq 0
    return (cd $project)
  end
end
