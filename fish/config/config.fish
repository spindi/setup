if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set the greeting to nothing
set fish_greeting

# Pipenv fancy
set pipenv_fish_fancy yes

# Path
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/local/sbin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/opt/coreutils/libexec/gnubin $PATH
# set -gx PATH (brew --prefix openvpn)/sbin $PATH
# set -gx PATH (brew --prefix vim)/bin $PATH
# set -gx PATH $HOME/Documents/Code/miniconda3/bin $PATH  # commented out by conda initialize

# Environment
set -gx VISUAL (brew --prefix nvim)/bin/nvim
set -gx EDITOR $VISUAL
set -gx GIT_EDITOR "$VISUAL --noplugin"
set -gx BROWSER "explorer.exe" # Uses default browser
set -gx XDG_DATA_DIRS /var/lib/flatpak/exports/share:$XDG_DATA_DIRS
set -gx XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS

# Alias
source ~/.config/fish/alias_general.fish
source ~/.config/fish/alias_git.fish
bass source $HOME/.local/bin/planet_alias

# Token
#source ~/.ssh/tokens.sh

# Google Cloud SDK does not like pyenv pythons so use the brew
export CLOUDSDK_PYTHON=/home/linuxbrew/.linuxbrew/opt/python@3.9/bin/python3.9

# Ulimit
ulimit -n 16384

# Home
if test (pwd | tr '[:upper:]' '[:lower:]') = '/mnt/c/windows/system32'
    cd ~/
end

# pyenv
# https://gist.github.com/entropiae/326611addf6662d1d8fbf5792ab9a770
# sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx CONFIGURE_OPTS "-with-openssl="(brew --prefix openssl)
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
pyenv init - | source
pyenv virtualenv-init - | source

set -gx CONDA_LEFT_PROMPT 1
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f $HOME/Documents/Code/miniconda3/bin/conda
#     eval $HOME/Documents/Code/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# # <<< conda initialize <<<
conda deactivate
