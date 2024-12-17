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

set --local cursor_extensions \
	766b.go-outliner \
	anysphere.pyright \
	biomejs.biome \
	blodwynn.featurehighlight \
	bradlc.vscode-tailwindcss \
	catppuccin.catppuccin-vsc \
	catppuccin.catppuccin-vsc-icons \
	dbaeumer.vscode-eslint \
	editorconfig.editorconfig \
	eriklynd.json-tools \
	esbenp.prettier-vscode \
	etsi0.class-collapse \
	golang.go \
	julienetie.vscode-template-literals \
	kamikillerto.vscode-colorize \
	lextudio.restructuredtext \
	mariomatheu.syntax-project-pbxproj \
	mechatroner.rainbow-csv \
	meganrogge.template-string-converter \
	ms-azuretools.vscode-docker \
	ms-python.debugpy \
	ms-python.python \
	ms-python.vscode-pylance \
	ms-vscode.atom-keybindings \
	ms-vscode.theme-tomorrowkit \
	nhoizey.gremlins \
	oven.bun-vscode \
	pkief.material-icon-theme \
	premparihar.gotestexplorer \
	prisma.prisma \
	quicktype.quicktype \
	rangav.vscode-thunder-client \
	skyapps.fish-vscode \
	svelte.svelte-vscode \
	tamasfe.even-better-toml \
	tomoki1207.pdf \
	trixnz.go-to-method \
	vitest.explorer \
	yoavbls.pretty-ts-errors \
	yzhang.markdown-all-in-one
