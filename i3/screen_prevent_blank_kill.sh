#!/home/linuxbrew/.linuxbrew/bin/fish

# kill previous instances
ps -ef | grep '/home/linuxbrew/.linuxbrew/bin/fish /home/conor.boyd/.config/i3/screen_prevent_blank.sh' | awk '{print $2}' | xargs kill
