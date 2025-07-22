#!/bin/bash

pacman -S --noconfirm \
  jdk-openjdk \
  nodejs-lts-jod \
  python \
  github-cli \
  sfdx-cli \
  powershell-bin

gh auth login

#git clone https://github.com/CTSFW/gsd.git ~/gsd
gh repo clone CTSFW/gsd
cd ~/gsd
python init.py
cd ~/dotfiles

