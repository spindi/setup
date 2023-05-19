#!/bin/bash

nohup rclone mount dropbox_obsidian:Documents/Obsidian /home/conor.boyd/Documents/Obsidian/ 1>/tmp/dropbox-obsidian.log 2>&1 &
