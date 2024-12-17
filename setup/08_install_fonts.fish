#!/usr/bin/env fish

set --local keg epk/epk

# Tap the keg
if not contains $keg (brew tap)
	brew tap $keg
end

set --local font font-sf-mono-nerd-font

# Install the font
if not contains $font (brew list --cask)
	brew install --cask $font
end
