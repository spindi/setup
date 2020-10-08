#!/bin/bash

KITTY_CONFIG_DIR=~/.config/kitty

mkdir -p ${KITTY_CONFIG_DIR} 
cd ${KITTY_CONFIG_DIR}
ln -s -f ~/Setup/kitty/kitty.conf
