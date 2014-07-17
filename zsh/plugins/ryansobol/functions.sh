pj() {
  paths=($HOME/Projects/2014 $HOME/Projects/2013 $HOME/Projects/2012)
  cd $(find $paths -type d -maxdepth 4 | ack -i $* | ack -v Pods --max-count=1)
}
