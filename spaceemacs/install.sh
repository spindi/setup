# install emacs plus
brew tap d12frosted/emacs-plus
brew install emacs-plus@28 --with-spacemacs-icon
brew link emacs-plus
# install fonts
brew install svn
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
# install spaceemacs
mv ~/.emacs.d ~/.emacs.d.pre-spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
