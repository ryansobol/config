#!/usr/bin/env fish

# List of apps to install
set --local apps \
	1password \
	bartender \
	cursor \
	elgato-camera-hub \
	elgato-control-center \
	firefox@developer-edition \
	ghostty \
	google-chrome@dev \
	raycast \
	steermouse

# Get currently installed apps
set --local installed_apps (brew list --cask)

# Install apps
for app in $apps
	if not contains $app $installed_apps
		brew install --cask $app
	end
end
