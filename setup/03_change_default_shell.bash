#!/usr/bin/env bash

# Exit on any error
set -euo pipefail

# Check for fish
echo -n "Checking for fish: "
if command -v fish &> /dev/null; then
	echo "Installed!"
else
	echo "Uninstalled! Installing fish with Homebrew..."
	brew install fish
fi

# Check for Homebrew environment variables
echo -n "Checking for Homebrew environment variables: "
if [ -z "${HOMEBREW_REPOSITORY:-}" ]; then
	echo "Unset! Setting Homebrew environment variables..."
	eval "$(brew shellenv)"
else
	echo "Set!"
fi

# Check if fish is in /etc/shells
echo -n "Checking if fish is in /etc/shells: "
if grep -q "$HOMEBREW_REPOSITORY/bin/fish" /etc/shells; then
	echo "Present!"
else
	echo "Missing! Adding fish to /etc/shells..."
	echo "$HOMEBREW_REPOSITORY/bin/fish" | sudo tee -a /etc/shells
fi

# Check if fish is default shell
echo -n "Checking if fish is your default shell: "
if [ "$SHELL" = "$HOMEBREW_REPOSITORY/bin/fish" ]; then
	echo "Yes!"
else
	echo "No! Changing your default shell to fish..."
	chsh -s "$HOMEBREW_REPOSITORY/bin/fish"
fi
