function pd --description 'Change to a project directory'
  set -l paths $HOME/Projects/{2014,2013,2014}
  cd (find $paths -type d -maxdepth 2 | ack -i $argv[1] | ack -v Pods --max-count=1)
end
