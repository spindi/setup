sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# theme
# NOTE: link file into themes
# git clone https://github.com/romkatv/powerlevel10k.git

# plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-history-substring-search
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
# git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git
# brew install pwgen # needed for autoswitch

brew install git
brew install coreutils # gls amongst others
brew install font-fira-code-nerd-font # ligatures
brew install fzf
brew install vivid # lscolors
brew install lazygit
brew install karabiner-elements # replacing the top left stupid key on a brit keyb
brew install mc
brew install go
brew install node # needed for some of the lspconfig stuff in mason
brew install ripgrep
brew install fd # export FZF_DEFAULT_COMMAND='fd'
