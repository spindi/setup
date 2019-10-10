cd ~
ln -s Setup/git/gitconfig .gitconfig
ln -s Setup/git/gitexcludes .gitexcludes
ln -s Setup/git/gitflow_export .gitflow_export
ln -s Setup/gitignore_global .gitignore_global
cd -

# set git default email
git config --global user.email cboyd@brightcove.com
git config --global user.name "Conor Boyd"
