if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set the greeting to nothing
set fish_greeting

# Path
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx PATH (brew --prefix openvpn)/sbin $PATH
set -gx PATH (brew --prefix vim)/bin $PATH
set -gx PATH /usr/local/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /home/spindicator/.local/bin $PATH

# Environment
set -gx VISUAL (brew --prefix vim)/bin/vim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR $VISUAL
set -gx BROWSER "explorer.exe" # Uses default browser

# Alias                                                                                                                                                                                                                                     alias d='docker'
source ~/.config/fish/alias_general.fish
source ~/.config/fish/alias_git.fish

# Google Cloud SDK does not like pyenv pythons so use the brew
export CLOUDSDK_PYTHON=/home/linuxbrew/.linuxbrew/Cellar/python@3.9/3.9.9/bin/python3

# Home
cd ~/
# cat /home/spindicator/.banner