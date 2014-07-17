function trash --description 'Move files to the Finder Trash'
  set -l trash_path $HOME/.Trash

  for arg in $argv
    if test -e $arg
      set -l file (basename $arg)

      if test -e $trash_path/$file
        mv -f $arg $trash_path/$file.(date +%s)
      else
        mv -f $arg $trash_path
      end
    end
  end
end
