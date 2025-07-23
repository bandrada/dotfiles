#!/bin/bash

pacman -S --needed --noconfirm base-devel
sed -i '/^\[options\]/a Color\nILoveCandy' /etc/pacman.conf

pacman -S --noconfirm --needed \
	wget curl unzip inetutils impala \
	fd eza fzf ripgrep zoxide bat \
	wl-clipboard fastfetch btop \
	man tldr less whois plocate bash-completion
