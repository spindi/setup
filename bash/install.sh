brew install coreutils
brew install wget
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark

ln -s -f ~/Setup/bash/profile .bash_profile
# for screen
ln -s -f ~/Setup/bash/profile .bashrc
ln -s -f ~/Setup/bash/inputrc .inputrc
ln -s -f ~/Setup/bash/dircolors.256dark .dir-colors
