#!/usr/bin/env bash

# Exit on any error
set -euo pipefail

# Check if running on macOS
echo -n "Checking if running on macOS: "
if [ "$(uname)" = "Darwin" ]; then
	echo "Yes!"
else
	echo "No! This script is only for macOS"
	exit 1
fi

# Check for Xcode Command Line Tools
echo -n "Checking for Xcode Command Line Tools: "
if xcode-select -p &> /dev/null; then
	echo "Installed!"
else
	echo "Uninstalled!"

	echo "Installing Xcode Command Line Tools..."
	xcode-select --install

	echo "Press the return key after the Xcode CLI installation has completed to continue..."
	read -s -r
fi

# Check for Homebrew
echo -n "Checking for Homebrew: "
if command -v brew &> /dev/null; then
	echo "Installed!"
else
	echo "Uninstalled!"

	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi