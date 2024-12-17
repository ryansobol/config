#!/usr/bin/env fish

# Install fisher if not already installed
if not functions -q fisher
	brew install fisher
end

# List of plugins to install
set --local plugins \
	jethrokuan/z \
	jorgebucaran/replay.fish \
	patrickf1/fzf.fish

# Get currently installed plugins
set --local installed_plugins (fisher list)

# Install plugins if not already installed
for plugin in $plugins
	if not contains $plugin $installed_plugins
		fisher install $plugin
	end
end