#!/usr/bin/env fish

# Source and target directories for cursor settings
set --local cursor_user_settings_source_dir ~/.config/Cursor/User/
set --local cursor_user_settings_target_dir ~/Library/Application\ Support/Cursor/User/

# Create the target settings directory if it doesn't exist
mkdir -p $cursor_user_settings_target_dir

# List of cursor settings files to link
set --local cursor_user_settings_files \
	settings.json \
	keybindings.json \
	snippets

for file in $cursor_user_settings_files
	set --local cursor_user_settings_file_source $cursor_user_settings_source_dir/$file
	set --local cursor_user_settings_file_target $cursor_user_settings_target_dir/$file

	# Check if source settings file doesn't exist
	if not test -e $cursor_user_settings_file_source
		continue
	end

	# Check if target settings node is a symlink and points to the correct source file
	if test -L $cursor_user_settings_file_target 
	and test (readlink $cursor_user_settings_file_target) = $cursor_user_settings_file_source
		continue
	end

	# Check if target settings node is a file
	if test -e $cursor_user_settings_file_target
		rm -rf $cursor_user_settings_file_target
	end

	# Create the target settings symlink from the source settings file
	ln -s $cursor_user_settings_file_source $cursor_user_settings_file_target
end

# Get the desired extensions
set --local cursor_extensions_desired (cat ~/.config/Cursor/extensions.txt)

# Get the installed extensions
set --local cursor_extensions_installed (cursor --list-extensions)

# Install the desired extensions
for ext in $cursor_extensions_desired
	if not contains $ext $cursor_extensions_installed
		cursor --install-extension $ext
	end
end
