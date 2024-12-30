if not status is-interactive
	exit
end

function __configure_fzf --on-event fzf_install
	if command --query fzf
		__set_fzf_default_options

		if functions -q fzf_configure_bindings
			__set_fzf_fish_bindings

			if command --query eza
				__set_fzf_fish_eza_options
			end

			if command --query fd
				__set_fzf_fish_fd_options
			end
		end
	end
end

function __set_fzf_default_options
	set --export FZF_DEFAULT_OPTS '--ansi --border --color prompt:blue,pointer:white,marker:green:bold,info:yellow,hl:green,spinner:cyan --cycle --height 40% --marker ✓ --layout reverse --pointer ❯ --preview-window=wrap --prompt "❯ "'
end

function __set_fzf_fish_bindings
	# Ctrl+F : Search directories and cd into selected
	# Ctrl+L : Browse git log
	# Ctrl+S : Show git status and add/reset files
	# Ctrl+P : Show processes
	# Ctrl+V : Show variables
	# Ctrl+R : Show history
	fzf_configure_bindings \
		--directory=\cf \
		# --git_log=\cl \
		--git_status=\cs \
		--processes=\cp \
		--variables=\cv \
		--history=\cr
end

function __set_fzf_fish_eza_options
	set --global fzf_preview_dir_cmd eza --all --color=always
end

function __set_fzf_fish_fd_options
	set --global fzf_fd_opts --follow --hidden --exclude=Documents --exclude=Library --exclude=.git

	set --export FZF_DEFAULT_COMMAND "fd --type f --color always $fzf_fd_opts"
end

__configure_fzf
