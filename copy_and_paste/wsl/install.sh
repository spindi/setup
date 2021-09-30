#!/bin/bash
# If you get /mnt/c/ errors then you need to restart the WSL subsystem "wsl.exe --shutdown"
cd /usr/local/bin
sudo ln -s -f ~/Setup/copy_and_paste/wsl/pbcopy . 
sudo ln -s -f ~/Setup/copy_and_paste/wsl/pbpaste . 
