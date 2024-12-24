#!/usr/bin/env fish

# Download and install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Source the default nix profile
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
