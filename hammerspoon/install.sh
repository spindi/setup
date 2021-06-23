#!/bin/bash
brew install --cask hammerspoon
rm -f ./hammerspoon/init.lua

ln -s -f ~/Setup/hammerspoon/assets ./.hammerspoon/assets
ln -s -f ~/Setup/hammerspoon/keyboard ./.hammerspoon/keyboard
ln -s -f ~/Setup/hammerspoon/misc ./.hammerspoon/misc
ln -s -f ~/Setup/hammerspoon/window ./.hammerspoon/window
ln -s -f ~/Setup/hammerspoon/init.lua ./.hammerspoon/init.lua
