#!/home/linuxbrew/.linuxbrew/bin/fish

sudo apt install fontconfig
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd -
rm Meslo.zip
fc-cache -fv
