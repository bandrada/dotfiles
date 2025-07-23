#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

if ! command -v stow >/dev/null 2>&1; then
	#sudo pacman -S --noconfirm stow
	sudo apt-get -y install stow
fi

# Stow everything
#for d in ~/dotfiles/configs/*; do
#	dir=$(basename $d)
#	echo -e "\nStowing config dir: $dir"
#	stow --dir=$HOME/dotfiles/configs \
#		--target=$HOME \
#		--override='.*' \
#		"$dir"
#done

stow bash
stow ghostty
stow nvim
stow tmux

source $HOME/.bashrc
source $HOME/.profile
