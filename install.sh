#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31m Installation failed!\e[0m"
}

trap catch_errors ERR

echo -e "\nCloning dotfiles..."
rm -rf ~/dotfiles
git clone https://github.com/bandrada/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install everything
for f in /scripts/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done

sudo pacman -S --noconfirm stow

# Stow everything
for d in /configs/*; do
  echo -e "\nStowing config: $d"
  stow "$d -n"
done
#stow bash
#stow ghostty
#stow nvim
#stow tmux

gum confirm "sudo updatedb?" && sudo updatedb
gum confirm "reboot?" && reboot
