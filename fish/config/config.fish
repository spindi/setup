if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set the greeting to nothing
set -g fish_greeting

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
set -gx PATH $HOME/miniconda3/bin $PATH  # commented out by conda initialize

# Environment
set -gx VISUAL (brew --prefix nvim)/bin/nvim
set -gx EDITOR $VISUAL
# set -gx GIT_EDITOR "$VISUAL --noplugin"
set -gx GIT_EDITOR $VISUAL
set -gx BROWSER "explorer.exe" # Uses default browser
set -gx XDG_DATA_DIRS /var/lib/flatpak/exports/share:$XDG_DATA_DIRS
set -gx XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # stop poetry adding in the prompt twice

# Alias
source ~/.config/fish/alias_general.fish
source ~/.config/fish/alias_git.fish
if test (hostname) = "PF3TSGLG"
  source ~/.local/bin/alias_planet.fish
end

# Token
#source ~/.ssh/tokens.sh

# Google Cloud SDK does not like pyenv pythons so use the brew
# export CLOUDSDK_PYTHON=/home/linuxbrew/.linuxbrew/opt/python@3.9/bin/python3.9

# Ulimit
ulimit -n 16384

# Home
if test (pwd | tr '[:upper:]' '[:lower:]') = '/mnt/c/windows/system32'
    cd ~/
end

# pyenv
# https://gist.github.com/entropiae/326611addf6662d1d8fbf5792ab9a770
# sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx CONFIGURE_OPTS "-with-openssl="(brew --prefix openssl)
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
pyenv init - | source
pyenv virtualenv-init - | source
pyenv shell 3.11 # default python to use in shell

# conda
set -gx CONDA_LEFT_PROMPT 1
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f $HOME/miniconda3/bin/conda
#     eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# # <<< conda initialize <<<
# # deactivate default config
conda deactivate
# virtual auto activator
auto_activate_virtual

# set the keyboard repeat and delay
xset r rate 350 60

# set the touchpad not to accelerate
xinput set-prop "Apple Inc. Magic Trackpad 2" "libinput Accel Speed" 0 1>/dev/null 2>&1

# set the dircolors env LS_COLORS
source $HOME/Documents/Repo/Setup/dircolors/dircolors.256dark.encoded.fish
