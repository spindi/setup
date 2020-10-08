cd ~
ln -s -f Setup/git/gitconfig .gitconfig
ln -s -f Setup/git/gitexcludes .gitexcludes
ln -s -f Setup/git/gitflow_export .gitflow_export
ln -s -f Setup/gitignore_global .gitignore_global
cd -

# set git default email
git config --global user.email conor.boyd@spindicator.com
git config --global user.name "Conor Boyd"
