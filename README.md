# kudos
Koala's Unified and Declarative Operating System

will document this more when there are fewer moving parts

## Installation
Boot into a NixOS live key. And run the following commands, making sure to set your passwords when prompted to.
```sh
nix run github:koalagang/kudos --no-write-lock-file # one-commmand install
shutdown now
# next, remove USB stick from the computer and then turn your system back on

# post-installation requires one rebuild to deploy out-of-store symlinks
# (this part of the installation will not be necessary once I stop using these symlinks for eww and neovim)
mkdir -p ~g
~g
g c https://github.com/koalagang/kudos.git
mv kudos ~g/kudos
cd kudos
run nixos-rebuild switch --flake $PWD/#Myla
```
