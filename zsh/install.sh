BASE=${HOME}/.oh-my-zsh

# config
ln -s -f ~/Setup/zsh/zshrc ~/.zshrc

# plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${BASE}/plugins/zsh-syntax-highlighting"
git clone git://github.com/zsh-users/zsh-autosuggestions "${BASE}/plugins/zsh-autosuggestions"
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git "${BASE}/plugins/autoswitch_virtualenv"
sudo apt install pwgen # needed for autoswitch

# spaceship prompt
# git clone https://github.com/denysdovhan/spaceship-prompt.git "${BASE}/custom/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${BASE}/custom/themes/spaceship.zsh-theme"
