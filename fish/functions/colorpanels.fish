function colorpanels --description="Print a colorized panel for each color in the terminal's theme"
  echo

  set -l colors black white red yellow green cyan blue magenta

  for color in $colors
    set_color $color
    echo -n ████

    set_color "br"$color
    echo -n ▄"  "
  end

  echo

  for color in $colors
    set_color $color
    echo -n ████

    set_color "br"$color
    echo -n █"  "
  end

  echo

  for color in $colors
    set_color $color
    echo -n ████

    set_color "br"$color
    echo -n █"  "
  end

  echo

  for color in $colors
    set_color "br"$color
    echo -n " "▀▀▀▀"  "
  end

  echo
end
