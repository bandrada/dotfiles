#!/bin/bash

sudo apt-get -y install \
    default-jdk \
    nodejs \
    python3 \
    gh \

gh auth login

#git clone https://github.com/CTSFW/gsd.git ~/gsd
gh repo clone CTSFW/gsd
cd ~/gsd
python init.py
cd ~/dotfiles

