#!/usr/bin/env fish

# List of apps to install
set --local apps \
	1password \
	steermouse \
	cursor \
	firefox@developer-edition \
	google-chrome@dev \
	elgato-camera-hub \
	elgato-control-center

# Get currently installed apps
set --local installed_apps (brew list --cask)

# Install apps
for app in $apps
	if not contains $app $installed_apps
		brew install --cask $app
	end
end
