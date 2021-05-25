cd ~
ln -s -f Setup/git/gitconfig .gitconfig
cd -

git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.dt difftool
git config --global alias.st status

# set git default email
git config --global user.email conor.boyd@spindicator.com
git config --global user.name "Conor Boyd"
