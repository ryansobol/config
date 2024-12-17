# Consider trying devbox and direnv
# https://github.com/cfergeau/devbox
# https://github.com/direnv/direnv

function _go_install --on-event go_install
	brew install go

	set --export --universal GOPATH $HOME/.go

	mkdir -p (go env GOPATH)/bin

	fish_add_path (go env GOPATH)/bin
end

function _go_uninstall --on-event go_uninstall
	set --local index (contains --index (go env GOPATH)/bin $fish_user_paths)
	set --erase --universal fish_user_paths[$index]

	rm -rf (go env GOPATH)

	set --erase --universal GOPATH

	brew uninstall go
end
