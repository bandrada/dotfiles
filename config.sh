#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

if ! command -v stow >/dev/null 2>&1; then
	#sudo pacman -S --noconfirm stow
	sudo apt-get -y install stow
fi

if [ -e "$($HOME/.bashrc)" ]; then
	rm .bashrc
fi
if [ -e "$($HOME/.profile)" ]; then
	rm .profile
fi

# Stow everything
for f in ~/dotfiles/configs/*; do
	file=$(basename $f)
	echo -e "\nStowing config: $file"
	stow --dir=$HOME/dotfiles/configs \
		--target=$HOME \
		--override='.*' \
		"$file"
done
