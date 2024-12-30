# If you switch shells within Ghostty (i.e. you use a command like `nix-shell` or `devbox shell`),
# the ghostty shell integration will be lost in that shell (it will keep working in the original
# shell process).
#
# To make shell integration work in these cases, you must manually source the Ghostty
# shell-specific integration script.
#
# See https://ghostty.org/docs/features/shell-integration#switching-shells-with-shell-integration
if test -n "$GHOSTTY_RESOURCES_DIR"
	. "$GHOSTTY_RESOURCES_DIR"/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end
