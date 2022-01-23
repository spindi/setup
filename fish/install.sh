#!/bin/bash

brew install fish
cd ~/.config
ln -s ~/Setup/fish/config/ ./fish
fish

# install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
brew install fzf
sudo apt install fd-find
sudo apt install bat
fisher install PatrickF1/fzf.fish
fisher install sentriz/fish-pipenv
fisher install edc/bass
# fisher install oh-my-fish/theme-bobthefish
fisher install oh-my-fish/theme-agnoster
