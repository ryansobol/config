#!/usr/bin/env fish

set --local utils bat eza fd fzf git

for util in $utils
	if not type -q $util
		brew install $util
	end
end
