#!/usr/bin/env bash

# Script to enable Touch ID authentication for sudo commands
# Requires sudo privileges to modify system files

# Exit on error, undefined vars, and pipe failures
set -euo pipefail

# Check if running on macOS
echo -n "Checking if running on macOS: "
if [ "$(uname)" = "Darwin" ]; then
	echo "Success!"
else
	echo "Error! This script is only for macOS"
	exit 1
fi

TEMPLATE_FILE="/etc/pam.d/sudo_local.template"
TARGET_FILE="/etc/pam.d/sudo_local"

# Check if running with sudo (SUDO_USER set) or as root (EUID=0)
echo -n "Checking for sudo privileges: "
if [ -n "${SUDO_USER:-}" ] || [ "$EUID" -eq 0 ]; then
	echo "Success!"
else
	echo "Error! Re-run this script with sudo privileges or as root"
	exit 1
fi

# Check if template file exists
echo -n "Checking for template file ($TEMPLATE_FILE): "
if [ -f "$TEMPLATE_FILE" ]; then
	echo "Success!"
else
	echo "Error! Template file not found"
	exit 1
fi

# Create backup of existing file if it exists
echo -n "Checking for target file ($TARGET_FILE): "
if [ -f "$TARGET_FILE" ]; then
	echo "Exists!"

	BACKUP_FILE="${TARGET_FILE}.backup.$(date +%Y%m%d_%H%M%S)"

	echo -n "Backing up target file ($TARGET_FILE -> $BACKUP_FILE): "
	if cp "$TARGET_FILE" "$BACKUP_FILE"; then
		echo "Success!"
	else
		echo "Error! Failed to create backup file"
		exit 1
	fi
else
	echo "Does not exist!"
fi

# Enable Touch ID by uncommenting auth lines
echo -n "Enabling Touch ID authentication in target file ($TARGET_FILE): "
if sed "s/^#auth/auth/" "$TEMPLATE_FILE" > "$TARGET_FILE"; then
	echo "Success!"
else
	echo "Error! Failed to update file"
	exit 1
fi
