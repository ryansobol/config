#!/usr/bin/env fish

set --local utils bat eza fd fzf git

for util in $utils
	# check if a utility is NOT available in the current shell's path
	if not type -q $util
		brew install $util
	end
end
